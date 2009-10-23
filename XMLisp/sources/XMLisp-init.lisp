;; Start XMlisp
;; 04/24/09 Alexander Repenning
;; 5/20/09 + speech
;; for CCL 1.3 
;; 5/28/09
;; 07/15/09 + font support
;; just testing

(in-package :cl-user)

;***************** Settings

;; edit to point to root folder containing /sources  /resources  etc.
(setf (logical-pathname-translations "lui")
      '(("**;*.*" "home:working copies;XMLisp svn;trunk;XMLisp;**;")))


#-cocotron
(setq gui::*paren-highlight-background-color*
      (#/retain (#/colorWithCalibratedRed:green:blue:alpha: ns:ns-color 0.9 0.8 0.8 1.0)))

#-cocotron
(setq GUI::*Editor-keep-backup-files* nil)

(setq ccl::*verbose-eval-selection* t)

;; Load

;; IDE

#-cocotron (load "lui:sources;IDE;specific;Mac CCL;anticipat-symbol-complete")
#-cocotron (load "lui:sources;IDE;specific;Mac CCL;ns timer")
#-cocotron (load "lui:sources;IDE;specific;Mac CCL;GLDocs")
#-cocotron (load "lui:sources;IDE;specific;Mac CCL;hemlock extensions")


;; Open

;;(ed "lui:sources;XLUI;examples;2D;test case examples.lisp")
;; (ed "lui:sources;XLUI;examples;AgentCubes Design.lisp")

;;(ed "lui:sources;Lisp User Interface;LUI.lisp")
;;(ed "lui:sources;Lisp User Interface;specific;Mac CCL;LUI Cocoa.lisp")


;;****** INFIX

(defpackage :INFIX
  (:use :common-lisp))


;;****** OpenGL

(defpackage :OPENGL
  (:use :common-lisp))

(load "lui:sources;OpenGL;specific;Mac CCL;OpenGL-interface")

;;****** LUI

(defpackage :LUI
  (:use :common-lisp :ccl :opengl)
  (:export 
   "MOUSE-EVENT" "TRACK-MOUSE" "VIEW-MOUSE-MOVED-EVENT-HANDLER" "VIEW-LEFT-MOUSE-DOWN-EVENT-HANDLER"
   "VIEW-LEFT-MOUSE-UP-EVENT-HANDLER" "VIEW-LEFT-MOUSE-DRAGGED-EVENT-HANDLER"
   "COMMAND-KEY-P" "SHIFT-KEY-P" "ALT-KEY-P" "CONTROL-KEY-P" "DOUBLE-CLICK-P"
   "WINDOW" "VIEW" "X" "Y" "WIDTH" "HEIGHT" "SHOW" "SHOW-AND-RUN-MODAL" "STOP-MODAL" "CANCEL-MODAL" "HIDE" 
   "SWITCH-TO-FULL-SCREEN-MODE" "SWITCH-TO-WINDOW-MODE" "FULL-SCREEN" "WINDOW-CLOSE"
   "FIND-WINDOW-AT-SCREEN-POSITION" "FIND-VIEW-CONTAINING-POINT" "FIND-VIEW-AT-SCREEN-POSITION"
   "SCROLL-VIEW" "HAS-HORIZONTAL-SCROLLER" "HAS-VERTICAL-SCROLLER"
   "SET-SIZE" "SET-POSITION" "DISPLAY" "DRAW" "INIT" "CLEAR-BACKGROUND" "RECURSIVE-MAP-SUBVIEWS"
   "WINDOW-X" "WINDOW-Y"
   "RECTANGLE-VIEW" "SET-COLOR"
   "ZOOMABLE" "MINIMIZABLE" "RESIZABLE" "CLOSEABLE" "TITLE"
   "SCREEN-WIDTH" "SCREEN-HEIGHT" "CONTROL" "VALUE" "INITIALIZE-EVENT-HANDLING" "SIZE-CHANGED-EVENT-HANDLER"
   "ACTION" "SUBVIEWS" "DO-SUBVIEWS" "MAP-SUBVIEWS" "ADD-SUBVIEW" "ADD-SUBVIEWS" "SET-FRAME"
   "BUTTON-CONTROL" "DEFAULT-BUTTON"
   "INVOKE-ACTION"
   "BEVEL-BUTTON-CONTROL" "SLIDER-CONTROL" "TICK-MARKS" "MIN-VALUE" "MAX-VALUE"
   "LABEL-CONTROL" "TEXT" "ALIGN"
   "EDITABLE-TEXT-CONTROL"
   "VALUE"
     "IMAGE-CONTROL" "SRC" "FILE"
   "RADIO-BUTTON-CONTROL"
   "DEFAULT-ACTION"
   "CHECKBOX-CONTROL" "START-CHECKED" "IMAGE-ON-RIGHT"
   "IMAGE-BUTTON-CONTROL" "IMAGE" 
   "RADIO-BUTTON-CONTROL" "ADD-ITEM" "FINALIZE-CLUSTER" "RADIO-ACTION"
   "POPUP-BUTTON-CONTROL" "add-item" "get-selected-action" "POPUP-ACTION"
   "TAB-VIEW-CONTROL" "ADD-TAB-VIEW-ITEM"
   "TAB-VIEW-ITEM-CONTROL" "ADD-TAB-VIEW-ITEM-VIEW"
   "CHOICE-BUTTON-CONTROL" "ADD-MENU-ITEM" "GET-SELECTED-ACTION" "CHOICE-BUTTON-ACTION"
   "COLOR-WELL-CONTROL" "COLOR" "GET-RED" "GET-GREEN" "GET-BLUE" "GET-ALPHA" "SHOW-ALPHA"
   "WEB-BROWSER-CONTROL" "URL"
   "OPENGL-VIEW" "FRAME-RATE" "ANIMATE" "START-ANIMATION" "STOP-ANIMATION" "IS-ANIMATED" "FULL-SCENE-ANTI-ALIASING"
    "USE-TEXTURE"
    "CREATE-TEXTURE-FROM-FILE"
    "SEPERATOR-CONTROL"
    "native-view"
   "CAMERA" "EYE-X" "EYE-Y" "EYE-Z" "CENTER-X" "CENTER-Y" "CENTER-Z"  "UP-X" "UP-Y" "UP-Z"
   "FOVY" "ASPECT" "NEAR" "FAR" "AZIMUTH" "ZENITH"
   "AIM-CAMERA" "WITH-GLCONTEXT" "WITH-GLCONTEXT-NO-FLUSH" "RENDER-FOR-SELECTION-MODE"
   "SHARED-OPENGL-VIEW"
   "NATIVE-PATH"
   ;; Dialogs
   "STANDARD-ALERT-DIALOG"
   ;; colors
   "*SYSTEM-SELECTION-COLOR*"
   ;; Multimedia
   "PLAY-SOUND"
   "SYNTHESIZER" "SPEAK" "WILL-SPEAK-WORD" "WILL-SPEAK-PHONEME" "DID-FINISH-SPEAKING" "AVAILABLE-VOICES"
   ;; native support
   "NATIVE-STRING"
   ))


(defun LUI::NATIVE-PATH (Directory-Name File-Name) "
  in: Directory-Name logical-pathname-string, e.g., ''lui:resources;textures;''
      File-Name string.
  out: Native-Path-String
  Create a native, OS specific, path from a platform independend URL style path"
  (format nil "~A~A" (truename Directory-Name) File-Name))




;; frameworks

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ccl:use-interface-dir :GL)
  #-windows-target (open-shared-library "/System/Library/Frameworks/OpenGL.framework/OpenGL")
  #+windows-target (open-shared-library "opengl32.dll"))


;; files

(load "lui:sources;Lisp User Interface;specific;Mac CCL;memory")
(load "lui:sources;Lisp User Interface;LUI")
(load "lui:sources;Lisp User Interface;OpenGL-view")
(load "lui:sources;Lisp User Interface;specific;Mac CCL;LUI Cocoa")
(load "lui:sources;Lisp User Interface;specific;Mac CCL;image-import")
(load "lui:sources;Lisp User Interface;specific;Mac CCL;OpenGL-view Cocoa")
(load "lui:sources;Lisp User Interface;Camera")
(load "lui:sources;Lisp User Interface;specific;Mac CCL;Transparent-OpenGL-Window")
(load "lui:sources;Lisp User Interface;specific;Mac CCL;speech")

;****** XMLisp

(defpackage :XML
  (:export "XML-SERIALIZER"))

(load "lui:sources;XMLisp;XMLisp")


;****** XLUI

(defpackage :XLUI
  (:use :common-lisp :XML :LUI :opengl))

(setq xml::*xmlisp-packages* (list (find-package :xlui) (find-package :xml)))


(load "lui:sources;XLUI;xml-layout")
(load "lui:sources;XLUI;controls")      ;; LOTS of undefined functions still!
(load "lui:sources;XLUI;application-window")
(load "lui:sources;XLUI;dialog-window")
(load "lui:sources;XLUI;Font-Manager")
(load "lui:sources;XLUI;String-Shape")
(load "lui:sources;XLUI;Cursor-Manager")
(load "lui:sources;XLUI;agent-3D")
(load "lui:sources;XLUI;image editor;selection-mask")
(load "lui:sources;XLUI;image editor;image-editor")


;; Agent Warp Engine
(load "lui:sources;XLUI;AWE;infix")
(load "lui:sources;XLUI;AWE;VAT-Formulas")
(load "lui:sources;XLUI;AWE;Equation")
(load "lui:sources;XLUI;AWE;Morph")


;******** Multimedia

(defpackage :sound
  (:use :common-lisp :ccl)
  (:export "PLAY-SOUND"))


;;*************** Build functions

(defun ccl::CCL-CONTENTS-DIRECTORY ()
  (let* ((heap-image-path (ccl::%realpath (ccl::heap-image-name))))
    (make-pathname :directory (butlast (pathname-directory heap-image-path))
                   :device (pathname-device heap-image-path))))


(defun RESTORE-XMLISP ()
  (let* ((contents-dir (ccl::ccl-contents-directory))
         (toplevel-dir (make-pathname :directory (butlast (pathname-directory contents-dir) 2)
                                      :device (pathname-device contents-dir))))
    (setf (logical-pathname-translations "lui")
          `(("examples;**;*.*" ,(merge-pathnames "examples/**/*.*" toplevel-dir))
            ("**;*.*" ,(merge-pathnames "**/*.*" contents-dir)))))
  #+windows-target (open-shared-library "opengl32.dll"))


(defclass xmlisp-application (gui::cocoa-application)
  ())

(defmethod ccl::application-init-file ((app xmlisp-application))
  '("home:xmlisp-init" "home:\\.xmlisp-init"))


(defun BUILD-XMLISP ()
  (setq *Package* (find-package :xlui))
  (require :build-application)
  ;; load a different init file
  ;; create LUI host pointing to application bundle
  (pushnew 'restore-xmlisp *restore-lisp-functions*)

  (format t "~%- create directories and files")
  (multiple-value-bind (Path Exists)
                       (create-directory (format nil "~ADesktop/XMLisp/" (user-homedir-pathname)))
    (declare (ignore Path))
   (unless Exists
      (error "XMLisp folder on desktop already exists")))

  (format t "~%- copy examples")
  (ccl::recursive-copy-directory
   (truename "lui:sources;XLUI;examples;")
   (format nil "~ADesktop/XMLisp/examples/" (user-homedir-pathname)))

  (finish-xmlisp)

  (ccl::build-application 
   :name "XMLisp"
   :directory (format nil "~ADesktop/XMLisp/" (user-homedir-pathname))
   :application-class 'xmlisp-application
   :nibfiles '("lui:resources;English.lproj;MainMenu.nib")))


(defun FINISH-XMLISP ()
  (format t "~%- copy image resources")
  (ccl::recursive-copy-directory
   (truename "lui:resources;images;")
   (format nil "~ADesktop/XMLisp/XMLisp.app/Contents/Resources/images/" (user-homedir-pathname)))
  (format t "~%- copy sounds resources")
  (ccl::recursive-copy-directory
   (truename "lui:resources;sounds;")
   (format nil "~ADesktop/XMLisp/XMLisp.app/Contents/Resources/sounds/" (user-homedir-pathname)))
  (format t "~%- copy texture resources")
  (ccl::recursive-copy-directory
   (truename "lui:resources;textures;")
   (format nil "~ADesktop/XMLisp/XMLisp.app/Contents/Resources/textures/" (user-homedir-pathname)))
  (format t "~%- copy font resources")
  (ccl::recursive-copy-directory
   (truename "lui:resources;fonts;")
   (format nil "~ADesktop/XMLisp/XMLisp.app/Contents/Resources/fonts/" (user-homedir-pathname)))
  (format t "~%- copy cursor resources")
  (ccl::recursive-copy-directory
   (truename "lui:resources;cursors;")
   (format nil "~ADesktop/XMLisp/XMLisp.app/Contents/Resources/cursors/" (user-homedir-pathname)))
  (format t "~%- copy window resources")
  (ccl::recursive-copy-directory
   (truename "lui:resources;windows;")
   (format nil "~ADesktop/XMLisp/XMLisp.app/Contents/Resources/windows/" (user-homedir-pathname)))
  (format t "~%- patch info plist resources")
  (copy-file 
   (truename "lui:resources;English.lproj;InfoPlist.strings")
   (format nil "~ADesktop/XMLisp/XMLisp.app/Contents/Resources/English.lproj/InfoPlist.strings" (user-homedir-pathname))
   :if-exists :supersede))

#| 

(build-xmlisp)

|#
