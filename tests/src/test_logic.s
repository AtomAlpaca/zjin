# Test logical instructions: and, or, xor, nor, orn, andn, andi, ori, xori
# 测试逻辑指令

.text
.globl _start

_start:
    # Initialize test values
    # Create 0xAAAAAAAA using addi.w with -1 and andi pattern
    # 0xAAAAAAAA = alternating 1010...
    # Use a simpler pattern: create using negative numbers and shifts
    
    # $r1 = 0x55550000, then use OR to complete the pattern
    # Actually let's use simpler values that fit in immediate range
    
    # Use 0x12345 (fits in 20-bit signed)
    lu12i.w $r1, 0x12345       # $r1 = 0x12345000
    ori     $r1, $r1, 0xFFF    # $r1 = 0x12345FFF
    
    # Use 0x0F0F0 pattern
    lu12i.w $r2, 0x0F0F0       # $r2 = 0x0F0F0000
    ori     $r2, $r2, 0x0F0    # $r2 = 0x0F0F00F0
    
    addi.w  $r3, $r0, 0xFF     # $r3 = 0x000000FF
    
    # Create -1 (0xFFFFFFFF)
    addi.w  $r31, $r0, -1      # $r31 = 0xFFFFFFFF

    # Test and: rd = rj & rk
    # $r4 = 0x12345FFF & 0x0F0F00F0 = 0x020400F0
    and     $r4, $r1, $r2

    # $r5 = 0x12345FFF & 0x000000FF = 0x000000FF
    and     $r5, $r1, $r3

    # Test or: rd = rj | rk
    # $r6 = 0x12345FFF | 0x0F0F00F0 = 0x1F3F5FFF
    or      $r6, $r1, $r2

    # $r7 = 0x12345FFF | 0x000000FF = 0x12345FFF
    or      $r7, $r1, $r3

    # Test xor: rd = rj ^ rk
    # $r8 = 0x12345FFF ^ 0x0F0F00F0 = 0x1D3B5F0F
    xor     $r8, $r1, $r2

    # $r9 = 0x12345FFF ^ 0x12345FFF = 0x00000000
    xor     $r9, $r1, $r1

    # Test nor: rd = ~(rj | rk)
    # $r10 = ~(0x12345FFF | 0x0F0F00F0) = ~0x1F3F5FFF = 0xE0C0A000
    nor     $r10, $r1, $r2

    # $r11 = ~(0x00000000 | 0x00000000) = 0xFFFFFFFF
    nor     $r11, $r0, $r0

    # Test orn: rd = rj | (~rk)
    # $r12 = 0x12345FFF | (~0x0F0F00F0) = 0x12345FFF | 0xF0F0FF0F = 0xF2F4FFFF
    orn     $r12, $r1, $r2

    # Test andn: rd = rj & (~rk)
    # $r13 = 0x12345FFF & (~0x0F0F00F0) = 0x12345FFF & 0xF0F0FF0F = 0x10305F0F
    andn    $r13, $r1, $r2

    # $r14 = 0xFFFFFFFF & (~0x12345FFF) = 0xEDCBA000
    andn    $r14, $r31, $r1

    # Test andi: rd = rj & ZeroExtend(ui12)
    # $r15 = 0x12345FFF & 0x00000FFF = 0x00000FFF
    andi    $r15, $r1, 0xFFF

    # $r16 = 0x12345FFF & 0x000000FF = 0x000000FF
    andi    $r16, $r1, 0xFF

    # Test ori: rd = rj | ZeroExtend(ui12)
    # $r17 = 0x00000000 | 0x00000ABC = 0x00000ABC
    ori     $r17, $r0, 0xABC

    # $r18 = 0x12345FFF | 0x00000555 = 0x12345FFF
    ori     $r18, $r1, 0x555

    # Test xori: rd = rj ^ ZeroExtend(ui12)
    # $r19 = 0x00000FFF ^ 0x00000AAA = 0x00000555
    addi.w  $r23, $r0, 0
    ori     $r23, $r23, 0xFFF
    xori    $r19, $r23, 0xAAA

    # $r21 = 0x12345FFF ^ 0x00000FFF = 0x12345000
    xori    $r21, $r1, 0xFFF

    # Additional tests with edge cases
    # Test with zero
    and     $r22, $r1, $r0     # $r22 = 0 (anything AND 0)
    or      $r23, $r1, $r0     # $r23 = $r1 (anything OR 0)
    xor     $r24, $r1, $r0     # $r24 = $r1 (anything XOR 0)

    # Store results for verification
    lu12i.w $r20, 3            # $r20 = 0x3000
    st.w    $r4, $r20, 0       # Store (and result)
    st.w    $r5, $r20, 4       # Store (and with mask)
    st.w    $r6, $r20, 8       # Store (or result)
    st.w    $r7, $r20, 12      # Store (or with mask)
    st.w    $r8, $r20, 16      # Store (xor result)
    st.w    $r9, $r20, 20      # Store 0x00000000 (xor with self)
    st.w    $r10, $r20, 24     # Store (nor result)
    st.w    $r11, $r20, 28     # Store 0xFFFFFFFF (nor zero)
    st.w    $r12, $r20, 32     # Store (orn result)
    st.w    $r13, $r20, 36     # Store (andn result)
    st.w    $r14, $r20, 40     # Store (andn with -1)
    st.w    $r15, $r20, 44     # Store (andi with FFF)
    st.w    $r16, $r20, 48     # Store (andi with FF)
    st.w    $r17, $r20, 52     # Store 0x00000ABC (ori)
    st.w    $r18, $r20, 56     # Store (ori)
    st.w    $r19, $r20, 60     # Store 0x00000555 (xori)
    st.w    $r21, $r20, 64     # Store (xori)
    st.w    $r22, $r20, 68     # Store 0 (and with 0)
    st.w    $r23, $r20, 72     # Store (or with 0)
    st.w    $r24, $r20, 76     # Store (xor with 0)
