;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: FLEXI-STREAMS; Base: 10 -*-
;;; $Header: /usr/local/cvsrep/flexi-streams/code-pages.lisp,v 1.7 2008/05/18 21:32:15 edi Exp $

;;; Copyright (c) 2005-2008, Dr. Edmund Weitz.  All rights reserved.

;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:

;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.

;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.

;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package :flexi-streams)

;;; the following code was auto-generated with LWW

(defconstant +code-page-tables+
  `((437 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 228 224 229 231 234 235 232 239 238 236 196 197 201 230 198 244 246 242 251 249 255 214 220 162 163 165 8359 402 225 237 243 250 241 209 170 186 191 8976 172 189 188 161 171 187 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 945 223 915 960 931 963 181 964 934 920 937 948 8734 966 949 8745 8801 177 8805 8804 8992 8993 247 8776 176 8729 183 8730 8319 178 9632 160))) 
    (720 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 233 226 132 224 134 231 234 235 232 239 238 141 142 143 144 1617 1618 244 164 1600 251 249 1569 1570 1571 1572 163 1573 1574 1575 1576 1577 1578 1579 1580 1581 1582 1583 1584 1585 1586 1587 1588 1589 171 187 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 1590 1591 1592 1593 1594 1601 181 1602 1603 1604 1605 1606 1607 1608 1609 1610 8801 1611 1612 1613 1614 1615 1616 8776 176 8729 183 8730 8319 178 9632 160))) 
    (737 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 913 914 915 916 917 918 919 920 921 922 923 924 925 926 927 928 929 931 932 933 934 935 936 937 945 946 947 948 949 950 951 952 953 954 955 956 957 958 959 960 961 963 962 964 965 966 967 968 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 969 940 941 942 970 943 972 973 971 974 902 904 905 906 908 910 911 177 8805 8804 938 939 247 8776 176 8729 183 8730 8319 178 9632 160))) 
    (775 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 262 252 233 257 228 291 229 263 322 275 342 343 299 377 196 197 201 230 198 333 246 290 162 346 347 214 220 248 163 216 215 164 256 298 243 379 380 378 8221 166 169 174 172 189 188 321 171 187 9617 9618 9619 9474 9508 260 268 280 278 9571 9553 9559 9565 302 352 9488 9492 9524 9516 9500 9472 9532 370 362 9562 9556 9577 9574 9568 9552 9580 381 261 269 281 279 303 353 371 363 382 9496 9484 9608 9604 9612 9616 9600 211 223 332 323 245 213 181 324 310 311 315 316 326 274 325 8217 173 177 8220 190 182 167 247 8222 176 8729 183 185 179 178 9632 160))) 
    (850 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 228 224 229 231 234 235 232 239 238 236 196 197 201 230 198 244 246 242 251 249 255 214 220 248 163 216 215 402 225 237 243 250 241 209 170 186 191 174 172 189 188 161 171 187 9617 9618 9619 9474 9508 193 194 192 169 9571 9553 9559 9565 162 165 9488 9492 9524 9516 9500 9472 9532 227 195 9562 9556 9577 9574 9568 9552 9580 164 240 208 202 203 200 305 205 206 207 9496 9484 9608 9604 166 204 9600 211 223 212 210 245 213 181 254 222 218 219 217 253 221 175 180 173 177 8215 190 182 167 247 184 176 168 183 185 179 178 9632 160))) 
    (852 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 228 367 263 231 322 235 336 337 238 377 196 262 201 313 314 244 246 317 318 346 347 214 220 356 357 321 215 269 225 237 243 250 260 261 381 382 280 281 172 378 268 351 171 187 9617 9618 9619 9474 9508 193 194 282 350 9571 9553 9559 9565 379 380 9488 9492 9524 9516 9500 9472 9532 258 259 9562 9556 9577 9574 9568 9552 9580 164 273 272 270 203 271 327 205 206 283 9496 9484 9608 9604 354 366 9600 211 223 212 323 324 328 352 353 340 218 341 368 253 221 355 180 173 733 731 711 728 167 247 184 176 168 729 369 344 345 9632 160))) 
    (855 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 1106 1026 1107 1027 1105 1025 1108 1028 1109 1029 1110 1030 1111 1031 1112 1032 1113 1033 1114 1034 1115 1035 1116 1036 1118 1038 1119 1039 1102 1070 1098 1066 1072 1040 1073 1041 1094 1062 1076 1044 1077 1045 1092 1060 1075 1043 171 187 9617 9618 9619 9474 9508 1093 1061 1080 1048 9571 9553 9559 9565 1081 1049 9488 9492 9524 9516 9500 9472 9532 1082 1050 9562 9556 9577 9574 9568 9552 9580 164 1083 1051 1084 1052 1085 1053 1086 1054 1087 9496 9484 9608 9604 1055 1103 9600 1071 1088 1056 1089 1057 1090 1058 1091 1059 1078 1046 1074 1042 1100 1068 8470 173 1099 1067 1079 1047 1096 1064 1101 1069 1097 1065 1095 1063 167 9632 160))) 
    (857 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 228 224 229 231 234 235 232 239 238 305 196 197 201 230 198 244 246 242 251 249 304 214 220 248 163 216 350 351 225 237 243 250 241 209 286 287 191 174 172 189 188 161 171 187 9617 9618 9619 9474 9508 193 194 192 169 9571 9553 9559 9565 162 165 9488 9492 9524 9516 9500 9472 9532 227 195 9562 9556 9577 9574 9568 9552 9580 164 186 170 202 203 200 65533 205 206 207 9496 9484 9608 9604 166 204 9600 211 223 212 210 245 213 181 65533 215 218 219 217 236 255 175 180 173 177 65533 190 182 167 247 184 176 168 183 185 179 178 9632 160))) 
    (860 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 227 224 193 231 234 202 232 205 212 236 195 194 201 192 200 244 245 242 218 249 204 213 220 162 163 217 8359 211 225 237 243 250 241 209 170 186 191 210 172 189 188 161 171 187 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 945 223 915 960 931 963 181 964 934 920 937 948 8734 966 949 8745 8801 177 8805 8804 8992 8993 247 8776 176 8729 183 8730 8319 178 9632 160))) 
    (861 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 228 224 229 231 234 235 232 208 240 222 196 197 201 230 198 244 246 254 251 221 253 214 220 248 163 216 8359 402 225 237 243 250 193 205 211 218 191 8976 172 189 188 161 171 187 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 945 223 915 960 931 963 181 964 934 920 937 948 8734 966 949 8745 8801 177 8805 8804 8992 8993 247 8776 176 8729 183 8730 8319 178 9632 160))) 
    (862 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 1488 1489 1490 1491 1492 1493 1494 1495 1496 1497 1498 1499 1500 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510 1511 1512 1513 1514 162 163 165 8359 402 225 237 243 250 241 209 170 186 191 8976 172 189 188 161 171 187 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 945 223 915 960 931 963 181 964 934 920 937 948 8734 966 949 8745 8801 177 8805 8804 8992 8993 247 8776 176 8729 183 8730 8319 178 9632 160))) 
    (863 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 194 224 182 231 234 235 232 239 238 8215 192 167 201 200 202 244 203 207 251 249 164 212 220 162 163 217 219 402 166 180 243 250 168 184 179 175 206 8976 172 189 188 190 171 187 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 945 223 915 960 931 963 181 964 934 920 937 948 8734 966 949 8745 8801 177 8805 8804 8992 8993 247 8776 176 8729 183 8730 8319 178 9632 160))) 
    (864 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 176 183 8729 8730 9618 9472 9474 9532 9508 9516 9500 9524 9488 9484 9492 9496 946 8734 966 177 189 188 8776 171 187 65271 65272 155 156 65275 65276 159 160 173 65154 163 164 65156 65533 65533 65166 65167 65173 65177 1548 65181 65185 65189 1632 1633 1634 1635 1636 1637 1638 1639 1640 1641 65233 1563 65201 65205 65209 1567 162 65152 65153 65155 65157 65226 65163 65165 65169 65171 65175 65179 65183 65187 65191 65193 65195 65197 65199 65203 65207 65211 65215 65217 65221 65227 65231 166 172 247 215 65225 1600 65235 65239 65243 65247 65251 65255 65259 65261 65263 65267 65213 65228 65230 65229 65249 65149 1617 65253 65257 65260 65264 65266 65232 65237 65269 65270 65245 65241 65265 9632 65533))) 
    (865 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 199 252 233 226 228 224 229 231 234 235 232 239 238 236 196 197 201 230 198 244 246 242 251 249 255 214 220 248 163 216 8359 402 225 237 243 250 241 209 170 186 191 8976 172 189 188 161 171 164 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 945 223 915 960 931 963 181 964 934 920 937 948 8734 966 949 8745 8801 177 8805 8804 8992 8993 247 8776 176 8729 183 8730 8319 178 9632 160))) 
    (866 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 1040 1041 1042 1043 1044 1045 1046 1047 1048 1049 1050 1051 1052 1053 1054 1055 1056 1057 1058 1059 1060 1061 1062 1063 1064 1065 1066 1067 1068 1069 1070 1071 1072 1073 1074 1075 1076 1077 1078 1079 1080 1081 1082 1083 1084 1085 1086 1087 9617 9618 9619 9474 9508 9569 9570 9558 9557 9571 9553 9559 9565 9564 9563 9488 9492 9524 9516 9500 9472 9532 9566 9567 9562 9556 9577 9574 9568 9552 9580 9575 9576 9572 9573 9561 9560 9554 9555 9579 9578 9496 9484 9608 9604 9612 9616 9600 1088 1089 1090 1091 1092 1093 1094 1095 1096 1097 1098 1099 1100 1101 1102 1103 1025 1105 1028 1108 1031 1111 1038 1118 176 8729 183 8730 8470 164 9632 160))) 
    (869 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 133 902 135 183 172 166 8216 8217 904 8213 905 906 938 908 147 148 910 939 169 911 178 179 940 163 941 942 943 970 912 972 973 913 914 915 916 917 918 919 189 920 921 171 187 9617 9618 9619 9474 9508 922 923 924 925 9571 9553 9559 9565 926 927 9488 9492 9524 9516 9500 9472 9532 928 929 9562 9556 9577 9574 9568 9552 9580 931 932 933 934 935 936 937 945 946 947 9496 9484 9608 9604 948 949 9600 950 951 952 953 954 955 956 957 958 959 960 961 963 962 964 900 173 177 965 966 967 167 968 901 176 168 969 971 944 974 9632 160))) 
    (1250 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 129 8218 131 8222 8230 8224 8225 136 8240 352 8249 346 356 381 377 144 8216 8217 8220 8221 8226 8211 8212 152 8482 353 8250 347 357 382 378 160 711 728 321 164 260 166 167 168 169 350 171 172 173 174 379 176 177 731 322 180 181 182 183 184 261 351 187 317 733 318 380 340 193 194 258 196 313 262 199 268 201 280 203 282 205 206 270 272 323 327 211 212 336 214 215 344 366 218 368 220 221 354 223 341 225 226 259 228 314 263 231 269 233 281 235 283 237 238 271 273 324 328 243 244 337 246 247 345 367 250 369 252 253 355 729))) 
    (1251 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 1026 1027 8218 1107 8222 8230 8224 8225 8364 8240 1033 8249 1034 1036 1035 1039 1106 8216 8217 8220 8221 8226 8211 8212 152 8482 1113 8250 1114 1116 1115 1119 160 1038 1118 1032 164 1168 166 167 1025 169 1028 171 172 173 174 1031 176 177 1030 1110 1169 181 182 183 1105 8470 1108 187 1112 1029 1109 1111 1040 1041 1042 1043 1044 1045 1046 1047 1048 1049 1050 1051 1052 1053 1054 1055 1056 1057 1058 1059 1060 1061 1062 1063 1064 1065 1066 1067 1068 1069 1070 1071 1072 1073 1074 1075 1076 1077 1078 1079 1080 1081 1082 1083 1084 1085 1086 1087 1088 1089 1090 1091 1092 1093 1094 1095 1096 1097 1098 1099 1100 1101 1102 1103))) 
    (1252 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 129 8218 402 8222 8230 8224 8225 710 8240 352 8249 338 141 381 143 144 8216 8217 8220 8221 8226 8211 8212 732 8482 353 8250 339 157 382 376 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255))) 
    (1253 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 129 8218 402 8222 8230 8224 8225 136 8240 138 8249 140 141 142 143 144 8216 8217 8220 8221 8226 8211 8212 152 8482 154 8250 156 157 158 159 160 901 902 163 164 165 166 167 168 169 65533 171 172 173 174 8213 176 177 178 179 900 181 182 183 904 905 906 187 908 189 910 911 912 913 914 915 916 917 918 919 920 921 922 923 924 925 926 927 928 929 65533 931 932 933 934 935 936 937 938 939 940 941 942 943 944 945 946 947 948 949 950 951 952 953 954 955 956 957 958 959 960 961 962 963 964 965 966 967 968 969 970 971 972 973 974 65533))) 
    (1254 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 129 8218 402 8222 8230 8224 8225 710 8240 352 8249 338 141 142 143 144 8216 8217 8220 8221 8226 8211 8212 732 8482 353 8250 339 157 158 376 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 286 209 210 211 212 213 214 215 216 217 218 219 220 304 350 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239 287 241 242 243 244 245 246 247 248 249 250 251 252 305 351 255))) 
    (1255 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 129 8218 402 8222 8230 8224 8225 710 8240 138 8249 140 141 142 143 144 8216 8217 8220 8221 8226 8211 8212 732 8482 154 8250 156 157 158 159 160 161 162 163 8362 165 166 167 168 169 215 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 247 187 188 189 190 191 1456 1457 1458 1459 1460 1461 1462 1463 1464 1465 1466 1467 1468 1469 1470 1471 1472 1473 1474 1475 1520 1521 1522 1523 1524 65533 65533 65533 65533 65533 65533 65533 1488 1489 1490 1491 1492 1493 1494 1495 1496 1497 1498 1499 1500 1501 1502 1503 1504 1505 1506 1507 1508 1509 1510 1511 1512 1513 1514 65533 65533 8206 8207 65533))) 
    (1256 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 1662 8218 402 8222 8230 8224 8225 710 8240 1657 8249 338 1670 1688 1672 1711 8216 8217 8220 8221 8226 8211 8212 1705 8482 1681 8250 339 8204 8205 1722 160 1548 162 163 164 165 166 167 168 169 1726 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 1563 187 188 189 190 1567 1729 1569 1570 1571 1572 1573 1574 1575 1576 1577 1578 1579 1580 1581 1582 1583 1584 1585 1586 1587 1588 1589 1590 215 1591 1592 1593 1594 1600 1601 1602 1603 224 1604 226 1605 1606 1607 1608 231 232 233 234 235 1609 1610 238 239 1611 1612 1613 1614 244 1615 1616 247 1617 249 1618 251 252 8206 8207 1746))) 
    (1257 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 129 8218 131 8222 8230 8224 8225 136 8240 138 8249 140 168 711 184 144 8216 8217 8220 8221 8226 8211 8212 152 8482 154 8250 156 175 731 159 160 65533 162 163 164 65533 166 167 216 169 342 171 172 173 174 198 176 177 178 179 180 181 182 183 248 185 343 187 188 189 190 230 260 302 256 262 196 197 280 274 268 201 377 278 290 310 298 315 352 323 325 211 332 213 214 215 370 321 346 362 220 379 381 223 261 303 257 263 228 229 281 275 269 233 378 279 291 311 299 316 353 324 326 243 333 245 246 247 371 322 347 363 252 380 382 729))) 
    (1258 . ,(make-decoding-table '(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 8364 129 8218 402 8222 8230 8224 8225 710 8240 138 8249 338 141 142 143 144 8216 8217 8220 8221 8226 8211 8212 732 8482 154 8250 339 157 158 376 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 258 196 197 198 199 200 201 202 203 768 205 206 207 272 209 777 211 212 416 214 215 216 217 218 219 220 431 771 223 224 225 226 259 228 229 230 231 232 233 234 235 769 237 238 239 273 241 803 243 244 417 246 247 248 249 250 251 252 432 8363 255))))
  "A list of 8-bit Windows code pages where each element is a
cons with the car being the ID of the code page and the cdr being
a vector enumerating the corresponding character codes.")