   SECTION .data

    a DD 30
    b DD 70
    c DD 99
    soma dd 00

    SECTION .text

    GLOBAL main
    main:
        MOV EAX, [a]
        MOV EBX, [b]
        MOV ECX, [c]
        ADD EAX, EBX
        SUB EAX,ECX       
        ADD EAX, [a]
        
        MOV[soma], EAX
        PRINT_UDEC 4, EAX
        MOV EAX, 0
        RET