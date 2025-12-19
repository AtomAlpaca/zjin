# Test comparison instructions: slt, sltu, slti, sltui
# 测试比较指令

.text
.globl _start

_start:
    # Initialize test values
    addi.w  $r1, $r0, 10      # $r1 = 10
    addi.w  $r2, $r0, 20      # $r2 = 20
    addi.w  $r3, $r0, -5      # $r3 = -5 (0xFFFFFFFB)
    addi.w  $r4, $r0, -10     # $r4 = -10 (0xFFFFFFF6)

    # Test slt (signed less than)
    # $r5 = (10 < 20) ? 1 : 0 = 1
    slt     $r5, $r1, $r2

    # $r6 = (20 < 10) ? 1 : 0 = 0
    slt     $r6, $r2, $r1

    # $r7 = (-5 < 10) ? 1 : 0 = 1 (signed comparison)
    slt     $r7, $r3, $r1

    # $r8 = (10 < -5) ? 1 : 0 = 0 (signed comparison)
    slt     $r8, $r1, $r3

    # $r9 = (-10 < -5) ? 1 : 0 = 1 (signed comparison)
    slt     $r9, $r4, $r3

    # Test sltu (unsigned less than)
    # $r10 = (10 <u 20) ? 1 : 0 = 1
    sltu    $r10, $r1, $r2

    # $r11 = (10 <u 0xFFFFFFFB) ? 1 : 0 = 1 (unsigned, -5 is large positive)
    sltu    $r11, $r1, $r3

    # $r12 = (0xFFFFFFFB <u 10) ? 1 : 0 = 0 (unsigned)
    sltu    $r12, $r3, $r1

    # Test slti (signed less than immediate)
    # $r13 = (10 < 15) ? 1 : 0 = 1
    slti    $r13, $r1, 15

    # $r14 = (10 < 5) ? 1 : 0 = 0
    slti    $r14, $r1, 5

    # $r15 = (-5 < 0) ? 1 : 0 = 1
    slti    $r15, $r3, 0

    # $r16 = (10 < -1) ? 1 : 0 = 0 (signed comparison)
    slti    $r16, $r1, -1

    # Test sltui (unsigned less than immediate)
    # $r17 = (10 <u 15) ? 1 : 0 = 1
    sltui   $r17, $r1, 15

    # $r18 = (10 <u 5) ? 1 : 0 = 0
    sltui   $r18, $r1, 5

    # Test equal values
    addi.w  $r19, $r0, 10
    # $r21 = (10 < 10) ? 1 : 0 = 0
    slt     $r21, $r1, $r19

    # $r22 = (10 <u 10) ? 1 : 0 = 0
    sltu    $r22, $r1, $r19

    # Store results for verification
    lu12i.w $r20, 2           # $r20 = 0x2000
    st.w    $r5, $r20, 0      # Store 1 (slt 10 < 20)
    st.w    $r6, $r20, 4      # Store 0 (slt 20 < 10)
    st.w    $r7, $r20, 8      # Store 1 (slt -5 < 10)
    st.w    $r8, $r20, 12     # Store 0 (slt 10 < -5)
    st.w    $r9, $r20, 16     # Store 1 (slt -10 < -5)
    st.w    $r10, $r20, 20    # Store 1 (sltu 10 < 20)
    st.w    $r11, $r20, 24    # Store 1 (sltu 10 < 0xFFFFFFFB)
    st.w    $r12, $r20, 28    # Store 0 (sltu 0xFFFFFFFB < 10)
    st.w    $r13, $r20, 32    # Store 1 (slti 10 < 15)
    st.w    $r14, $r20, 36    # Store 0 (slti 10 < 5)
    st.w    $r15, $r20, 40    # Store 1 (slti -5 < 0)
    st.w    $r16, $r20, 44    # Store 0 (slti 10 < -1)
    st.w    $r17, $r20, 48    # Store 1 (sltui 10 < 15)
    st.w    $r18, $r20, 52    # Store 0 (sltui 10 < 5)
    st.w    $r21, $r20, 56    # Store 0 (slt equal)
    st.w    $r22, $r20, 60    # Store 0 (sltu equal)
