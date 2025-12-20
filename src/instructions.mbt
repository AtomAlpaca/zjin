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
/// Actually there are 39 types in total:
/// ------------------------------------------------------------------------------------------------------------
/// |          |31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00|
/// |----------------------------------------------------------------------------------------------------------|
/// | CdFj     |31                                                             10|09    Fj    05|     |02 Cd 00|
/// | CdFjFk   |31                                              15|14    Fk    10|09    Fj    05|     |02 Cd 00|
/// | CdJ      |31                                                             10|09     J    05|     |02 Cd 00|
/// | CjSd5k16 |31               |25                    Sd5k16 L                 |09 08|07 Cj 05|04 Sd5k16 H 00|
/// | DCj      |31                                                                     |07 Cj 05|04     D    00|
/// | DFj      |31                                                               |09    Fj    05|04     D    00|
/// | DJ       |31                                                               |09     J    05|04     D    00|
/// | DJK      |31                                               15|14    K    10|09     J    05|04     D    00|
/// | DJKUa2   |31                                          |  Ua2 |14    K    10|09     J    05|04     D    00|
/// | DJKUa3   |31                                       |17 Ua3 15|14    K    10|09     J    05|04     D    00|
/// | DJSk12   |31                           |21           Sk12           K    10|09     J    05|04     D    00|
/// | DJSk14   |31                     |23              Sk14              K    10|09     J    05|04     D    00|
/// | DJSk16   |31               |25                 Sk16                 K    10|09     J    05|04     D    00|
/// | DJUk12   |31                           |21       Uk12      15|14    K    10|09     J    05|04     D    00|
/// | DJUk14   |31                     |23          Uk14         15|14    K    10|09     J    05|04     D    00|
/// | DJUk5    |31                                               15|14   Uk5   10|09     J    05|04     D    00|
/// | DJUk5Um5 |31                            21|20    Um5    16|15|14   Uk5   10|09     J    05|04     D    00|
/// | DJUk6    |31                                            16|15     Uk6    10|09     J    05|04     D    00|
/// | DJUk6Um6 |31                         22|21     Um6      16|15     Uk6    10|09     J    05|04     D    00|
/// | DJUk8    |31                                     18|17        Uk8        10|09     J    05|04     D    00|
/// | DSj20    |31                  |24                             Sj20                      05|04     D    00|
/// | DUj5     |31                                                               |09    UJ5   05|04     D    00|
/// | Empty    |31                                                                                           00|
/// | FdCj     |31                                                                     |07 Cj 05|04    Fd    00|
/// | FdFj     |31                                                             10|09    Fj    05|04    Fd    00|
/// | FdFjFk   |31                                               15|14    Fk   10|09    Fj    05|04    Fd    00|
/// | FdFjFkCa |31                                          |  Ca  |14    Fk   10|09    Fj    05|04    Fd    00|
/// | FdFjFkFa |31                              |20      Ca      15|14    Fk   10|09    Fj    05|04    Fd    00|
/// | FdJ      |31                                                             10|09     J    05|04    Fd    00|
/// | FdJK     |31                                               15|14     K   10|09     J    05|04    Fd    00|
/// | FdJSk12  |31                           |21              Sk12             10|09     J    05|04    Fd    00|
/// | JK       |31                                               15|14     K   10|09     J    05|04          00|
/// | JKUd     |31                                               15|14     K   10|09     J    05|04    Ud5   00|
/// | JSd5k16  |31               |25                    Sd5k16 L                 |09     J    05|04 Sd5k16 H 00|
/// | JUd5     |31                                                             10|09     J    05|04    Ud5   00|
/// | JUd5Sk12 |31                           |21              Sk12             10|09     J    05|04    Ud5   00|
/// | JUk8     |31                                     18|17        Uk8        10|09     J    05|04          00|
/// | Sd10k16  |31               |25                 Sd10k16 L                 10|09         Sd10k26 H       00|
/// | Ud15     |31                                               15|14                 Ud15                  00|
/// |-----------------------------------------------------------------------------------------------------------|

