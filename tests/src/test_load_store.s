# Test load/store instructions: ld.b, ld.h, ld.w, ld.bu, ld.hu, st.b, st.h, st.w
# 测试内存访问指令

.text
.globl _start

_start:
    # Set up base address in $r20
    lu12i.w $r20, 7            # $r20 = 0x7000

    # Initialize test values
    lu12i.w $r1, 0x12345       # $r1 = 0x12345000
    ori     $r1, $r1, 0x678    # $r1 = 0x12345678
    
    addi.w  $r2, $r0, -1       # $r2 = 0xFFFFFFFF
    addi.w  $r3, $r0, 0x7F     # $r3 = 0x7F (127, max positive byte)
    addi.w  $r4, $r0, -128     # $r4 = 0xFFFFFF80 (-128)
    
    ori     $r5, $r0, 0x7FF    # $r5 = 0x7FF (2047, positive halfword)
    addi.w  $r6, $r0, -1       # $r6 = 0xFFFFFFFF
    andi    $r6, $r6, 0x8FF    # $r6 = 0x8FF (negative when sign extended from 12 bits)

    # Test st.w (store word) and ld.w (load word)
    st.w    $r1, $r20, 0       # Store 0x12345678 at base+0
    ld.w    $r10, $r20, 0      # $r10 = 0x12345678

    st.w    $r2, $r20, 4       # Store 0xFFFFFFFF at base+4
    ld.w    $r11, $r20, 4      # $r11 = 0xFFFFFFFF

    # Test st.h (store halfword) and ld.h (load halfword signed)
    st.h    $r1, $r20, 8       # Store 0x5678 at base+8
    ld.h    $r12, $r20, 8      # $r12 = 0x00005678 (positive, sign extend)

    st.h    $r2, $r20, 10      # Store 0xFFFF at base+10
    ld.h    $r13, $r20, 10     # $r13 = 0xFFFFFFFF (negative, sign extend)

    # Test ld.hu (load halfword unsigned)
    ld.hu   $r14, $r20, 8      # $r14 = 0x00005678 (zero extend)
    ld.hu   $r15, $r20, 10     # $r15 = 0x0000FFFF (zero extend)

    # Test st.b (store byte) and ld.b (load byte signed)
    st.b    $r3, $r20, 12      # Store 0x7F at base+12
    ld.b    $r16, $r20, 12     # $r16 = 0x0000007F (positive, sign extend)

    st.b    $r4, $r20, 13      # Store 0x80 at base+13
    ld.b    $r17, $r20, 13     # $r17 = 0xFFFFFF80 (negative, sign extend)

    # Test ld.bu (load byte unsigned)
    ld.bu   $r18, $r20, 12     # $r18 = 0x0000007F (zero extend)
    ld.bu   $r19, $r20, 13     # $r19 = 0x00000080 (zero extend)

    # Test with negative offset
    addi.w  $r21, $r20, 32     # $r21 = base + 32
    st.w    $r1, $r21, -4      # Store at (base+32-4) = base+28
    ld.w    $r22, $r20, 28     # Load from base+28, should be 0x12345678

    # Test byte/halfword extraction from word
    st.w    $r1, $r20, 16      # Store 0x12345678 at base+16
    ld.b    $r23, $r20, 16     # $r23 = 0x78 sign extended
    ld.b    $r24, $r20, 17     # $r24 = 0x56 sign extended
    ld.b    $r25, $r20, 18     # $r25 = 0x34 sign extended
    ld.b    $r26, $r20, 19     # $r26 = 0x12 sign extended

    ld.h    $r27, $r20, 16     # $r27 = 0x5678 sign extended
    ld.h    $r28, $r20, 18     # $r28 = 0x1234 sign extended

    # Store results at different location for verification
    lu12i.w $r29, 8            # $r29 = 0x8000
    st.w    $r10, $r29, 0      # 0x12345678
    st.w    $r11, $r29, 4      # 0xFFFFFFFF
    st.w    $r12, $r29, 8      # 0x00005678
    st.w    $r13, $r29, 12     # 0xFFFFFFFF
    st.w    $r14, $r29, 16     # 0x00005678
    st.w    $r15, $r29, 20     # 0x0000FFFF
    st.w    $r16, $r29, 24     # 0x0000007F
    st.w    $r17, $r29, 28     # 0xFFFFFF80
    st.w    $r18, $r29, 32     # 0x0000007F
    st.w    $r19, $r29, 36     # 0x00000080
    st.w    $r22, $r29, 40     # 0x12345678
    st.w    $r23, $r29, 44     # byte[0]
    st.w    $r24, $r29, 48     # byte[1]
    st.w    $r25, $r29, 52     # byte[2]
    st.w    $r26, $r29, 56     # byte[3]
    st.w    $r27, $r29, 60     # halfword[0]
    st.w    $r28, $r29, 64     # halfword[1]
