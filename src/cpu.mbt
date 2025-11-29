///|
struct CPU {
  mut regs : FixedArray[UInt64]
  mut pc : UInt64
  bus : Bus
}

///|
pub fn CPU::get_pc(self: CPU) -> UInt64 {
  self.pc
}

///|
pub fn CPU::make_CPU() -> CPU {
  { regs: FixedArray::make(32, 0), pc: 0, bus: Bus::make_bus() }
}

///|
pub fn CPU::load(
  self : CPU,
  address : UInt,
  size? : UInt = 1,
) -> UInt64 raise MemoryAccessError {
  self.bus.load(address, size~)
}

///|
pub fn CPU::store(
  self : CPU,
  address : UInt,
  value : UInt64,
  size? : UInt = 1,
) -> Unit raise MemoryAccessError {
  self.bus.store(address, value, size~)
}

///|
pub fn CPU::fetch(self : CPU) -> UInt raise MemoryAccessError {
  let inst = self.load(self.pc.to_uint(), size=4)
  self.pc = self.pc + 4
  inst.to_uint()
}
