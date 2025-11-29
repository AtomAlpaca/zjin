test "test load and store function" {
  let ram = Ram::make_ram()
  ram.store(0x1000U, 0x1234567890abcdef, size = 8)
  assert_eq(ram.load(0x1000U, size = 8), 0x1234567890abcdef)

  ram.store(0x2000U, 0xdeadbeef, size = 4)
  assert_eq(ram.load(0x2000U, size = 4), 0xdeadbeef)

  ram.store(0x3000U, 0xface, size = 2)
  assert_eq(ram.load(0x3000U, size = 2), 0xface)

  ram.store(0x4000U, 0x7f, size = 1)
  assert_eq(ram.load(0x4000U, size = 1), 0x7f)
}

test "test load and store function illegal" {
  // Test illegal size
  let ram = Ram::make_ram()
  assert_true((try? ram.store(0x1000U, 0xff, size = 3)) is Err(_))
  assert_true((try? ram.load(0x1000U, size = 3)) is Err(_))
  
  // Test illegal address
  assert_true((try? ram.store(0x7fffffffU, 0xff)) is Err(_))
  assert_true((try? ram.load(0x7fffffffU)) is Err(_))
  assert_true((try? ram.store(0xffffffffU, 0xff)) is Err(_))
  assert_true((try? ram.load(0xffffffffU)) is Err(_))

}