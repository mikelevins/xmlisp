;;;-*- Mode: Lisp; Package: xlui -*-
;*********************************************************************
;*                                                                   *
;*    PROGRAM     VAT   F O R M U L A S                              *
;*                                                                   *
;*********************************************************************
   ;* Author    : Alexander Repenning (alexandr@agentsheets.com)     *
   ;*             http://www.agentsheets.com                         *
   ;* Copyright : (c) 1996-2008, AgentSheets Inc.                    *
   ;* Filename  : VAT-Formulas.lisp                                  *
   ;* Updated   : 05/03/08                                           *
   ;* Version   :                                                    *
   ;*    1.0    : 09/10/99 Stub for Property-Editor.lisp             *
   ;*    1.1    : 11/26/99 IS-VAT-FORMULA-ATTRIBUTE-OR-SIMULATION-.. *
   ;*    2.0    : 12/17/04 VAT 2, XML based                          *
   ;*    2.0.1  : 10/07/05 AI: above, below attribute acceessors     *
   ;*    2.0.2  : 02/15/06 clear-properties                          *
   ;*    2.0.3  : 02/22/06 AS win uses attr[top], attr[bottom]       *
   ;*    2.1    : 03/15/06 VAT formula macros, e.g., cubesum(blue)   *
   ;*    2.1.1  : 04/24/06 negate row reference in attriute access   *
   ;*    2.1.2  : 04/26/06 float-expression                          *
   ;*    2.1.3  : 10/11/07 slider macro to access world animation    *
   ;*    2.1.4  : 05/03/08 do not macroexpand "and" and "or"         *
   ;* SW/HW     : PowerPC, G4, OS X 10.5.2, MCL 5.2                  *
   ;* Abstract  : VAT formulas.                                      *
   ;*                                                                *
   ;******************************************************************

(in-package :xlui)

(export '(INFIX->POSTFIX IS-VAT-FORMULA-ATTRIBUTE-OR-SIMULATION-PROPERY 
          IS-GLOBAL-VARIABLE STRIP-GLOBAL-VARIABLE-PREFIX
          EXPAND-VAT-FORMULA))

;_________________________________________
;  Infix -> Prefix Functions              |
;________________________________________/


