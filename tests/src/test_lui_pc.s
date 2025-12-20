# Test upper immediate and PC-relative: lu12i.w, pcaddu12i, pcalau12i, pcaddu18i
# 测试高位立即数和PC相对地址指令
# Note: lu12i.w accepts 20-bit signed immediate (-524288 to 524287, i.e., -0x80000 to 0x7FFFF)

.text
.globl _start

_start:
    # Set up base address for storing results
    lu12i.w $r20, 14           # $r20 = 0xE000

    # ==========================================
    # Test lu12i.w (Load Upper Immediate)
    # rd = SignExtend({si20, 12'b0}, 32)
    # ==========================================

    # Test 1: Load 0x12345 into upper 20 bits
    # Result: 0x12345000
    lu12i.w $r1, 0x12345

    # Test 2: Load 0x00001 into upper 20 bits
    # Result: 0x00001000
    lu12i.w $r2, 1

    # Test 3: Load -1 (0xFFFFF) into upper 20 bits
    # Result: 0xFFFFF000 (sign extended to 32 bits)
    lu12i.w $r3, -1

    # Test 4: Load 0x7FFFF (max positive, MSB of si20 not set)
    # Result: 0x7FFFF000
    lu12i.w $r4, 0x7FFFF

    # Test 5: Load -0x80000 (min negative)
    # Result: 0x80000000
    lu12i.w $r5, -524288

    # Test 6: Combine lu12i.w with ori to create full 32-bit constant
    # Create 0x12345678
    lu12i.w $r6, 0x12345       # $r6 = 0x12345000
    ori     $r6, $r6, 0x678    # $r6 = 0x12345678

    # Create 0x7FFFFEEF (using max positive upper)
    lu12i.w $r7, 0x7FFFE       # $r7 = 0x7FFFE000
    ori     $r7, $r7, 0xEEF    # $r7 = 0x7FFFEEEF

    # ==========================================
    # Test pcaddu12i (PC + SignExtend({si20, 12'b0}))
    # rd = PC + SignExtend({si20, 12'b0}, 32)
    # ==========================================

    # Test 1: pcaddu12i with 0
    # Should give current PC
    pcaddu12i $r8, 0           # $r8 = PC

    # Test 2: pcaddu12i with 1
    # Should give PC + 0x1000
    pcaddu12i $r9, 1           # $r9 = PC + 0x1000

    # ==========================================
    # Test pcalau12i (PC aligned + SignExtend({si20, 12'b0}))
    # tmp = PC + SignExtend({si20, 12'b0}, 32)
    # rd = {tmp[31:12], 12'b0}
    # ==========================================

    # Test 1: pcalau12i with 0
    pcalau12i $r10, 0          # $r10 = (PC + 0) & 0xFFFFF000

    # Test 2: pcalau12i with 1
    pcalau12i $r11, 1          # $r11 = (PC + 0x1000) & 0xFFFFF000

    # ==========================================
    # Test pcaddu18i (PC + SignExtend({si20, 18'b0}))
    # rd = PC + SignExtend({si20, 18'b0}, 32)
    # ==========================================

    # Test 1: pcaddu18i with 0
    pcaddu18i $r12, 0          # $r12 = PC

    # Test 2: pcaddu18i with 1
    # Should give PC + 0x40000 (1 << 18)
    pcaddu18i $r13, 1          # $r13 = PC + 0x40000

    # ==========================================
    # Test practical use cases
    # ==========================================

    # Use case 1: Loading a 32-bit address within signed range
    # Address 0x12341234
    lu12i.w $r14, 0x12341      # Upper 20 bits
    ori     $r14, $r14, 0x234  # Lower 12 bits

    # Use case 2: PC-relative addressing for data access
    # Typically used with pcalau12i + ld.w/st.w offset
    pcalau12i $r15, 0          # Get page-aligned PC
    # Then use offset in load/store

    # Use case 3: Creating negative constants
    # Create -0x1000 (0xFFFFF000)
    lu12i.w $r16, -1           # All 1s in upper 20 bits, zeros in lower 12

    # Create -1 (0xFFFFFFFF)
    lu12i.w $r17, -1
    ori     $r17, $r17, 0xFFF  # Fill in lower 12 bits

    # ==========================================
    # Store results for verification
    # ==========================================
    st.w    $r1, $r20, 0       # 0x12345000
    st.w    $r2, $r20, 4       # 0x00001000
    st.w    $r3, $r20, 8       # 0xFFFFF000
    st.w    $r4, $r20, 12      # 0x7FFFF000
    st.w    $r5, $r20, 16      # 0x80000000
    st.w    $r6, $r20, 20      # 0x12345678
    st.w    $r7, $r20, 24      # 0x7FFFEEEF
    st.w    $r8, $r20, 28      # PC value
    st.w    $r9, $r20, 32      # PC + 0x1000
    st.w    $r10, $r20, 36     # aligned PC
    st.w    $r11, $r20, 40     # aligned PC + 0x1000
    st.w    $r12, $r20, 44     # PC (pcaddu18i)
    st.w    $r13, $r20, 48     # PC + 0x40000
    st.w    $r14, $r20, 52     # 0x12341234
    st.w    $r16, $r20, 56     # 0xFFFFF000
    st.w    $r17, $r20, 60     # 0xFFFFFFFF

    # Verify lu12i.w + addi.w pattern for addresses
    # Create address 0x00001234
    lu12i.w $r18, 1            # $r18 = 0x1000
    addi.w  $r18, $r18, 0x234  # $r18 = 0x1234
    st.w    $r18, $r20, 64     # 0x00001234

    # Test negative immediate with lu12i.w for creating addresses
    # Create 0xFFFFE000 (-8192)
    lu12i.w $r19, -2           # $r19 = 0xFFFFE000
    st.w    $r19, $r20, 68     # 0xFFFFE000
