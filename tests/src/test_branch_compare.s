# Test comparison branch instructions: bgt, ble, bgtu, bleu
# 测试比较分支指令 (signed and unsigned)

.text
.globl _start

_start:
    # Set up base address for storing results
    lu12i.w $r20, 12           # $r20 = 0xC000

    # Initialize test values
    addi.w  $r1, $r0, 10       # $r1 = 10
    addi.w  $r2, $r0, 20       # $r2 = 20
    addi.w  $r3, $r0, 10       # $r3 = 10 (equal to $r1)
    addi.w  $r4, $r0, -5       # $r4 = -5 (0xFFFFFFFB, large unsigned)
    addi.w  $r5, $r0, -10      # $r5 = -10 (0xFFFFFFF6)

    # Test result register
    addi.w  $r10, $r0, 0       # $r10 = test result accumulator

    # ==========================================
    # Test bgt (branch if greater than, signed)
    # Note: bgt rd, rj means branch if rj >= rd (swapped operands from blt)
    # ==========================================
    addi.w  $r10, $r10, 1      # $r10 = 1

    # Test: 20 > 10 (should branch, rj=20 >= rd=10)
    bgt     $r1, $r2, bgt_taken1   # bgt $r1, $r2 means branch if $r2 >= $r1
    b       test_fail
bgt_taken1:
    addi.w  $r10, $r10, 1      # $r10 = 2

    # Test: 10 > 20 (should NOT branch)
    bgt     $r2, $r1, test_fail    # bgt $r2, $r1 means branch if $r1 >= $r2
    addi.w  $r10, $r10, 1      # $r10 = 3

    # Test: 10 >= 10 (should branch, equal case)
    bgt     $r1, $r3, bgt_taken2   # bgt with equal values
    b       test_fail
bgt_taken2:
    addi.w  $r10, $r10, 1      # $r10 = 4

    # Test with negative: -5 vs 10 (signed comparison)
    # -5 is less than 10 in signed, so 10 >= -5 should branch
    bgt     $r4, $r1, bgt_taken3   # branch if $r1 >= $r4 (10 >= -5)
    b       test_fail
bgt_taken3:
    addi.w  $r10, $r10, 1      # $r10 = 5

    # ==========================================
    # Test ble (branch if less than or equal, signed)
    # Note: ble rd, rj means branch if rj < rd
    # ==========================================
    # Test: 10 < 20 (should branch)
    ble     $r2, $r1, ble_taken1   # branch if $r1 < $r2
    b       test_fail
ble_taken1:
    addi.w  $r10, $r10, 1      # $r10 = 6

    # Test: 20 < 10 (should NOT branch)
    ble     $r1, $r2, test_fail    # branch if $r2 < $r1
    addi.w  $r10, $r10, 1      # $r10 = 7

    # Test with negative: -5 < 10 (signed)
    ble     $r1, $r4, ble_taken2   # branch if $r4 < $r1
    b       test_fail
ble_taken2:
    addi.w  $r10, $r10, 1      # $r10 = 8

    # Test: -10 < -5 (both negative)
    ble     $r4, $r5, ble_taken3   # branch if $r5 < $r4 (-10 < -5)
    b       test_fail
ble_taken3:
    addi.w  $r10, $r10, 1      # $r10 = 9

    # ==========================================
    # Test bgtu (branch if greater than, unsigned)
    # Note: bgtu rd, rj means branch if rj >= rd (unsigned)
    # ==========================================
    # Test: 20 > 10 unsigned (should branch)
    bgtu    $r1, $r2, bgtu_taken1
    b       test_fail
bgtu_taken1:
    addi.w  $r10, $r10, 1      # $r10 = 10

    # Test: 0xFFFFFFFB (-5) > 10 unsigned (should branch, -5 is large unsigned)
    bgtu    $r1, $r4, bgtu_taken2  # branch if $r4 >= $r1 (unsigned)
    b       test_fail
bgtu_taken2:
    addi.w  $r10, $r10, 1      # $r10 = 11

    # Test: 10 > 0xFFFFFFFB unsigned (should NOT branch)
    bgtu    $r4, $r1, test_fail    # branch if $r1 >= $r4 (unsigned)
    addi.w  $r10, $r10, 1      # $r10 = 12

    # ==========================================
    # Test bleu (branch if less than or equal, unsigned)
    # Note: bleu rd, rj means branch if rj < rd (unsigned)
    # ==========================================
    # Test: 10 < 20 unsigned (should branch)
    bleu    $r2, $r1, bleu_taken1
    b       test_fail
bleu_taken1:
    addi.w  $r10, $r10, 1      # $r10 = 13

    # Test: 10 < 0xFFFFFFFB unsigned (should branch)
    bleu    $r4, $r1, bleu_taken2  # branch if $r1 < $r4 (unsigned)
    b       test_fail
bleu_taken2:
    addi.w  $r10, $r10, 1      # $r10 = 14

    # Test: 0xFFFFFFFB < 10 unsigned (should NOT branch)
    bleu    $r1, $r4, test_fail    # branch if $r4 < $r1 (unsigned)
    addi.w  $r10, $r10, 1      # $r10 = 15

    b       test_done

test_fail:
    addi.w  $r10, $r0, -1      # Mark test as failed

test_done:
    # Store final result
    st.w    $r10, $r20, 0      # Store test result (should be 15 if all passed)

    # Additional tests: loop using comparison branches
    addi.w  $r11, $r0, 0       # $r11 = counter
    addi.w  $r12, $r0, 10      # $r12 = limit

count_loop:
    addi.w  $r11, $r11, 1
    ble     $r12, $r11, count_loop  # while $r11 < $r12
    
    st.w    $r11, $r20, 4      # Store counter (should be 10)

    # Sum from 1 to 5 using comparison branch
    addi.w  $r13, $r0, 0       # $r13 = sum
    addi.w  $r14, $r0, 1       # $r14 = i
    addi.w  $r15, $r0, 5       # $r15 = limit

sum_loop:
    add.w   $r13, $r13, $r14   # sum += i
    addi.w  $r14, $r14, 1      # i++
    bgt     $r14, $r15, sum_done   # if i > 5, exit (branch if $r15 >= $r14)
    b       sum_loop

sum_done:
    # Note: the loop condition means we include i when i <= 5
    # So sum = 1+2+3+4+5 = 15... but we need to check the exact semantics
    st.w    $r13, $r20, 8      # Store sum
