# Test jump instructions for LoongArch
# 测试龙芯架构跳转指令
#
# Instructions tested:
# 1. jirl - Jump and Link Register
# 2. bl - Branch and Link (pseudo-instruction using jirl)
# 3. b - Branch (pseudo-instruction using jirl)
#
# jirl format: jirl rd, rj, offset
#   rd = PC + 4 (return address)
#   PC = rj + offset
#
# bl format: bl target
#   $r1 = PC + 4
#   PC = target
#
# b format: b target
#   PC = target (no link)

.text
.globl _start

_start:
    # Initialize base address for result storage
    lu12i.w $r20, 13           # $r20 = 0xD000 (base address)
    
    # Initialize test result accumulator
    addi.w  $r10, $r0, 0       # $r10 = test result accumulator (starts at 0)
    
    # ==========================================
    # Test 1: Basic bl instruction (function call)
    # ==========================================
test_bl_basic:
    addi.w  $r10, $r10, 1      # $r10 = 1
    bl      func_bl_basic
    # After return $r10 should be 3
    addi.w  $r10, $r10, 1      # $r10 = 4
    st.w    $r10, $r20, 0

    # ==========================================
    # Test 2: Nested function calls
    # ==========================================
test_nested_calls:
    addi.w  $r10, $r10, 1      # $r10 = 5
    bl      func_outer
    # After nested calls, $r10 should be 11
    addi.w  $r10, $r10, 1      # $r10 = 12
    st.w    $r10, $r20, 4
    # ==========================================
    # Test 3: jirl with explicit return address
    # ==========================================
test_jirl_explicit:
    addi.w  $r10, $r10, 1      # $r10 = 13
    pcaddu12i $r21, 0
    addi.w  $r21, $r21, 36     # Point to after_jirl_explicit
    pcaddu12i $r22, 0
    addi.w  $r22, $r22, 20     # Point to jirl_target
    jirl    $r0, $r22, 0
    
    # This should be skipped
    addi.w  $r10, $r0, -1      # Error marker
    b       test_fail
    
jirl_target:
    addi.w  $r10, $r10, 1      # $r10 = 14
    jirl    $r0, $r21, 0
    
after_jirl_explicit:
    addi.w  $r10, $r10, 1      # $r10 = 15
    st.w    $r10, $r20, 8
    
    # ==========================================
    # Test 4: jirl with offset
    # ==========================================
test_jirl_offset:
    addi.w  $r10, $r10, 1      # $r10 = 16
    
    pcaddu12i $r23, 0
    addi.w  $r23, $r23, 12
    jirl    $r0, $r23, 8       # Point to jirl_offset_target
    
    # These should be skipped
    addi.w  $r10, $r0, -1
    addi.w  $r10, $r0, -1
    
jirl_offset_target:
    addi.w  $r10, $r10, 1      # $r10 = 17
    st.w    $r10, $r20, 12
    
    # ==========================================
    # Test 5: jirl with $r0 as destination (pure jump)
    # ==========================================
test_jirl_pure_jump:
    addi.w  $r10, $r10, 1      # $r10 = 18
    
    pcaddu12i $r24, 0
    addi.w  $r24, $r24, 20     # Point to pure_jump_target
    jirl    $r0, $r24, 0
    
    # This should be skipped
    addi.w  $r10, $r0, -1
    b       test_fail
    
pure_jump_target:
    addi.w  $r10, $r10, 1      # $r10 = 19
    st.w    $r10, $r20, 16
    
    # ==========================================
    # Test 6: Forward and backward branches
    # ==========================================
test_forward_branch:
    addi.w  $r10, $r10, 1      # $r10 = 20
    b       forward_target
    
    # This should be skipped
    addi.w  $r10, $r0, -1

backward_target:
    addi.w  $r10, $r10, 1      # $r10 = 22
    b       test_done

forward_target:
    addi.w  $r10, $r10, 1      # $r10 = 21
    b       backward_target
    
    # ==========================================
    # Function Definitions
    # ==========================================

func_bl_basic:
    addi.w  $r10, $r10, 1      # $r10 = 2
    addi.w  $r10, $r10, 1      # $r10 = 3
    jirl    $r0, $r1, 0

func_outer:
    addi.w  $r30, $r1, 0
    
    addi.w  $r10, $r10, 1      # $r10 = 6
    bl      func_inner
    addi.w  $r10, $r10, 1      # $r10 = 10 (back from inner)
    addi.w  $r10, $r10, 1      # $r10 = 11
    
    jirl    $r0, $r30, 0

# Test 2: Inner function
func_inner:
    addi.w  $r10, $r10, 1      # $r10 = 7
    addi.w  $r10, $r10, 1      # $r10 = 8
    addi.w  $r10, $r10, 1      # $r10 = 9
    jirl    $r0, $r1, 0

# ==========================================
# Test failure handler
# ==========================================
test_fail:
    addi.w  $r10, $r0, -1

# ==========================================
# Test completion
# ==========================================
test_done:
    st.w    $r10, $r20, 20