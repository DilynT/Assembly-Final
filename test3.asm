section .data
    ; for input/output
        STDOUT equ -11
        STDIN equ -10
        NULL equ 0
        consoleInHandle dd 1
        consoleOutHandle dd 1

    ; typical variables
        msg db 'Welcome To The Least Insipred Final Project Ever!',10,0
        

section .bss
    buffer resd 2 ; for input/output
    userInput resb 32
    userInputLen resd 4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; EXTERNAL FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
extern _ExitProcess@4
extern  _GetStdHandle@4 ; get I/O field
extern _WriteConsoleA@20 ; printf replacement
extern _ReadConsoleA@16 ; scanf replacement
EXTERN _lstrlenA@4 ; strlen
global _main

section .text
_main:
    ; before you do any code, fill these two variables in to save time later
    ; these allow you to do stdin and stdout
        ; get stdout handler
        push    STDOUT
        call    _GetStdHandle@4
        add     esp, 4
        mov     [consoleOutHandle], eax
        ; get stdin handler
        push    STDIN
        call    _GetStdHandle@4
        add     esp, 4
        mov     [consoleInHandle],eax

    ; print msg
        ; first, you then need to push a null byte and a buffer
        ; this buffer just holds the number of characters printed
        ; this is not the string
            push    NULL
            push    buffer
        ; then, you need to push the length of the string
        ; lstrlenA@4 returns to eax, so we push from there
            push msg
            call _lstrlenA@4
            add esp, 4
            push eax
        ; then, push the variable you want to print
            push    msg
        ; push the stdout handle you saved earlier
            push    DWORD [consoleOutHandle]
        ; execute
            call    _WriteConsoleA@20
            add     esp, 20 ; fun fact, the @20 shows how much to fix the stack by

    ; get userInput
        ; again, we need to push a null byte and a buffer
        ; this buffer holds the number of characters it was able to read
        ; don't rely on that for strlen, it takes raw keyboard code as well
            push    NULL
            push    buffer
        ; next, push the number of characters to read
        ; this is defined by your resb on the string
            push    32
        ; then, push the string holder (the var)
            push    userInput
        ; console handler next
            push    DWORD[consoleInHandle]
        ; execute
            call    _ReadConsoleA@16
            add     esp, 16

    ; print out userInput
        ; prep
            push    NULL
            push    buffer
        ; strlen
            push userInput
            call _lstrlenA@4
            add esp, 4
            push eax
        ; string
            push    userInput
        ; handle
            push    DWORD [consoleOutHandle]
        ; execute
            call    _WriteConsoleA@20
            add     esp, 20

    ; exit program
        push    NULL
        call    _ExitProcess@4

; TODO:

