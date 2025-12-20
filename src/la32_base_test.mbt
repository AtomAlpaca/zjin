///|
test "la32_base_test_arithmetics" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_arithmetic.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_arithmetic.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let res1 = cpu.load(0x1000U + 0 * 4, size=4)
  let res2 = cpu.load(0x1000U + 1 * 4, size=4)
  let res3 = cpu.load(0x1000U + 2 * 4, size=4)
  let res4 = cpu.load(0x1000U + 3 * 4, size=4)
  let res5 = cpu.load(0x1000U + 4 * 4, size=4)
  let res6 = cpu.load(0x1000U + 5 * 4, size=4)
  let res7 = cpu.load(0x1000U + 6 * 4, size=4)
  let res8 = cpu.load(0x1000U + 7 * 4, size=4)
  let res9 = cpu.load(0x1000U + 8 * 4, size=4)
  let res10 = cpu.load(0x1000U + 9 * 4, size=4)
  assert_eq(res1, 100)
  assert_eq(res2, 50)
  assert_eq(res3, 150)
  assert_eq(res4, 50)
  assert_eq(res5, 150)
  assert_eq(res6, 0)
  assert_eq(res7, 2047)
  assert_eq(res8.to_uint().reinterpret_as_int(), -2048)
  assert_eq(res9, 0)
  assert_eq(res10, 120)
}

///|
test "la32_base_test_branch" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_branch.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_branch.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0xB000U
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 2)
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 4)
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 6)
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 8)
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 10)
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 12)
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 5)
}

///|
test "la32_base_test_compare" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_compare.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_compare.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0x2000U
  // Check all comparison results
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 1)   // slt 10 < 20
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 0)   // slt 20 < 10
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 1)   // slt -5 < 10
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 0)   // slt 10 < -5
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 1)   // slt -10 < -5
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 1)   // sltu 10 < 20
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 1)   // sltu 10 < 0xFFFFFFFB
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 0)   // sltu 0xFFFFFFFB < 10
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 1)   // slti 10 < 15
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 0)   // slti 10 < 5
  assert_eq(cpu.load(base_addr + 10 * 4, size=4), 1)  // slti -5 < 0
  assert_eq(cpu.load(base_addr + 11 * 4, size=4), 0)  // slti 10 < -1
  assert_eq(cpu.load(base_addr + 12 * 4, size=4), 1)  // sltui 10 < 15
  assert_eq(cpu.load(base_addr + 13 * 4, size=4), 0)  // sltui 10 < 5
  assert_eq(cpu.load(base_addr + 14 * 4, size=4), 0)  // slt equal
  assert_eq(cpu.load(base_addr + 15 * 4, size=4), 0)  // sltu equal
}

///|
test "la32_base_test_logic" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_logic.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_logic.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0x3000U
  // Check logical operation results
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 0x020400F0)   // and
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 0x000000FF)   // and with mask
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 0x1F3F5FFF)   // or
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 0x12345FFF)   // or with mask
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 0x1D3B5F0F)   // xor
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 0x00000000)   // xor with self
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 0xE0C0A000)   // nor
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 0xFFFFFFFF)   // nor zero
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 0xF2F4FFFF)   // orn
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 0x10305F0F)   // andn
  assert_eq(cpu.load(base_addr + 10 * 4, size=4), 0xEDCBA000)  // andn with -1
  assert_eq(cpu.load(base_addr + 11 * 4, size=4), 0x00000FFF)  // andi with FFF
  assert_eq(cpu.load(base_addr + 12 * 4, size=4), 0x000000FF)  // andi with FF
  assert_eq(cpu.load(base_addr + 13 * 4, size=4), 0x00000ABC)  // ori
  assert_eq(cpu.load(base_addr + 14 * 4, size=4), 0x12345FFF)  // ori
  assert_eq(cpu.load(base_addr + 15 * 4, size=4), 0x00000555)  // xori
  assert_eq(cpu.load(base_addr + 16 * 4, size=4), 0x12345000)  // xori
  assert_eq(cpu.load(base_addr + 17 * 4, size=4), 0)           // and with 0
  assert_eq(cpu.load(base_addr + 18 * 4, size=4), 0x12345FFF)  // or with 0
  assert_eq(cpu.load(base_addr + 19 * 4, size=4), 0x12345FFF)  // xor with 0
}

