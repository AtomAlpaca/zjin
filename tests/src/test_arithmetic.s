# Test arithmetic instructions: add.w, sub.w, addi.w
# 测试算术指令

.text
.globl _start

_start:
    # Test addi.w: rd = rj + si12
    # $r0 always 0, so $r1 = 0 + 100 = 100
    addi.w  $r1, $r0, 100

    # Test addi.w with negative immediate
    # $r2 = 100 + (-50) = 50
    addi.w  $r2, $r1, -50

    # Test add.w: rd = rj + rk
    # $r3 = $r1 + $r2 = 100 + 50 = 150
    add.w   $r3, $r1, $r2

    # Test sub.w: rd = rj - rk
    # $r4 = $r1 - $r2 = 100 - 50 = 50
    sub.w   $r4, $r1, $r2

    # Test add.w with zero
    # $r5 = $r3 + $r0 = 150 + 0 = 150
    add.w   $r5, $r3, $r0

    # Test sub.w resulting in zero
    # $r6 = $r1 - $r1 = 0
    sub.w   $r6, $r1, $r1

    # Test addi.w with max positive immediate (2047)
    addi.w  $r7, $r0, 2047

    # Test addi.w with min negative immediate (-2048)
    addi.w  $r8, $r0, -2048

    # Test overflow behavior (wrap around)
    # $r9 = 0xFFFFFFFF
    addi.w  $r9, $r0, -1
    # $r10 = 0xFFFFFFFF + 1 = 0 (overflow)
    addi.w  $r10, $r9, 1

    # Test chained operations
    # $r11 = ((100 + 50) - 30) = 120
    add.w   $r11, $r1, $r2
    addi.w  $r11, $r11, -30

    # Store results for verification
    # Use $r20 as base address (0x1000)
    lu12i.w $r20, 1           # $r20 = 0x1000
    st.w    $r1, $r20, 0      # Store 100
    st.w    $r2, $r20, 4      # Store 50
    st.w    $r3, $r20, 8      # Store 150
    st.w    $r4, $r20, 12     # Store 50
    st.w    $r5, $r20, 16     # Store 150
    st.w    $r6, $r20, 20     # Store 0
    st.w    $r7, $r20, 24     # Store 2047
    st.w    $r8, $r20, 28     # Store -2048
    st.w    $r10, $r20, 32    # Store 0 (overflow)
    st.w    $r11, $r20, 36    # Store 120