///|
const UInt_Max : UInt = 0xffffffffU

///|
enum InstructionType {
  CdFj(Inst_CdFj)
  CdFjFk(Inst_CdFjFk)
  CdJ(Inst_CdJ)
  CjSd5k16(Inst_CjSd5k16)
  DCj(Inst_DCj)
  DFj(Inst_DFj)
  DJ(Inst_DJ)
  DJK(Inst_DJK)
  DJKUa2(Inst_DJKUa2)
  DJKUa3(Inst_DJKUa3)
  DJSk12(Inst_DJSk12)
  DJSk14(Inst_DJSk14)
  DJSk16(Inst_DJSk16)
  DJUk12(Inst_DJUk12)
  DJUk14(Inst_DJUk14)
  DJUk5(Inst_DJUk5)
  DJUk5Um5(Inst_DJUk5Um5)
  DJUk6(Inst_DJUk6)
  DJUk6Um6(Inst_DJUk6Um6)
  DJUk8(Inst_DJUk8)
  DSj20(Inst_DSj20)
  DUj5(Inst_DUj5)
  EMPTY(Inst_empty)
  FdCj(Inst_FdCj)
  FdFj(Inst_FdFj)
  FdFjFk(Inst_FdFjFk)
  FdFjFkCa(Inst_FdFjFkCa)
  FdFjFkFa(Inst_FdFjFkFa)
  FdJ(Inst_FdJ)
  FdJK(Inst_FdJK)
  FdJSk12(Inst_FdJSk12)
  JK(Inst_JK)
  JKUd5(Inst_JKUd5)
  JSd5k16(Inst_JSd5k16)
  JUd5(Inst_JUd5)
  JUd5Sk12(Inst_JUd5Sk12)
  JUk8(Inst_JUk8)
  Sd10k16(Inst_Sd10k16)
  Ud15(Inst_Ud15)
} derive(Show)

///|
pub enum Instruction {
  La32Base(La32BaseInstruction)
} derive (Show)

///|
struct Inst_CdFj {
  opcode : UInt
  fj : UInt
  cd : UInt
} derive(Show)

///|
struct Inst_CdFjFk {
  opcode : UInt
  fk : UInt
  fj : UInt
  cd : UInt
} derive(Show)

///|
struct Inst_CdJ {
  opcode : UInt
  j : UInt
  cd : UInt
} derive(Show)

///|
struct Inst_CjSd5k16 {
  opcode : UInt
  sd5k16 : Int
  cj : UInt
} derive(Show)

