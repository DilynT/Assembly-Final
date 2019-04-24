nasm -fwin32 test3.asm
GoLink /console /entry _main test3.obj user32.dll kernel32.dll
test3.exe