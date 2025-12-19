# Test branch instructions: beqz, bnez, beq, bne, b, bl
# 测试分支指令

.text
.globl _start

_start:
    # Set up base address for storing results
    lu12i.w $r20, 11           # $r20 = 0xB000

    # Initialize test values
    addi.w  $r1, $r0, 0        # $r1 = 0
    addi.w  $r2, $r0, 10       # $r2 = 10
    addi.w  $r3, $r0, 10       # $r3 = 10 (equal to $r2)
    addi.w  $r4, $r0, 20       # $r4 = 20

    # Test result register
    addi.w  $r10, $r0, 0       # $r10 = test result accumulator

    # ==========================================
    # Test beqz (branch if equal to zero)
    # ==========================================
    addi.w  $r10, $r10, 1      # $r10 = 1 (test 1 started)
    beqz    $r1, beqz_taken    # Should branch (r1 == 0)
    addi.w  $r10, $r0, -1      # Should not execute
    b       test_fail
beqz_taken:
    addi.w  $r10, $r10, 1      # $r10 = 2 (beqz taken correctly)

    # Test beqz not taken
    beqz    $r2, test_fail     # Should NOT branch (r2 != 0)
    addi.w  $r10, $r10, 1      # $r10 = 3 (beqz not taken correctly)

    # ==========================================
    # Test bnez (branch if not equal to zero)
    # ==========================================
    bnez    $r2, bnez_taken    # Should branch (r2 != 0)
    addi.w  $r10, $r0, -1      # Should not execute
    b       test_fail
bnez_taken:
    addi.w  $r10, $r10, 1      # $r10 = 4 (bnez taken correctly)

    # Test bnez not taken
    bnez    $r1, test_fail     # Should NOT branch (r1 == 0)
    addi.w  $r10, $r10, 1      # $r10 = 5 (bnez not taken correctly)

    # ==========================================
    # Test beq (branch if equal)
    # ==========================================
    beq     $r2, $r3, beq_taken    # Should branch (r2 == r3 == 10)
    addi.w  $r10, $r0, -1      # Should not execute
    b       test_fail
beq_taken:
    addi.w  $r10, $r10, 1      # $r10 = 6 (beq taken correctly)

    # Test beq not taken
    beq     $r2, $r4, test_fail    # Should NOT branch (10 != 20)
    addi.w  $r10, $r10, 1      # $r10 = 7 (beq not taken correctly)

    # ==========================================
    # Test bne (branch if not equal)
    # ==========================================
    bne     $r2, $r4, bne_taken    # Should branch (10 != 20)
    addi.w  $r10, $r0, -1      # Should not execute
    b       test_fail
bne_taken:
    addi.w  $r10, $r10, 1      # $r10 = 8 (bne taken correctly)

    # Test bne not taken
    bne     $r2, $r3, test_fail    # Should NOT branch (10 == 10)
    addi.w  $r10, $r10, 1      # $r10 = 9 (bne not taken correctly)

    # ==========================================
    # Test b (unconditional branch)
    # ==========================================
    b       b_target
    addi.w  $r10, $r0, -1      # Should not execute
    b       test_fail
b_target:
    addi.w  $r10, $r10, 1      # $r10 = 10 (b taken correctly)

    # ==========================================
    # Test bl (branch and link)
    # ==========================================
    bl      bl_target
    # After bl, $r1 should contain return address (PC + 4)
    addi.w  $r10, $r10, 1      # $r10 = 12 (returned from bl correctly)
    b       test_done

bl_target:
    addi.w  $r10, $r10, 1      # $r10 = 11 (bl taken correctly)
    # $r1 now contains return address
    # Use jirl to return (jirl $r0, $r1, 0 is essentially ret)
    jirl    $r0, $r1, 0

test_fail:
    addi.w  $r10, $r0, -1      # Mark test as failed

test_done:
    # Store final result
    st.w    $r10, $r20, 0      # Store test result (should be 12 if all passed)

    # Additional branch tests with backward jumps
    addi.w  $r11, $r0, 0       # $r11 = loop counter
    addi.w  $r12, $r0, 5       # $r12 = loop limit

loop_start:
    addi.w  $r11, $r11, 1      # Increment counter
    bne     $r11, $r12, loop_start  # Loop until counter == 5

    st.w    $r11, $r20, 4      # Store loop counter (should be 5)

    # Test forward branch over multiple instructions
    addi.w  $r13, $r0, 1
    b       skip_block
    addi.w  $r13, $r13, 10     # Should be skipped
    addi.w  $r13, $r13, 20     # Should be skipped
    addi.w  $r13, $r13, 30     # Should be skipped
skip_block:
    st.w    $r13, $r20, 8      # Store (should be 1, not 61)
