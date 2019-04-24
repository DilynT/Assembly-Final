%DEFINE tone_REST 0
%DEFINE tone_GbelowC 196
%DEFINE tone_A      220
%DEFINE tone_Asharp 233
%DEFINE tone_B      247
%DEFINE tone_C      262
%DEFINE tone_Csharp 277
%DEFINE tone_D      294
%DEFINE tone_Dsharp 311
%DEFINE tone_E      330
%DEFINE tone_F      349
%DEFINE tone_Fsharp 370
%DEFINE tone_G      392
%DEFINE tone_Gsharp 415
%DEFINE duration_WHOLE 1600,
%DEFINE duration_HALF 800,
%DEFINE duration_QUARTER 400,
%DEFINE duration_EIGHTH 200,
%DEFINE duration_SIXTEENTH 100,

extern _ExitProcess@4
extern _MessageBoxA@16
extern _MessageBeep@4
extern Beep
global _main

section .data

section .text
_main:
    
    push duration_QUARTER
    push tone_B
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_A
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_GbelowC
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_A
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_B
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_B
    call Beep
    add esp, 4

    push duration_HALF
    push tone_B
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_A
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_A
    call Beep
    add esp, 4

    push duration_HALF
    push tone_A
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_B
    call Beep
    add esp, 4

    push duration_QUARTER
    push tone_D
    call Beep
    add esp, 4

    push duration_HALF
    push tone_D
    call Beep
    add esp, 4

    push  0                ; no error
    call  _ExitProcess@4   ; in kernel32.dll