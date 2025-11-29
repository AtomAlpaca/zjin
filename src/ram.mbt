// 64 MB
const Default_Ram_Size : Int = 1024 * 1024 * 64


///| The errors that may occur during memory access operations.
/// LoadAddressTooLarge(Error message, Address)
/// StoreAddressTooLarge(Error message, Address)
/// LoadIllegalSize(Error message, Size)
/// StoreIllegalSize(Error message, Size)
pub suberror MemoryAccessError {
  LoadAddressIllegal(String, UInt)
  StoreAddressIllegal(String, UInt)
  LoadIllegalSize(String, UInt)
  StoreIllegalSize(String, UInt)
}

struct Ram {
  ram : FixedArray[Byte]
}

pub fn Ram::make_ram(ram_size? : Int = Default_Ram_Size) -> Ram {
  { ram : FixedArray::make(ram_size, 0) }
}

///|
/// Loads a value from the RAM at the specified address with the given size.
///
/// Parameters:
///
/// * `self` : The RAM instance to load from.
/// * `address` : The memory address to load from, must be within the RAM
///   bounds.
/// * `size` : The number of bytes to load (1, 2, 4, or 8), defaults to 1 byte.
///
/// Returns the loaded value as a 64-bit unsigned integer.
///
/// Throws an error of type `MemoryAccessError` under the following conditions:
///
/// * `LoadIllegalSize` if the provided size is not 1, 2, 4, or 8 bytes.
/// * `LoadAddressIllegal` if the address plus size exceeds the RAM bounds.
///
/// Example:
///
/// ```
/// let ram = Ram::make_ram()
/// // Load a single byte from address 0x1000
/// let _ = ram.load(0x1000, size = 1)
/// // Load a 4-byte word from address 0x2000  
/// let _ = ram.load(0x2000, size = 4)
/// ```
///
pub fn Ram::load(
  self : Ram,
  address : UInt,
  size? : UInt = 1,
) -> UInt64 raise MemoryAccessError {
  if size != 1 && size != 2 && size != 4 && size != 8 {
    raise LoadIllegalSize(
      "The provided size \{size} is illegal, size must be 1, 2, 4, or 8",
      size,
    )
  }
  // address + size may overflow when address is very large (0xffffffff for example)
  // And the index is less than signed int max value 0x7fffffff
  if address + size >= self.ram.length().reinterpret_as_uint() || 
  address >= 0x7fffffffU {
    raise LoadAddressIllegal(
      "The provided address \{address} is too large, the max address is \{self.ram.length() - 1}",
      address,
    )
  }
  let mut res : UInt64 = 0
  for i = 0; i < size.reinterpret_as_int(); i = i + 1 {
    res = res | (self.ram[address.reinterpret_as_int() + i].to_uint64() << (i * 8))
  }
  res
}

///|
/// Stores a value into the RAM at the specified address with the given size.
///
/// Parameters:
///
/// * `self` : The RAM instance to store into.
/// * `address` : The memory address where the value will be stored, must be
///   within the RAM bounds.
/// * `value` : The 64-bit unsigned integer value to store in memory.
/// * `size` : The number of bytes to store (1, 2, 4, or 8), defaults to 1 byte.
///
/// Throws an error of type `MemoryAccessError` under the following conditions:
///
/// * `StoreIllegalSize` if the provided size is not 1, 2, 4, or 8 bytes.
/// * `StoreAddressIllegal` if the address plus size exceeds the RAM bounds.
///
/// Example:
/// 
/// ```
/// let ram = Ram::make_ram()
/// ram.store(0x1000, 0xAB, size=1)
/// ram.store(0x2000, 0x12345678, size=4)
/// inspect(ram.load(0x1000, size=1), content="171")
/// inspect(ram.load(0x2000, size=4), content="305419896")
/// ```
///
pub fn Ram::store(
  self : Ram,
  address : UInt,
  value : UInt64,
  size? : UInt = 1,
) -> Unit raise MemoryAccessError {
  if size != 1 && size != 2 && size != 4 && size != 8 {
    raise StoreIllegalSize(
      "The provided size \{size} is illegal, size must be 1, 2, 4, or 8",
      size,
    )
  }
  // address + size may overflow when address is very large(0xffffffff for example)
  // And the index is less than signed int max value 0x7fffffff
  if address + size >= self.ram.length().reinterpret_as_uint() ||
    address >= 0x7fffffffU {
    raise StoreAddressIllegal(
      "The provided address \{address} is too large, the max address is \{self.ram.length() - 1}",
      address,
    )
  }
  for i = size.reinterpret_as_int() - 1; i >= 0; i = i - 1 {
    self.ram[address.reinterpret_as_int() + i] = ((value >> (8 * i)) & 0xff).to_byte()
  }
}