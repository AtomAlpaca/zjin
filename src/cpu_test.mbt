///|
test "test cpu load and store" {
  let cpu = CPU::make_CPU()
  cpu.store(0x1000U, 0x1234567890abcdef, size=8)
  assert_eq(cpu.load(0x1000U, size=8), 0x1234567890abcdef)
  cpu.store(0x2000U, 0xdeadbeef, size=4)
  assert_eq(cpu.load(0x2000U, size=4), 0xdeadbeef)
  cpu.store(0x3000U, 0xface, size=2)
  assert_eq(cpu.load(0x3000U, size=2), 0xface)
  cpu.store(0x4000U, 0x7f, size=1)
  assert_eq(cpu.load(0x4000U, size=1), 0x7f)
}

///|
test "test cpu fetch" {
  let cpu = CPU::make_CPU()
  cpu.store(0x00, 0x1234567890abcdef, size=8)
  assert_eq(cpu.fetch(), 0x90abcdef)
  assert_eq(cpu.get_pc(), 4)
  assert_eq(cpu.fetch(), 0x12345678)
  assert_eq(cpu.get_pc(), 8)
}
