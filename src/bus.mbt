/// Bus
/// Connect with some IO devices

struct Bus {
  ram : Ram
}

pub fn Bus::make_bus() -> Bus{
  { ram : Ram::make_ram() }
}

///|
/// Loads data from the specified memory address through the bus.
///
/// Parameters:
///
/// * `self` : The bus instance used for memory access.
/// * `address` : The memory address from which to load data.
/// * `size` : The number of bytes to load, defaults to 1 byte if not specified.
///
/// Returns the loaded data as a 64-bit unsigned integer.
///
/// Throws an error of type `MemoryAccessError` if the memory access fails.
///
/// Example:
///
/// ```moonbit
/// let bus = Bus::make_bus()
/// let _ = bus.load(0x1000, size=4)
/// ```
///
pub fn Bus::load(
  self : Bus,
  address : UInt,
  size? : UInt = 1,
) -> UInt64 raise MemoryAccessError {
  self.ram.load(address, size~)
}

///|
/// Stores data at the specified memory address through the bus.
///
/// Parameters:
///
/// * `bus` : The bus instance used for memory access.
/// * `address` : The memory address where data will be stored.
/// * `value` : The 64-bit unsigned integer value to store.
/// * `size` : The number of bytes to store, defaults to 1 byte if not
///   specified.
///
/// Throws an error of type `MemoryAccessError` if the memory access fails.
///
/// Example:
///
/// ```moonbit
/// let bus = Bus::make_bus()
/// bus.store(0x1000, 0x12345678, size=4)
/// ```
///
pub fn Bus::store(
  self : Bus,
  address : UInt,
  value : UInt64,
  size? : UInt = 1,
) -> Unit raise MemoryAccessError {
  self.ram.store(address, value, size~)
}