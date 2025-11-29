/// Process instructions.
/// In official documents loongarch has 9 instructions:
/// -----------------------------------------------------------------------------------------------------------
/// |       |31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01	 00|
/// | 2R    |31                           opcode                            10|09    rj    05|04     rd     00|
/// | 3R    |31                   opcode                       |14    rk    10|09    rj    05|04     rd     00|
/// | 4R    |31            opcode             20|19   ra     15|14    rk    10|09    rj    05|04     rd     00|
/// | 2RI8  |31            opcode                   18|17         I8        10|09    rj    05|04     rd     00|
/// | 2RI12 |31         opcode          22|21             I12               10|09    rj    05|04     rd     00|
/// | 2RI14 |31      opcode       24|23                I14                  10|09    rj    05|04     rd     00|
/// | 2RI16 |31   opcode    26|25                   I16                     10|09    rj    05|04     rd     00|
/// | 1RI21 |31   opcode    26|25                I21[15:0]                  10|09    rj    05|04 I21[20:16] 00|
/// | I26   |31   opcode    26|25                I26[15:0]                  10|09         I21[26:16]        00|
/// -----------------------------------------------------------------------------------------------------------
/// But some instructions are different from these types, the full list can be found in https://github.com/loongson-community/loongarch-opcodes
/// There are 39 types in total, we will implement these extra instructions in further.
/// TODO: Implement all 39 types.

///|
struct Inst_2R {
  opcode : Int
  rj : Int
  rd : Int
} derive(Show)

///|
struct Inst_3R {
  opcode : Int
  rk : Int
  rj : Int
  rd : Int
} derive(Show)

///|
struct Inst_4R {
  opcode : Int
  ra : Int
  rk : Int
  rj : Int
  rd : Int
} derive(Show)

///|
struct Inst_2RI8 {
  opcode : Int
  i8 : Int
  rj : Int
  rd : Int
} derive(Show)

///|
struct Inst_2RI12 {
  opcode : Int
  i12 : Int
  rj : Int
  rd : Int
} derive(Show)

///|
struct Inst_2RI14 {
  opcode : Int
  i14 : Int
  rj : Int
  rd : Int
} derive(Show)

///|
struct Inst_2RI16 {
  opcode : Int
  i16 : Int
  rj : Int
  rd : Int
} derive(Show)

///|
struct Inst_1RI21 {
  opcode : Int
  i21 : Int
  rj : Int
} derive(Show)

///|
struct Inst_I26 {
  opcode : Int
  i26 : Int
} derive(Show)

///|
const UInt_Max : UInt = 0xffffffffU

///|
/// Extracts a contiguous segment of bits from a 32-bit unsigned integer.
///
/// Parameters:
///
/// * `num` : The 32-bit unsigned integer from which to extract bits.
/// * `begin` : The starting bit position (inclusive) of the segment to extract,
///   must be between 0 and 31.
/// * `end` : The ending bit position (inclusive) of the segment to extract,
///   must be between 0 and 31 and greater than or equal to `begin`.
///
/// Returns the extracted bit segment as an unsigned integer, with the extracted
/// bits positioned in the least significant bits of the result.
///
/// Example:
///
/// ```moonbit
/// // Extract bits 4-7 from 0x12345678
/// let result = get_bit_seg(0x12345678U, 4, 7)
/// // Binary: 0x12345678 = ...0111 1000
/// // Bits 4-7: 0111 (binary) = 7 (decimal)
/// inspect(result, content="7")
/// ```
///
pub fn get_bit_seg(num : UInt, begin : Int, end : Int) -> UInt {
  if end == 31 {
    return num >> begin
  }
  let mask1 = (1U << (end + 1)) - 1
  let mask2 = (1U << begin) - 1
  let mask = mask1 - mask2
  return (num & mask) >> begin
}

///|
pub fn parse_2R(inst : UInt) -> Inst_2R {
  {
    opcode: get_bit_seg(inst, 10, 31).reinterpret_as_int(),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
    rd: get_bit_seg(inst, 0, 4).reinterpret_as_int(),
  }
}

///|
pub fn parse_3R(inst : UInt) -> Inst_3R {
  {
    opcode: get_bit_seg(inst, 15, 31).reinterpret_as_int(),
    rk: get_bit_seg(inst, 10, 14).reinterpret_as_int(),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
    rd: get_bit_seg(inst, 0, 4).reinterpret_as_int(),
  }
}

///|
pub fn parse_4R(inst : UInt) -> Inst_4R {
  {
    opcode: get_bit_seg(inst, 20, 31).reinterpret_as_int(),
    ra: get_bit_seg(inst, 15, 19).reinterpret_as_int(),
    rk: get_bit_seg(inst, 10, 14).reinterpret_as_int(),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
    rd: get_bit_seg(inst, 0, 4).reinterpret_as_int(),
  }
}

///|
pub fn parse_2RI8(inst : UInt) -> Inst_2RI8 {
  {
    opcode: get_bit_seg(inst, 18, 31).reinterpret_as_int(),
    i8: get_bit_seg(inst, 10, 17).reinterpret_as_int(),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
    rd: get_bit_seg(inst, 0, 4).reinterpret_as_int(),
  }
}

///|
pub fn parse_2RI12(inst : UInt) -> Inst_2RI12 {
  {
    opcode: get_bit_seg(inst, 22, 31).reinterpret_as_int(),
    i12: get_bit_seg(inst, 10, 21).reinterpret_as_int(),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
    rd: get_bit_seg(inst, 0, 4).reinterpret_as_int(),
  }
}

///|
pub fn parse_2RI14(inst : UInt) -> Inst_2RI14 {
  {
    opcode: get_bit_seg(inst, 24, 31).reinterpret_as_int(),
    i14: get_bit_seg(inst, 10, 23).reinterpret_as_int(),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
    rd: get_bit_seg(inst, 0, 4).reinterpret_as_int(),
  }
}

///|
pub fn parse_2RI16(inst : UInt) -> Inst_2RI16 {
  {
    opcode: get_bit_seg(inst, 26, 31).reinterpret_as_int(),
    i16: get_bit_seg(inst, 10, 25).reinterpret_as_int(),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
    rd: get_bit_seg(inst, 0, 4).reinterpret_as_int(),
  }
}

///|
pub fn parse_1RI21(inst : UInt) -> Inst_1RI21 {
  {
    opcode: get_bit_seg(inst, 26, 31).reinterpret_as_int(),
    i21: get_bit_seg(inst, 10, 25).reinterpret_as_int() |
    (get_bit_seg(inst, 0, 4).reinterpret_as_int() << 16),
    rj: get_bit_seg(inst, 5, 9).reinterpret_as_int(),
  }
}

///|
pub fn parse_I26(inst : UInt) -> Inst_I26 {
  {
    opcode: get_bit_seg(inst, 26, 31).reinterpret_as_int(),
    i26: get_bit_seg(inst, 10, 25).reinterpret_as_int() |
    (get_bit_seg(inst, 0, 9).reinterpret_as_int() << 16),
  }
}
