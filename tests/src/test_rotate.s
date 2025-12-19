# Test rotate instructions: rotr.w, rotri.w
# 测试循环右移指令

.text
.globl _start

_start:
    # Initialize test values
    addi.w  $r1, $r0, 1        # $r1 = 1
    addi.w  $r2, $r0, 4        # $r2 = 4 (rotate amount)
    addi.w  $r3, $r0, 8        # $r3 = 8 (rotate amount)
    
    lu12i.w $r4, 0x12345       # $r4 = 0x12345000
    ori     $r4, $r4, 0x678    # $r4 = 0x12345678
    
    # Create 0x80000001 using -0x80000 (negative immediate) 
    lu12i.w $r5, -524288       # $r5 = 0x80000000 (MSB set)
    ori     $r5, $r5, 0x001    # $r5 = 0x80000001
    
    addi.w  $r6, $r0, 0xAB     # $r6 = 0x000000AB

    # Test rotr.w (rotate right by register)
    # $r10 = 0x12345678 rotr 4 = 0x81234567
    rotr.w  $r10, $r4, $r2

    # $r11 = 0x12345678 rotr 8 = 0x78123456
    rotr.w  $r11, $r4, $r3

    # $r12 = 0x80000001 rotr 4 = 0x18000000
    rotr.w  $r12, $r5, $r2

    # $r13 = 1 rotr 1 = 0x80000000
    addi.w  $r7, $r0, 1
    rotr.w  $r13, $r1, $r7

    # Test rotri.w (rotate right by immediate)
    # $r14 = 0x12345678 rotri 4 = 0x81234567
    rotri.w $r14, $r4, 4

    # $r15 = 0x12345678 rotri 8 = 0x78123456
    rotri.w $r15, $r4, 8

    # $r16 = 0x12345678 rotri 16 = 0x56781234
    rotri.w $r16, $r4, 16

    # $r17 = 0x12345678 rotri 24 = 0x34567812
    rotri.w $r17, $r4, 24

    # $r18 = 0x80000001 rotri 1 = 0xC0000000
    rotri.w $r18, $r5, 1

    # Test edge case: rotate by 0
    # $r19 = 0x12345678 rotri 0 = 0x12345678
    rotri.w $r19, $r4, 0

    # Test edge case: rotate by 31
    # $r21 = 1 rotri 31 = 2
    rotri.w $r21, $r1, 31

    # Test rotate that wraps around
    # $r22 = 0x000000AB rotri 4 = 0xB000000A
    rotri.w $r22, $r6, 4

    # Store results for verification
    lu12i.w $r20, 5            # $r20 = 0x5000
    st.w    $r10, $r20, 0      # Store 0x81234567 (rotr.w by 4)
    st.w    $r11, $r20, 4      # Store 0x78123456 (rotr.w by 8)
    st.w    $r12, $r20, 8      # Store 0x18000000 (rotr.w)
    st.w    $r13, $r20, 12     # Store 0x80000000 (rotr.w 1 by 1)
    st.w    $r14, $r20, 16     # Store 0x81234567 (rotri.w by 4)
    st.w    $r15, $r20, 20     # Store 0x78123456 (rotri.w by 8)
    st.w    $r16, $r20, 24     # Store 0x56781234 (rotri.w by 16)
    st.w    $r17, $r20, 28     # Store 0x34567812 (rotri.w by 24)
    st.w    $r18, $r20, 32     # Store 0xC0000000 (rotri.w by 1)
    st.w    $r19, $r20, 36     # Store 0x12345678 (rotri.w by 0)
    st.w    $r21, $r20, 40     # Store 2 (rotri.w 1 by 31)
    st.w    $r22, $r20, 44     # Store 0xB000000A (rotri.w)