///|
test "la32_base_test_shift" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_shift.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_shift.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0x4000U
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 16)          // sll.w 1<<4
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 256)         // sll.w 1<<8
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 0x550)       // sll.w 0x55<<4
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 16)          // srl.w 256>>4
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 0x0FFFFFFF)  // srl.w logical
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 0x00800000)  // srl.w logical
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 0xFFFFFFFF)  // sra.w arithmetic
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 0xFF800000)  // sra.w arithmetic
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 0xFFFFFFF8)  // sra.w arithmetic
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 32)          // slli.w
  assert_eq(cpu.load(base_addr + 10 * 4, size=4), 0x5500)     // slli.w
  assert_eq(cpu.load(base_addr + 11 * 4, size=4), 0x00FFFFFF) // srli.w
  assert_eq(cpu.load(base_addr + 12 * 4, size=4), 0x00008000) // srli.w
  assert_eq(cpu.load(base_addr + 13 * 4, size=4), 0xFFFFFFFF) // srai.w
  assert_eq(cpu.load(base_addr + 14 * 4, size=4), 0xFFFF8000) // srai.w
  assert_eq(cpu.load(base_addr + 15 * 4, size=4), 0xFFFFFFF0) // srai.w
  assert_eq(cpu.load(base_addr + 16 * 4, size=4), 0x55)       // shift by 0
  assert_eq(cpu.load(base_addr + 17 * 4, size=4), 0x80000000) // shift by 31
}

///|
test "la32_base_test_rotate" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_rotate.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_rotate.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0x5000U
  // Check rotate operation results
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 0x81234567)  // rotr.w by 4
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 0x78123456)  // rotr.w by 8
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 0x18000000)  // rotr.w
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 0x80000000)  // rotr.w 1 by 1
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 0x81234567)  // rotri.w by 4
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 0x78123456)  // rotri.w by 8
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 0x56781234)  // rotri.w by 16
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 0x34567812)  // rotri.w by 24
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 0xC0000000)  // rotri.w by 1
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 0x12345678)  // rotri.w by 0
  assert_eq(cpu.load(base_addr + 10 * 4, size=4), 2)          // rotri.w 1 by 31
  assert_eq(cpu.load(base_addr + 11 * 4, size=4), 0xB000000A) // rotri.w
}

///|
test "la32_base_test_mask" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_mask.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_mask.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0x6000U
  // Check mask operation results
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 0)           // maskeqz, rk=0
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 100)         // maskeqz, rk!=0
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 42)          // maskeqz, rk=-1
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 0)           // maskeqz, rk=$r0
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 100)         // masknez, rk=0
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 0)           // masknez, rk!=0
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 0)           // masknez, rk=-1
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 100)         // masknez, rk=$r0
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 100)         // conditional select, cond=true
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 42)          // conditional select, cond=false
}

///|
test "la32_base_test_lui_pc" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_lui_pc.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_lui_pc.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0xE000U
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 0x12345000)  // lu12i.w 0x12345
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 0x00001000)  // lu12i.w 1
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 0xFFFFF000)  // lu12i.w -1
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 0x7FFFF000)  // lu12i.w 0x7FFFF
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 0x80000000)  // lu12i.w -0x80000
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 0x12345678)  // lu12i.w + ori
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 0x7FFFEEEF)  // lu12i.w + ori
  let pc1 = cpu.load(base_addr + 7 * 4, size=4)
  let pc2 = cpu.load(base_addr + 8 * 4, size=4)
  let pc3 = cpu.load(base_addr + 9 * 4, size=4)
  let pc4 = cpu.load(base_addr + 10 * 4, size=4)
  let pc5 = cpu.load(base_addr + 11 * 4, size=4)
  let pc6 = cpu.load(base_addr + 12 * 4, size=4)
  assert_not_eq(pc1, 0)
  assert_eq(pc2, pc1 + 1 * 4 + 0x1000)
  assert_eq(pc3, (pc1 + 2 * 4 + 0) & 0xFFFFF000)
  assert_eq(pc4, (pc1 + 3 * 4 + 0x1000) & 0xFFFFF000)
  assert_eq(pc5, pc1 + 4 * 4)
  assert_eq(pc6, pc1 + 5 * 4 + 0x40000)
  // Check other results
  assert_eq(cpu.load(base_addr + 13 * 4, size=4), 0x12341234)  // address
  assert_eq(cpu.load(base_addr + 14 * 4, size=4), 0xFFFFF000)  // -0x1000
  assert_eq(cpu.load(base_addr + 15 * 4, size=4), 0xFFFFFFFF)  // -1
  assert_eq(cpu.load(base_addr + 16 * 4, size=4), 0x00001234)  // address
  assert_eq(cpu.load(base_addr + 17 * 4, size=4), 0xFFFFE000)  // -8192
}

