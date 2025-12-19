# Test indexed load/store: ldx.b, ldx.h, ldx.w, ldx.bu, ldx.hu, stx.b, stx.h, stx.w
# 测试索引内存访问指令

.text
.globl _start

_start:
    # Set up base address in $r20
    lu12i.w $r20, 9            # $r20 = 0x9000 (base address)

    # Set up index registers
    addi.w  $r1, $r0, 0        # $r1 = 0 (index 0)
    addi.w  $r2, $r0, 4        # $r2 = 4 (index 4)
    addi.w  $r3, $r0, 8        # $r3 = 8 (index 8)
    addi.w  $r4, $r0, 12       # $r4 = 12 (index 12)
    addi.w  $r5, $r0, 16       # $r5 = 16 (index 16)

    # Initialize test values
    lu12i.w $r6, 0x12345       # $r6 = 0x12345000
    ori     $r6, $r6, 0xF01    # $r6 = 0x12345F01

    addi.w  $r7, $r0, -1       # $r7 = 0xFFFFFFFF
    addi.w  $r8, $r0, 0x7F     # $r8 = 0x7F (127)
    addi.w  $r9, $r0, -128     # $r9 = 0xFFFFFF80 (-128)

    # Test stx.w (store word indexed) and ldx.w (load word indexed)
    stx.w   $r6, $r20, $r1     # Store 0xABCDEF01 at base+0
    ldx.w   $r10, $r20, $r1    # $r10 = 0xABCDEF01

    stx.w   $r7, $r20, $r2     # Store 0xFFFFFFFF at base+4
    ldx.w   $r11, $r20, $r2    # $r11 = 0xFFFFFFFF

    # Test stx.h (store halfword indexed) and ldx.h (load halfword signed indexed)
    stx.h   $r6, $r20, $r3     # Store 0xEF01 at base+8
    ldx.h   $r12, $r20, $r3    # $r12 = 0xFFFFEF01 (negative, sign extend)

    addi.w  $r21, $r3, 2       # $r21 = 10
    stx.h   $r8, $r20, $r21    # Store 0x007F at base+10
    ldx.h   $r13, $r20, $r21   # $r13 = 0x0000007F (positive, sign extend)

    # Test ldx.hu (load halfword unsigned indexed)
    ldx.hu  $r14, $r20, $r3    # $r14 = 0x0000EF01 (zero extend)
    ldx.hu  $r15, $r20, $r21   # $r15 = 0x0000007F (zero extend)

    # Test stx.b (store byte indexed) and ldx.b (load byte signed indexed)
    stx.b   $r8, $r20, $r4     # Store 0x7F at base+12
    ldx.b   $r16, $r20, $r4    # $r16 = 0x0000007F (positive, sign extend)

    addi.w  $r22, $r4, 1       # $r22 = 13
    stx.b   $r9, $r20, $r22    # Store 0x80 at base+13
    ldx.b   $r17, $r20, $r22   # $r17 = 0xFFFFFF80 (negative, sign extend)

    # Test ldx.bu (load byte unsigned indexed)
    ldx.bu  $r18, $r20, $r4    # $r18 = 0x0000007F (zero extend)
    ldx.bu  $r19, $r20, $r22   # $r19 = 0x00000080 (zero extend)

    # Test with computed index
    addi.w  $r23, $r0, 20      # $r23 = 20
    stx.w   $r6, $r20, $r23    # Store at base+20
    ldx.w   $r24, $r20, $r23   # Load from base+20

    # Test byte extraction using indexed loads
    stx.w   $r6, $r20, $r5     # Store 0x12345F01 at base+16
    ldx.b   $r25, $r20, $r5    # $r25 = 0x01 sign extended
    addi.w  $r26, $r5, 1
    ldx.b   $r27, $r20, $r26   # $r27 = 0xEF sign extended (negative)
    addi.w  $r26, $r5, 2
    ldx.b   $r28, $r20, $r26   # $r28 = 0xCD sign extended (negative)
    addi.w  $r26, $r5, 3
    ldx.b   $r29, $r20, $r26   # $r29 = 0xAB sign extended (negative)

    # Store results for verification
    lu12i.w $r30, 10           # $r30 = 0xA000
    st.w    $r10, $r30, 0      # 0x12345F01
    st.w    $r11, $r30, 4      # 0xFFFFFFFF
    st.w    $r12, $r30, 8      # 0xFFFF5F01
    st.w    $r13, $r30, 12     # 0x0000007F
    st.w    $r14, $r30, 16     # 0x00005F01
    st.w    $r15, $r30, 20     # 0x0000007F
    st.w    $r16, $r30, 24     # 0x0000007F
    st.w    $r17, $r30, 28     # 0xFFFFFF80
    st.w    $r18, $r30, 32     # 0x0000007F
    st.w    $r19, $r30, 36     # 0x00000080
    st.w    $r24, $r30, 40     # 0x12345F01
    st.w    $r25, $r30, 44     # 0x00000001
    st.w    $r27, $r30, 48     # 0xFFFFFF5F (sign ext of 0x5F)
    st.w    $r28, $r30, 52     # 0x00000034 (sign ext of 0x34)
    st.w    $r29, $r30, 56     # 0x00000012 (sign ext of 0x12)
