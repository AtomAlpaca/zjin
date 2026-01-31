///|
const ALL_ONE_MASK : UInt64 = 0xFFFFFFFFFFFFFFFFUL

///|
typealias UInt64 as BitContainer

///|
suberror ExtendError {
  BitsSizeTooLarge(String, UInt)
}

///|
/// Performs signed extension on a bit container from a given input bit width to
/// a specified output bit width.
///
/// Parameters:
///
/// * `value` (BitContainer/UInt64): The bit container value to be extended. The
///   bits beyond the specified `input_bits` should be zero.
/// * `input_bits` (UInt): The current bit width of the value. Must be between 0
///   and 64 inclusive.
/// * `output_bits` (UInt): The desired bit width after extension. Must be
///   between 0 and 64 inclusive, and typically greater than or equal to
///   `input_bits`.
///
/// Returns the signed-extended bit container value with the specified output
/// bit width.
///
/// Throws `ExtendError::BitsSizeTooLarge` if either `input_bits` or
/// `output_bits` exceeds 64.
///
/// Example:
///
/// ```moonbit
/// // Extend a 4-bit signed value to 8 bits
/// let value = 0b1110UL  // -2 in 4-bit signed representation
/// let result = signed_extend(value, 4, 8)
/// // Result is 0b11111110UL (-2 in 8-bit signed representation)
/// assert_eq(result, 0b11111110)
/// ```
///
pub fn signed_extend(
  value : BitContainer,
  input_bits : UInt,
  output_bits : UInt,
) -> BitContainer raise {
  if input_bits > 64 {
    raise BitsSizeTooLarge("Input bits size too large", input_bits)
  }
  if output_bits > 64 {
    raise BitsSizeTooLarge("Output bits size too large", output_bits)
  }
  let mask = ALL_ONE_MASK >> (64 - output_bits.reinterpret_as_int())
  let mut v = value & mask
  let sign = (v >> (input_bits.reinterpret_as_int() - 1)) & 1
  if sign == 1 {
    let high_mask = ALL_ONE_MASK << input_bits.reinterpret_as_int()
    v = v | high_mask
  }
  let out_mask = ALL_ONE_MASK >> (64 - output_bits.reinterpret_as_int())
  v & out_mask
}

///|
/// Unsigned extend 
pub fn zero_extend(
  value : BitContainer,
  input_bits : UInt,
  output_bits : UInt,
) -> BitContainer raise {
  if input_bits > 64 {
    raise BitsSizeTooLarge("Input bits size too large", input_bits)
  }
  if output_bits > 64 {
    raise BitsSizeTooLarge("Output bits size too large", output_bits)
  }
  let mask = ALL_ONE_MASK >> (64 - output_bits.reinterpret_as_int())
  value & mask
}

///|
const OPCODE_MASK_DJ : UInt = 0xfffffc00

///|
const OPCODE_MASK_DJK : UInt = 0xffff8000

///|
const OPCODE_MASK_Ud15 : UInt = 0xffff8000

///|
const OPCODE_MASK_DJUk5 : UInt = 0xffff8000

///|
const OPCODE_MASK_DJSk12 : UInt = 0xffc00000

///|
const OPCODE_MASK_DJUk12 : UInt = 0xffc00000

///|
const OPCODE_MASK_DSj20 : UInt = 0xfe000000

///|
const OPCODE_MASK_JSd5k16 : UInt = 0xfc000000

///|
const OPCODE_MASK_DJSk16 : UInt = 0xfc000000

///|
const OPCODE_MASK_Sd10k16 : UInt = 0xfc000000

///|
/// Sets a segment of bits in a bit container to a given value.
///
/// Parameters:
///
/// * `num` (BitContainer/UInt64): The bit container value to modify.
/// * `begin` (Int): The starting bit position (inclusive). Must be between 0 and 63.
/// * `end` (Int): The ending bit position (inclusive). Must be between 0 and 63.
/// * `value` (UInt64): The value to set in the specified bit range.
///
/// Returns a new bit container with the specified bits set to the given value.
///
/// The function handles various edge cases:
/// - If begin > end, returns the original number unchanged
/// - If begin or end are out of bounds (negative or > 63), clamps to valid range
/// - If begin == end, sets a single bit
/// - If end == 63, handles the special case of setting the uppermost bits
///
/// Example:
///
/// ```
/// // Set bits 4-7 of 0x00000000 to value 0xF (1111 in binary)
/// let result = set_bit_seg(0x00000000, 4, 7, 0xF)
/// // Result: 0x000000F0
///
/// // Set bits 0-3 of 0x12345678 to value 0x5
///
/// let result = set_bit_seg(0x12345678, 0, 3, 0x5)
/// // Original: ...78 (hex) = ...0111 1000 (binary)
/// // Setting bits 0-3 to 0101 (binary = 5 decimal)
/// // Result: ...0101 = 0x5 (for the lower 4 bits)
/// ```
///
pub fn set_bit_seg(
  num : BitContainer,
  begin : Int,
  end : Int,
  value : UInt64,
) -> BitContainer {
  let _begin = if begin < 0 { 0 } else if begin > 63 { 63 } else { begin }
  let _end = if end < 0 { 0 } else if end > 63 { 63 } else { end }
  if _begin > _end {
    return num
  }
  let w = _end - _begin + 1
  let mask : UInt64 = if w == 64 {
    ALL_ONE_MASK
  } else {
    ((1UL << w) - 1UL) << _begin
  }
  let x = num & mask.lnot()
  let v = (value << _begin) & mask
  x | v
}
