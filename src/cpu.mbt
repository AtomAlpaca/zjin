///|
struct CPU {
  r_regs : FixedArray[UInt64]
  mut pc : UInt64
  bus : Bus
  mut stable_counter : UInt64
  mut counter_id : UInt
  cpu_cfg : FixedArray[UInt]
}

///|
suberror RegAccessError {
  UnknownReg(String, Reg)
  UnmatchedType(String, Reg, Reg_Value)
}

///|
pub(all) enum Reg {
  R(UInt)
}

///|
pub(all) enum Reg_Value {
  R(UInt64)
}

///|
/// Retrieves the value of a specified general-purpose register from the CPU.
///
/// Parameters:
///
/// * `self`: The CPU instance from which to retrieve the register value
/// * `reg`: The register to read, which must be a general-purpose register
///   (variant `Reg::R`) with an index between 0 and 31
///
/// Returns the register value as a `Reg_Value::R` variant containing a 64-bit
/// unsigned integer.
///
/// Throws an error of type `RegAccessError` (specifically `UnknownReg`) if the
/// register index is greater than 31.
///
/// Note that register `r0` (index 0) always returns 0, regardless of any stored
/// value, as it is a read-only zero register.
///
/// Example:
///
/// ```moonbit
/// let cpu = CPU::make_CPU()
/// assert_true(cpu.get_reg(R(1)) is R(0))
/// ```
///
pub fn CPU::get_reg(self : CPU, reg : Reg) -> Reg_Value raise RegAccessError {
  match reg {
    R(x) => {
      if x > 31 {
        raise UnknownReg(
          "Unknown r register r\{x}, r register number is between 0 and 31",
          reg,
        )
      }
      if x == 0 {
        R(0)
      } else {
        R(self.r_regs[x.reinterpret_as_int()])
      }
    }
  }
}

///|
/// Sets the value of a specified register in the CPU.
///
/// Parameters:
///
/// * `reg` : The register to set, which must be of type `Reg::R` with an index
///   between 0 and 31.
/// * `val` : The value to set, which must be of type `Reg_Value::R` (a 64-bit
///   unsigned integer).
///
/// Throws an error of type `RegAccessError` in the following cases:
///
/// * If the register index is greater than 31, an `UnknownReg` error is thrown.
/// * If the register and value types do not match (i.e., if `reg` is not
///   `Reg::R` or `val` is not `Reg_Value::R`), an `UnmatchedType` error is
///   thrown.
///
/// Note that setting register `r0` (index 0) is ignored because it is a
/// read-only zero register.
/// 
/// Example:
/// 
/// ```
/// let cpu = CPU::make_CPU()
/// cpu.set_reg(R(1), R(0x12))
/// ```
pub fn CPU::set_reg(
  self : CPU,
  reg : Reg,
  val : Reg_Value,
) -> Unit raise RegAccessError {
  match (reg, val) {
    (R(x), R(v)) => {
      if x > 31 {
        raise UnknownReg(
          "Unknown r register r\{x}, r register number is between 0 and 31",
          reg,
        )
      }
      if x != 0 {
        self.r_regs[x.reinterpret_as_int()] = v
      }
    }
    _ =>
      raise UnmatchedType(
        "The register type and the value type are unmatched", reg, val,
      )
  }
}

///|
/// Creates a new CPU instance with default initial state.
///
/// Returns a CPU object with:
///
/// * 32 general-purpose registers (r0-r31) initialized to zero
/// * Program counter (pc) set to zero
/// * An empty bus instance for memory operations
///
/// Example:
///
/// ```moonbit
/// let cpu = CPU::make_CPU()
/// 
/// ```
///
pub fn CPU::make_CPU() -> CPU {
  {
    r_regs: FixedArray::make(32, 0),
    pc: 0,
    bus: Bus::make_bus(),
    stable_counter: 0,
    counter_id: 0,
    cpu_cfg: FixedArray::make(14, 0),
  }
}

///|
pub fn CPU::get_stable_counter(self : CPU) -> UInt64 {
  self.stable_counter
}

///|
pub fn CPU::stable_counter_increase(self : CPU) -> Unit {
  if self.stable_counter == 0xffffffff {
    self.stable_counter = 0
  } else {
    self.stable_counter = self.stable_counter + 1
  }
}

///|
pub fn CPU::get_counter_id(self : CPU) -> UInt {
  self.counter_id
}

///|
pub fn CPU::set_counter_id(self : CPU, val : UInt) -> Unit {
  self.counter_id = val
}

///|
pub fn CPU::get_pc(self : CPU) -> UInt64 {
  self.pc
}

///|
pub fn CPU::set_pc(self : CPU, val : UInt64) -> Unit {
  self.pc = val
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
pub fn CPU::store_bytes(
  self : CPU,
  address : UInt,
  bytes : Bytes,
) -> Unit raise MemoryAccessError {
  self.bus.store_bytes(address, bytes)
}

///|
pub fn CPU::fetch(self : CPU) -> UInt raise MemoryAccessError {
  let inst = self.load(self.pc.to_uint(), size=4)
  self.pc = self.pc + 4
  inst.to_uint()
}

///|
suberror ExecuteError {
  IllegalInstruction(String, UInt)
}

///|
pub fn CPU::execute(self : CPU) -> Unit raise {
  while true {
    let inst = self.load(self.pc.to_uint(), size=4).to_uint()
    if inst == 0 {
      break
    }
    if self.execute_inst(inst) is Some(pc) {
      self.set_pc(pc)
    } else {
      raise IllegalInstruction("Illegal Instruction \{inst}", inst)
    }
  }
}

///|
pub fn CPU::execute_inst(self : CPU, inst : UInt) -> UInt64? raise {
  if self.la32_base_exec(inst) is Some((_, pc)) {
    return Some(pc)
  } else {
    return None
  }
}