///|
struct Inst_DCj {
  opcode : UInt
  cj : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DFj {
  opcode : UInt
  fj : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJ {
  opcode : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJK {
  opcode : UInt
  k : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJKUa2 {
  opcode : UInt
  ua2 : UInt
  k : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJKUa3 {
  opcode : UInt
  ua3 : UInt
  k : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJSk12 {
  opcode : UInt
  sk12 : Int
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJSk14 {
  opcode : UInt
  sk14 : Int
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJSk16 {
  opcode : UInt
  sk16 : Int
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJUk12 {
  opcode : UInt
  uk12 : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJUk14 {
  opcode : UInt
  uk14 : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJUk5 {
  opcode : UInt
  uk5 : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJUk5Um5 {
  opcode : UInt
  um5 : UInt
  uk5 : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJUk6 {
  opcode : UInt
  uk6 : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJUk6Um6 {
  opcode : UInt
  um6 : UInt
  uk6 : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DJUk8 {
  opcode : UInt
  uk8 : UInt
  j : UInt
  d : UInt
} derive(Show)

///|
struct Inst_DSj20 {
  opcode : UInt
  sj20 : Int
  d : UInt
} derive(Show)

///|
struct Inst_DUj5 {
  opcode : UInt
  uj5 : UInt
  d : UInt
} derive(Show)

///|
struct Inst_empty {} derive(Show)

///|
struct Inst_FdCj {
  opcode : UInt
  cj : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_FdFj {
  opcode : UInt
  fj : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_FdFjFk {
  opcode : UInt
  fk : UInt
  fj : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_FdFjFkCa {
  opcode : UInt
  ca : UInt
  fk : UInt
  fj : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_FdFjFkFa {
  opcode : UInt
  fa : UInt
  fk : UInt
  fj : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_FdJ {
  opcode : UInt
  j : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_FdJK {
  opcode : UInt
  k : UInt
  j : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_FdJSk12 {
  opcode : UInt
  sk12 : Int
  j : UInt
  fd : UInt
} derive(Show)

///|
struct Inst_JK {
  opcode : UInt
  k : UInt
  j : UInt
} derive(Show)

///|
struct Inst_JKUd5 {
  opcode : UInt
  k : UInt
  j : UInt
  ud5 : UInt
} derive(Show)

///|
struct Inst_JSd5k16 {
  opcode : UInt
  sd5k16 : Int
  j : UInt
} derive(Show)

///|
struct Inst_JUd5 {
  opcode : UInt
  j : UInt
  ud5 : UInt
} derive(Show)

///|
struct Inst_JUd5Sk12 {
  opcode : UInt
  sk12 : Int
  j : UInt
  ud5 : UInt
} derive(Show)

///|
struct Inst_JUk8 {
  opcode : UInt
  uk8 : UInt
  j : UInt
} derive(Show)

///|
struct Inst_Sd10k16 {
  opcode : UInt
  sd10k16 : Int
} derive(Show)

///|
struct Inst_Ud15 {
  opcode : UInt
  ud15 : UInt
} derive(Show)

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
/// let result = get_bit_seg(0x12345678, 4, 7)
/// // Binary: 0x12345678 = ...0111 1000
/// // Bits 4-7: 0111 (binary) = 7 (decimal)
/// inspect(result, content="7")
/// ```
///
pub fn get_bit_seg(num : UInt64, begin : Int, end : Int) -> UInt64 {
  if end == 63 {
    return num >> begin
  }
  let mask1 : UInt64 = (1 << (end + 1)) - 1
  let mask2 : UInt64 = (1 << begin) - 1
  let mask : UInt64 = mask1 - mask2
  return (num & mask) >> begin
}

///|
pub fn decode_CdFj(inst : UInt) -> Inst_CdFj {
  let op_low = get_bit_seg(inst.to_uint64(), 3, 4)
  let op_high = get_bit_seg(inst.to_uint64(), 10, 31)
  {
    opcode: ((op_high << 2) | op_low).to_uint(),
    fj: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    cd: get_bit_seg(inst.to_uint64(), 0, 2).to_uint(),
  }
}

///|
pub fn decode_CdFjFk(inst : UInt) -> Inst_CdFjFk {
  let op_low = get_bit_seg(inst.to_uint64(), 3, 4)
  let op_high = get_bit_seg(inst.to_uint64(), 15, 31)
  {
    opcode: ((op_high << 2) | op_low).to_uint(),
    fk: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    fj: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    cd: get_bit_seg(inst.to_uint64(), 0, 2).to_uint(),
  }
}

///|
pub fn decode_CdJ(inst : UInt) -> Inst_CdJ {
  let op_low = get_bit_seg(inst.to_uint64(), 3, 4)
  let op_high = get_bit_seg(inst.to_uint64(), 10, 31)
  {
    opcode: ((op_high << 2) | op_low).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    cd: get_bit_seg(inst.to_uint64(), 0, 2).to_uint(),
  }
}

///|
pub fn decode_CjSd5k16(inst : UInt) -> Inst_CjSd5k16 {
  let imm_low = get_bit_seg(inst.to_uint64(), 10, 25)
  let imm_high = get_bit_seg(inst.to_uint64(), 0, 4)
  let op_low = get_bit_seg(inst.to_uint64(), 8, 9)
  let op_high = get_bit_seg(inst.to_uint64(), 26, 31)
  {
    opcode: (op_low | (op_high << 2)).to_uint(),
    sd5k16: (imm_low | (imm_high << 16)).to_int(),
    cj: get_bit_seg(inst.to_uint64(), 5, 7).to_uint(),
  }
}

///|
pub fn decode_DCj(inst : UInt) -> Inst_DCj {
  {
    opcode: get_bit_seg(inst.to_uint64(), 8, 31).to_uint(),
    cj: get_bit_seg(inst.to_uint64(), 5, 7).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DFj(inst : UInt) -> Inst_DFj {
  {
    opcode: get_bit_seg(inst.to_uint64(), 10, 31).to_uint(),
    fj: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJ(inst : UInt) -> Inst_DJ {
  {
    opcode: get_bit_seg(inst.to_uint64(), 10, 31).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJK(inst : UInt) -> Inst_DJK {
  {
    opcode: get_bit_seg(inst.to_uint64(), 15, 31).to_uint(),
    k: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJKUa2(inst : UInt) -> Inst_DJKUa2 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 17, 31).to_uint(),
    ua2: get_bit_seg(inst.to_uint64(), 15, 16).to_uint(),
    k: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJKUa3(inst : UInt) -> Inst_DJKUa3 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 18, 31).to_uint(),
    ua3: get_bit_seg(inst.to_uint64(), 15, 17).to_uint(),
    k: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJSk12(inst : UInt) -> Inst_DJSk12 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 22, 31).to_uint(),
    sk12: get_bit_seg(inst.to_uint64(), 10, 21).to_int(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJSk14(inst : UInt) -> Inst_DJSk14 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 24, 31).to_uint(),
    sk14: get_bit_seg(inst.to_uint64(), 10, 23).to_int(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJSk16(inst : UInt) -> Inst_DJSk16 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 26, 31).to_uint(),
    sk16: get_bit_seg(inst.to_uint64(), 10, 25).to_int(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJUk12(inst : UInt) -> Inst_DJUk12 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 22, 31).to_uint(),
    uk12: get_bit_seg(inst.to_uint64(), 10, 21).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJUk14(inst : UInt) -> Inst_DJUk14 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 24, 31).to_uint(),
    uk14: get_bit_seg(inst.to_uint64(), 10, 23).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJUk5(inst : UInt) -> Inst_DJUk5 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 15, 31).to_uint(),
    uk5: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJUk5Um5(inst : UInt) -> Inst_DJUk5Um5 {
  let op_low = get_bit_seg(inst.to_uint64(), 15, 15)
  let op_high = get_bit_seg(inst.to_uint64(), 21, 31)
  {
    opcode: (op_low | (op_high << 1)).to_uint(),
    um5: get_bit_seg(inst.to_uint64(), 16, 20).to_uint(),
    uk5: get_bit_seg(inst.to_uint64(), 14, 10).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJUk6(inst : UInt) -> Inst_DJUk6 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 16, 31).to_uint(),
    uk6: get_bit_seg(inst.to_uint64(), 10, 15).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJUk6Um6(inst : UInt) -> Inst_DJUk6Um6 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 22, 31).to_uint(),
    um6: get_bit_seg(inst.to_uint64(), 16, 21).to_uint(),
    uk6: get_bit_seg(inst.to_uint64(), 10, 15).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DJUk8(inst : UInt) -> Inst_DJUk8 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 18, 31).to_uint(),
    uk8: get_bit_seg(inst.to_uint64(), 10, 17).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DSj20(inst : UInt) -> Inst_DSj20 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 25, 31).to_uint(),
    sj20: get_bit_seg(inst.to_uint64(), 5, 24).to_int(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_DUj5(inst : UInt) -> Inst_DUj5 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 10, 31).to_uint(),
    uj5: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    d: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_Empty(_ : UInt) -> Inst_empty {
  Inst_empty::{  }
}

///|
pub fn decode_FdCj(inst : UInt) -> Inst_FdCj {
  {
    opcode: get_bit_seg(inst.to_uint64(), 8, 31).to_uint(),
    cj: get_bit_seg(inst.to_uint64(), 5, 7).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_FdFj(inst : UInt) -> Inst_FdFj {
  {
    opcode: get_bit_seg(inst.to_uint64(), 10, 31).to_uint(),
    fj: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_FdFjFk(inst : UInt) -> Inst_FdFjFk {
  {
    opcode: get_bit_seg(inst.to_uint64(), 15, 31).to_uint(),
    fk: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    fj: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_FdFjFkCa(inst : UInt) -> Inst_FdFjFkCa {
  {
    opcode: get_bit_seg(inst.to_uint64(), 18, 31).to_uint(),
    ca: get_bit_seg(inst.to_uint64(), 15, 17).to_uint(),
    fk: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    fj: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_FdFjFkFa(inst : UInt) -> Inst_FdFjFkFa {
  {
    opcode: get_bit_seg(inst.to_uint64(), 20, 31).to_uint(),
    fa: get_bit_seg(inst.to_uint64(), 15, 19).to_uint(),
    fk: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    fj: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_FdJ(inst : UInt) -> Inst_FdJ {
  {
    opcode: get_bit_seg(inst.to_uint64(), 20, 31).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_FdJK(inst : UInt) -> Inst_FdJK {
  {
    opcode: get_bit_seg(inst.to_uint64(), 15, 31).to_uint(),
    k: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_FdJSk12(inst : UInt) -> Inst_FdJSk12 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 22, 31).to_uint(),
    sk12: get_bit_seg(inst.to_uint64(), 10, 21).to_int(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    fd: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_JK(inst : UInt) -> Inst_JK {
  let op_low = get_bit_seg(inst.to_uint64(), 0, 4)
  let op_high = get_bit_seg(inst.to_uint64(), 10, 31)
  {
    opcode: (op_low | (op_high << 5)).to_uint(),
    k: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
  }
}

///|
pub fn decode_JKUd5(inst : UInt) -> Inst_JKUd5 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 15, 31).to_uint(),
    k: get_bit_seg(inst.to_uint64(), 10, 14).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    ud5: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_JSd5k16(inst : UInt) -> Inst_JSd5k16 {
  let imm_low = get_bit_seg(inst.to_uint64(), 10, 25)
  let imm_high = get_bit_seg(inst.to_uint64(), 0, 4)
  {
    opcode: get_bit_seg(inst.to_uint64(), 26, 31).to_uint(),
    sd5k16: (imm_low | (imm_high << 16)).to_int(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
  }
}

///|
pub fn decode_JUd5(inst : UInt) -> Inst_JUd5 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 15, 31).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    ud5: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_JUd5Sk12(inst : UInt) -> Inst_JUd5Sk12 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 22, 31).to_uint(),
    sk12: get_bit_seg(inst.to_uint64(), 10, 21).to_int(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
    ud5: get_bit_seg(inst.to_uint64(), 0, 4).to_uint(),
  }
}

///|
pub fn decode_JUk8(inst : UInt) -> Inst_JUk8 {
  let op_low = get_bit_seg(inst.to_uint64(), 0, 4)
  let op_high = get_bit_seg(inst.to_uint64(), 17, 31)
  {
    opcode: (op_low | (op_high << 5)).to_uint(),
    uk8: get_bit_seg(inst.to_uint64(), 10, 17).to_uint(),
    j: get_bit_seg(inst.to_uint64(), 5, 9).to_uint(),
  }
}

///|
pub fn decode_Sd10k16(inst : UInt) -> Inst_Sd10k16 {
  let imm_low = get_bit_seg(inst.to_uint64(), 10, 25)
  let imm_high = get_bit_seg(inst.to_uint64(), 0, 9)
  {
    opcode: get_bit_seg(inst.to_uint64(), 26, 31).to_uint(),
    sd10k16: (imm_low | (imm_high << 16)).to_int(),
  }
}

///|
pub fn decode_Ud15(inst : UInt) -> Inst_Ud15 {
  {
    opcode: get_bit_seg(inst.to_uint64(), 15, 31).to_uint(),
    ud15: get_bit_seg(inst.to_uint64(), 0, 14).to_uint(),
  }
}
