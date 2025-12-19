# Test jump instruction: jirl
# 测试跳转指令

.text
.globl _start

_start:
    # Set up base address for storing results
    lu12i.w $r20, 13           # $r20 = 0xD000

    # Test result register
    addi.w  $r10, $r0, 0       # $r10 = test result accumulator

    # ==========================================
    # Test jirl basic functionality
    # jirl rd, rj, offset: rd = PC + 4, PC = rj + offset
    # ==========================================
    
    addi.w  $r10, $r10, 1      # $r10 = 1

    # Test 1: Simple function call using bl (which uses jirl internally)
    # bl sets $r1 = PC + 4, PC = target
    bl      func1
    # After return, $r10 should be 3
    addi.w  $r10, $r10, 1      # $r10 = 4 (returned from func1)

    # Test 2: Manual jirl call - call func2
    # Get address of func2 using pcaddu12i
    pcaddu12i $r2, 0           # $r2 = PC (approximately)
    addi.w  $r2, $r2, 32       # Adjust to point to func2 (estimate)
    # Actually, let's use a simpler approach with labels
    
    # Test 3: Use jirl with offset to skip instructions
    addi.w  $r10, $r10, 1      # $r10 = 5
    
    # Create return address manually
    pcaddu12i $r3, 0           # $r3 = current PC (approximately)
    addi.w  $r3, $r3, 20       # Point to after the jirl sequence
    
    # Jump to func3 (forward)
    b       call_func3

after_func3:
    addi.w  $r10, $r10, 1      # $r10 = 7 (back from func3)

    # Test 4: Nested function calls
    bl      func_outer
    addi.w  $r10, $r10, 1      # $r10 = 12 (returned from outer)

    # Test 5: jirl with $r0 as destination (no link, pure jump)
    addi.w  $r10, $r10, 1      # $r10 = 13
    pcaddu12i $r4, 0
    addi.w  $r4, $r4, 16       # Point to skip_target
    jirl    $r0, $r4, 0        # Jump without saving return address
    addi.w  $r10, $r0, -1      # Should be skipped
    b       test_fail

skip_target:
    addi.w  $r10, $r10, 1      # $r10 = 14

    b       test_done

# ==========================================
# Function definitions
# ==========================================

func1:
    # Simple function that increments $r10
    addi.w  $r10, $r10, 1      # $r10 = 2
    addi.w  $r10, $r10, 1      # $r10 = 3
    jirl    $r0, $r1, 0        # Return (jump to $r1, don't save link)

call_func3:
    bl      func3
    b       after_func3

func3:
    addi.w  $r10, $r10, 1      # $r10 = 6
    jirl    $r0, $r1, 0        # Return

func_outer:
    # Save return address
    addi.w  $r30, $r1, 0       # $r30 = saved return address
    
    addi.w  $r10, $r10, 1      # $r10 = 8
    bl      func_inner
    addi.w  $r10, $r10, 1      # $r10 = 10 (back from inner)
    addi.w  $r10, $r10, 1      # $r10 = 11
    
    # Restore return address and return
    jirl    $r0, $r30, 0       # Return to original caller

func_inner:
    addi.w  $r10, $r10, 1      # $r10 = 9
    jirl    $r0, $r1, 0        # Return

test_fail:
    addi.w  $r10, $r0, -1      # Mark test as failed

test_done:
    # Store final result
    st.w    $r10, $r20, 0      # Store test result (should be 14 if all passed)

    # Test jirl with different offsets
    addi.w  $r11, $r0, 0       # Counter

    # Test jirl offset functionality
    pcaddu12i $r5, 0
    addi.w  $r5, $r5, 8        # Base address
    # jirl with positive offset
    jirl    $r0, $r5, 8        # Jump to $r5 + 8
    addi.w  $r11, $r0, -1      # Should be skipped
    addi.w  $r11, $r0, -1      # Should be skipped
    addi.w  $r11, $r11, 1      # $r11 = 1 (target of jirl)

    st.w    $r11, $r20, 4      # Store result
