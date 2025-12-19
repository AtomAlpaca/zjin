# Test conditional mask instructions: maskeqz, masknez
# 测试条件掩码指令

.text
.globl _start

_start:
    # Initialize test values
    addi.w  $r1, $r0, 100      # $r1 = 100
    addi.w  $r2, $r0, 0        # $r2 = 0
    addi.w  $r3, $r0, 1        # $r3 = 1
    addi.w  $r4, $r0, -1       # $r4 = -1 (0xFFFFFFFF)
    addi.w  $r5, $r0, 42       # $r5 = 42

    # Test maskeqz: rd = (rk == 0) ? 0 : rj
    # If rk is zero, result is 0; otherwise result is rj
    
    # $r10 = ($r2 == 0) ? 0 : $r1 = 0 (because $r2 is 0)
    maskeqz $r10, $r1, $r2

    # $r11 = ($r3 == 0) ? 0 : $r1 = 100 (because $r3 is not 0)
    maskeqz $r11, $r1, $r3

    # $r12 = ($r4 == 0) ? 0 : $r5 = 42 (because $r4 is not 0)
    maskeqz $r12, $r5, $r4

    # $r13 = ($r0 == 0) ? 0 : $r1 = 0 (because $r0 is always 0)
    maskeqz $r13, $r1, $r0

    # Test masknez: rd = (rk != 0) ? 0 : rj
    # If rk is NOT zero, result is 0; otherwise result is rj
    
    # $r14 = ($r2 != 0) ? 0 : $r1 = 100 (because $r2 is 0)
    masknez $r14, $r1, $r2

    # $r15 = ($r3 != 0) ? 0 : $r1 = 0 (because $r3 is not 0)
    masknez $r15, $r1, $r3

    # $r16 = ($r4 != 0) ? 0 : $r5 = 0 (because $r4 is not 0)
    masknez $r16, $r5, $r4

    # $r17 = ($r0 != 0) ? 0 : $r1 = 100 (because $r0 is always 0)
    masknez $r17, $r1, $r0

    # Test using maskeqz and masknez together to implement conditional move
    # This is a common pattern: select = (cond) ? a : b
    # Implemented as: select = maskeqz(a, cond) | masknez(b, cond)
    
    # Condition in $r3 (non-zero), select between $r1 (100) and $r5 (42)
    # Expected: 100 (because condition is true/non-zero)
    maskeqz $r18, $r1, $r3    # $r18 = 100 (condition true)
    masknez $r19, $r5, $r3    # $r19 = 0 (condition true, so take a)
    or      $r21, $r18, $r19  # $r21 = 100 | 0 = 100

    # Condition in $r2 (zero), select between $r1 (100) and $r5 (42)
    # Expected: 42 (because condition is false/zero)
    maskeqz $r22, $r1, $r2    # $r22 = 0 (condition false)
    masknez $r23, $r5, $r2    # $r23 = 42 (condition false, so take b)
    or      $r24, $r22, $r23  # $r24 = 0 | 42 = 42

    # Store results for verification
    lu12i.w $r20, 6            # $r20 = 0x6000
    st.w    $r10, $r20, 0      # Store 0 (maskeqz, rk=0)
    st.w    $r11, $r20, 4      # Store 100 (maskeqz, rk!=0)
    st.w    $r12, $r20, 8      # Store 42 (maskeqz, rk=-1)
    st.w    $r13, $r20, 12     # Store 0 (maskeqz, rk=$r0)
    st.w    $r14, $r20, 16     # Store 100 (masknez, rk=0)
    st.w    $r15, $r20, 20     # Store 0 (masknez, rk!=0)
    st.w    $r16, $r20, 24     # Store 0 (masknez, rk=-1)
    st.w    $r17, $r20, 28     # Store 100 (masknez, rk=$r0)
    st.w    $r21, $r20, 32     # Store 100 (conditional select, cond=true)
    st.w    $r24, $r20, 36     # Store 42 (conditional select, cond=false)