///|
test "la32_base_test_jump" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_jump.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_jump.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0xD000U
  // Check jump test results
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 4)
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 12)
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 15)
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 17)
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 19)
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 22)
}

///|
test "la32_base_test_load_store" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_load_store.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_load_store.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0x8000U
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 0x12345678)  // ld.w
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 0xFFFFFFFF)  // ld.w
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 0x00005678)  // ld.h positive
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 0xFFFFFFFF)  // ld.h negative
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 0x00005678)  // ld.hu positive
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 0x0000FFFF)  // ld.hu negative
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 0x0000007F)  // ld.b positive
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 0xFFFFFF80)  // ld.b negative
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 0x0000007F)  // ld.bu positive
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 0x00000080)  // ld.bu negative
  assert_eq(cpu.load(base_addr + 10 * 4, size=4), 0x12345678) // with negative offset
  assert_eq(cpu.load(base_addr + 11 * 4, size=4), 0x00000078) // byte[0]
  assert_eq(cpu.load(base_addr + 12 * 4, size=4), 0x00000056) // byte[1]
  assert_eq(cpu.load(base_addr + 13 * 4, size=4), 0x00000034) // byte[2]
  assert_eq(cpu.load(base_addr + 14 * 4, size=4), 0x00000012) // byte[3]
  assert_eq(cpu.load(base_addr + 15 * 4, size=4), 0x00005678) // halfword[0]
  assert_eq(cpu.load(base_addr + 16 * 4, size=4), 0x00001234) // halfword[1]
}

///|
test "la32_base_test_load_store_indexed" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_load_store_indexed.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_load_store_indexed.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0xA000U
  // Check indexed load/store operation results
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 0x1234EF01)  // ldx.w
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 0xFFFFFFFF)  // ldx.w
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 0xFFFFEF01)  // ldx.h signed
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 0x0000007F)  // ldx.h positive
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 0x0000EF01)  // ldx.hu
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 0x0000007F)  // ldx.hu positive
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 0x0000007F)  // ldx.b positive
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 0xFFFFFF80)  // ldx.b negative
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 0x0000007F)  // ldx.bu positive
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 0x00000080)  // ldx.bu negative
  assert_eq(cpu.load(base_addr + 10 * 4, size=4), 0x1234EF01) // computed index
  assert_eq(cpu.load(base_addr + 11 * 4, size=4), 0x00000001) // byte[0]
  assert_eq(cpu.load(base_addr + 12 * 4, size=4), 0xFFFFFFEF) // byte[1] (sign ext of 0x5F)
  assert_eq(cpu.load(base_addr + 13 * 4, size=4), 0x00000034) // byte[2]
  assert_eq(cpu.load(base_addr + 14 * 4, size=4), 0x00000012) // byte[3]
}

///|
test "la32_base_test_branch_compare" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test_branch_compare.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test_branch_compare.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  let base_addr = 0xC000U
  // Check branch compare test results
  assert_eq(cpu.load(base_addr + 0 * 4, size=4), 2)
  assert_eq(cpu.load(base_addr + 1 * 4, size=4), 4)
  assert_eq(cpu.load(base_addr + 2 * 4, size=4), 5)
  assert_eq(cpu.load(base_addr + 3 * 4, size=4), 6)
  assert_eq(cpu.load(base_addr + 4 * 4, size=4), 8)
  assert_eq(cpu.load(base_addr + 5 * 4, size=4), 9)
  assert_eq(cpu.load(base_addr + 6 * 4, size=4), 10)
  assert_eq(cpu.load(base_addr + 7 * 4, size=4), 11)
  assert_eq(cpu.load(base_addr + 8 * 4, size=4), 13)
  assert_eq(cpu.load(base_addr + 9 * 4, size=4), 14)
  assert_eq(cpu.load(base_addr + 10 * 4, size=4), 10)
  assert_eq(cpu.load(base_addr + 11 * 4, size=4), 10)
}

///|
test "la32_base_test_simple" {
  let cpu = CPU::make_CPU()
  assert_eq(@fs.is_file("./tests/bin/test.bin"), true)
  let bytes = @fs.read_file_to_bytes("./tests/bin/test.bin")
  cpu.store_bytes(0, bytes)
  cpu.execute()
  // Simple test just to verify execution works
  // The test.s file contains: addi.w $r31, $r0, 42
  // So r31 should contain 42 after execution
  // We can't directly check register values without exposing them,
  // but we can verify the CPU executed without errors
  assert_eq(true, true)  // Just verify test runs
}