(defvar *Global-Variable-Prefix-Char* #\@ "The character used as symbol prefix to designate a global variable, i.e., a simulation property")

(defvar *Infix->Postfix-Expansion-Lock* nil)

(defun INFIX->POSTFIX-EXPANSION-LOCK ()
  (or *Infix->Postfix-Expansion-Lock*
      (setq *Infix->Postfix-Expansion-Lock* (ccl::make-lock "Infix->Postfix lock"))))
 

(defun INFIX->POSTFIX (Object) "
  in:  Object {t}.
  out: S-Expression {t}.
  Convert infix to prefix notation.
  An infix expression either has to be string such as \"5 + 7\"
  a number type, or a symbol."
  (typecase Object
    (number Object)
    (symbol Object)
    (string 
     (ignore-errors
      (values (ccl::with-lock-grabbed ((infix->postfix-expansion-lock))
                (read-from-string (concatenate 'string "#i(" Object ")"))))))
    (t (error "Cannot understand ~A in Visual AgenTalk formula" Object))))

;_________________________________________
;  Validation                             |
;________________________________________/

(defun IS-GLOBAL-VARIABLE (Name) "
  in:  Name {symbol or string}.
  out: {boolean}.
  Return non nil if <Name> is refering to global variable."
  (char= (char
          (if (stringp Name)
            Name
            (symbol-name Name))
          0)
         *Global-Variable-Prefix-Char*))


(defun IS-VAT-FORMULA-ATTRIBUTE-OR-SIMULATION-PROPERY (Name) "
  in:  Name {symbol or string}.
  out: {boolean}.
  Return non nil if <Name> is refering either to a 
    proper agent attribute name or a
    proper simulation property name."
  (let* ((String (if (stringp Name) Name (symbol-name Name)))
         (Name-String (if (is-global-variable Name) (subseq String 1) String)))
    (and (some #'alpha-char-p Name-String)
         (every #'(lambda (Char)
                    (or (alphanumericp Char)
                        (char= #\_ Char)))
                Name-String))))


(defun STRIP-GLOBAL-VARIABLE-PREFIX (Name) "
  in:  Name {symbol}.
  out: Stripped-Name {symbol}.
  If <Name> includes the global variable prefix strip it."
  (if (is-global-variable Name)
    (intern 
     (subseq (symbol-name Name) 1)
     (symbol-package Name))
    Name))

;_________________________________________
;  VAT Macros                             |
;________________________________________/

(defmacro CUBESUM (Attribute &optional (Distance 1)) "
  in: Attribute symbol, &optional Distance default 1.
 Add the <attribute> attributes of all the neighbouring agents but exclude self. Example \"cubesum(blue)\""
  `(reduce-neighbours 
    Self 
    #'(lambda (Agent) (get-agent-attribute-value Agent ',Attribute))
    #'+
    ,Distance))


(defmacro SLIDER () "
  Access the delay-time value of the world set via slider"
  `(user-animation-time Self))


;_________________________________________
;  Expansion Functions                    |
;________________________________________/

(defun EXPAND-VAT-FORMULA-AREF (Formula)
  (ecase (length Formula)
    ((4 5)   ;; must be at least two numerical arguments
     `(message 
       Self
       ;; Row: negate for <0,0> lower left origin
       ,(if (numberp (expand-vat-formula (third Formula)))
          (- (expand-vat-formula (third Formula)))
          `(- ,(expand-vat-formula (third Formula))))
       ;; column
       ,(expand-vat-formula (fourth Formula))
       ,(if (fifth Formula)
          (expand-vat-formula (fifth Formula))
          0)
       #'get-agent-attribute-value 
       ',(second Formula)))
    (3   ;; symbolic reference
     (ecase (third Formula)
       (left  `(message Self 0 -1 0 #'get-agent-attribute-value ',(second Formula)))
       (right `(message Self 0 +1 0 #'get-agent-attribute-value ',(second Formula)))
       (up    `(message Self +1 0 0 #'get-agent-attribute-value ',(second Formula)))
       (down  `(message Self -1 0 0 #'get-agent-attribute-value ',(second Formula)))
       (layer_above    `(message Self 0 0 +1 #'get-agent-attribute-value ',(second Formula)))
       (layer_below    `(message Self 0 0 -1 #'get-agent-attribute-value ',(second Formula)))
       (stacked_below    
        `(if (agent-below self)
           (get-agent-attribute-value (agent-below self)  ',(second Formula))
           0.0))
       (stacked_above    
        `(if (agent-above self)
           (get-agent-attribute-value (agent-above self)  ',(second Formula))
           0.0))
       ((top above) 
        `(let ((Agent (agent-above Self)))
           (when Agent
             (get-agent-attribute-value Agent ',(second Formula)))))
       ((bottom below) 
        `(let ((Agent (agent-below Self)))
           (when Agent
             (get-agent-attribute-value Agent ',(second Formula)))))))))


(defun EXPAND-VAT-FORMULA (Formula) "
  in:  Formula {t}
  out: Expanded-Formula {t}.
  Expand <Formula> by subsituting 
  - attribute names with attibute access forms
  - array accesses with agent accesses."
  (cond
   ((symbolp Formula)
    (if (is-global-variable Formula)
      `(get-simulation-property-value Self ',(strip-global-variable-prefix Formula))
      `(get-agent-attribute-value Self ',Formula)))
   ((atom Formula) Formula)
   ;; (- 7) -> -7
   ((and (listp Formula) (eq (first Formula) '-) (= (length Formula) 2) (atom (second Formula)) (numberp (second Formula)))
        (- (second Formula)))
   ;; macros but don't process parameters
   ((and (listp Formula) 
         (macro-function (first Formula))  
         (not (member (first Formula) '(and or)))) ;; but not for special operators such as and and or
    (macroexpand Formula))
   ((listp (first Formula))
    (mapcar #'expand-vat-formula Formula))
   ((and (symbolp (first Formula)) (eq (first Formula) 'aref))
    `(or ,(expand-vat-formula-aref Formula) 0))
   (t 
    (if (fboundp (first formula))
      ;; If the function does not exist just return 0.0
      (cons 
       (first Formula)
       (mapcar #'expand-vat-formula (rest Formula)))
      0.0))))


(defmethod EXPAND ((Self string))
  ;; assume that string is an VAT formula
  (let ((Value (expand-vat-formula (infix->postfix Self))))
    (typecase Value
      (fixnum Value)
      (float (float Value 0s0)) ;; short float
      (t Value))))


(defmethod FLOAT-EXPRESSION ((Self t))
  `(float ,Self 0.0))

(defmethod FLOAT-EXPRESSION ((Self integer))
  (float Self 0.0))

(defmethod FLOAT-EXPRESSION ((Self float))
  (float Self 0.0))




#| Examples:

(infix->postfix "-7")

(expand "-7")

(expand "180")

(expand "s + 1")

(expand "1s+1")

(expand "180.0")

(expand "5 + 7")

(expand "5 + 2 * x")

(expand "(5 + 2) * x")

(expand "5 + @cycles")

(expand "age[left]")

(expand "age{left}")

(expand "age#left")

(expand "age[-1, 1]")


(expand "age[2, 3, 4] + height[right]")

(expand "age[2, 3, 4, 5]")  ;; error

(float-expression -7)

(float-expression 0d0)

(float-expression (expand "5 + 7"))


|#