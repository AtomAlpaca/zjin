# Test shift instructions: sll.w, srl.w, sra.w, slli.w, srli.w, srai.w
# 测试移位指令

.text
.globl _start

_start:
    # Initialize test values
    addi.w  $r1, $r0, 1        # $r1 = 1
    addi.w  $r2, $r0, 4        # $r2 = 4 (shift amount)
    addi.w  $r3, $r0, 8        # $r3 = 8 (shift amount)
    addi.w  $r4, $r0, -1       # $r4 = 0xFFFFFFFF (-1)
    addi.w  $r5, $r0, -128     # $r5 = 0xFFFFFF80 (-128)
    
    # Create 0x80000000 using negative immediate
    lu12i.w $r6, -524288       # $r6 = 0x80000000 (MSB set)
    
    addi.w  $r7, $r0, 0x55     # $r7 = 0x55 (01010101)

    # Test sll.w (shift left logical)
    # $r10 = 1 << 4 = 16
    sll.w   $r10, $r1, $r2

    # $r11 = 1 << 8 = 256
    sll.w   $r11, $r1, $r3

    # $r12 = 0x55 << 4 = 0x550
    sll.w   $r12, $r7, $r2

    # Test srl.w (shift right logical)
    # $r13 = 256 >> 4 = 16
    addi.w  $r23, $r0, 256
    srl.w   $r13, $r23, $r2

    # $r14 = 0xFFFFFFFF >> 4 = 0x0FFFFFFF (logical, zero fill)
    srl.w   $r14, $r4, $r2

    # $r15 = 0x80000000 >> 8 = 0x00800000 (logical)
    srl.w   $r15, $r6, $r3

    # Test sra.w (shift right arithmetic)
    # $r16 = 0xFFFFFFFF >> 4 = 0xFFFFFFFF (arithmetic, sign extend)
    sra.w   $r16, $r4, $r2

    # $r17 = 0x80000000 >> 8 = 0xFF800000 (arithmetic, sign extend)
    sra.w   $r17, $r6, $r3

    # $r18 = 0xFFFFFF80 >> 4 = 0xFFFFFFF8 (arithmetic)
    sra.w   $r18, $r5, $r2

    # Test slli.w (shift left logical immediate)
    # $r19 = 1 << 5 = 32
    slli.w  $r19, $r1, 5

    # $r21 = 0x55 << 8 = 0x5500
    slli.w  $r21, $r7, 8

    # Test srli.w (shift right logical immediate)
    # $r22 = 0xFFFFFFFF >> 8 = 0x00FFFFFF
    srli.w  $r22, $r4, 8

    # $r23 = 0x80000000 >> 16 = 0x00008000
    srli.w  $r23, $r6, 16

    # Test srai.w (shift right arithmetic immediate)
    # $r24 = 0xFFFFFFFF >> 8 = 0xFFFFFFFF
    srai.w  $r24, $r4, 8

    # $r25 = 0x80000000 >> 16 = 0xFFFF8000
    srai.w  $r25, $r6, 16

    # $r26 = 0xFFFFFF80 >> 3 = 0xFFFFFFF0
    srai.w  $r26, $r5, 3

    # Test edge case: shift by 0
    # $r27 = 0x55 << 0 = 0x55
    slli.w  $r27, $r7, 0

    # Test edge case: shift by 31
    # $r28 = 1 << 31 = 0x80000000
    slli.w  $r28, $r1, 31

    # Store results for verification
    lu12i.w $r20, 4            # $r20 = 0x4000
    st.w    $r10, $r20, 0      # Store 16 (sll.w 1<<4)
    st.w    $r11, $r20, 4      # Store 256 (sll.w 1<<8)
    st.w    $r12, $r20, 8      # Store 0x550 (sll.w 0x55<<4)
    st.w    $r13, $r20, 12     # Store 16 (srl.w 256>>4)
    st.w    $r14, $r20, 16     # Store 0x0FFFFFFF (srl.w logical)
    st.w    $r15, $r20, 20     # Store 0x00800000 (srl.w logical)
    st.w    $r16, $r20, 24     # Store 0xFFFFFFFF (sra.w arithmetic)
    st.w    $r17, $r20, 28     # Store 0xFF800000 (sra.w arithmetic)
    st.w    $r18, $r20, 32     # Store 0xFFFFFFF8 (sra.w arithmetic)
    st.w    $r19, $r20, 36     # Store 32 (slli.w)
    st.w    $r21, $r20, 40     # Store 0x5500 (slli.w)
    st.w    $r22, $r20, 44     # Store 0x00FFFFFF (srli.w)
    st.w    $r23, $r20, 48     # Store 0x00008000 (srli.w)
    st.w    $r24, $r20, 52     # Store 0xFFFFFFFF (srai.w)
    st.w    $r25, $r20, 56     # Store 0xFFFF8000 (srai.w)
    st.w    $r26, $r20, 60     # Store 0xFFFFFFF0 (srai.w)
    st.w    $r27, $r20, 64     # Store 0x55 (shift by 0)
    st.w    $r28, $r20, 68     # Store 0x80000000 (shift by 31)
