///|
/// Test the instruction parsing functions
test "test get_bit_seg function" {
  let num0 : UInt64 = 0x12345678
  inspect(get_bit_seg(num0, 4, 7), content="7")
  let num1 : UInt64 = 0xFFFFFFFF
  inspect(get_bit_seg(num1, 0, 19), content="1048575")
  inspect(get_bit_seg(num1, 30, 30), content="1")
  inspect(get_bit_seg(num1, 31, 31), content="1")
  let num2 : UInt64 = 1252699120
  inspect(get_bit_seg(num2, 10, 22), content="2730")
}

///|
test "test DJ decode" {
  let inst = 0xca4728f8U
  // inst    = 0b1100101001000111001010_00111_11000
  // 3314122 = 0b1100101001000111001010
  // 7       =                        0b00111
  // 24      =                             0b11000
  inspect(decode_DJ(inst), content="{opcode: 3314122, j: 7, d: 24}")
}

///|
test "test DJK decode" {
  // Create a test instruction for 3R format
  let inst = 0x1a2b3c4dU
  // inst  = 0b11010001010110011110001001101
  // 13398 = 0b11010001010110
  // 15    =               0b01111
  // 2     =                    0b00010
  // 13    =                         0b01101
  inspect(decode_DJK(inst), content="{opcode: 13398, k: 15, j: 2, d: 13}")
}

///|
test "test FdFjFkFa decode" {
  let inst = 0x38324aaaU
  // inst = 0b111000001100100100101010101010
  // 899  = 0b1110000011
  // 4    =           0b00100
  // 18   =                0b10010
  // 21   =                     0b10101
  // 10   =                          0b01010
  inspect(
    decode_FdFjFkFa(inst),
    content="{opcode: 899, fa: 4, fk: 18, fj: 21, fd: 10}",
  )
}

///|
test "test DJUk8" {
  let inst = 0x12345678U
  // inst = 0b10010001101000101011001111000
  // 1165 = 0b10010001101
  // 21   =            0b00010101
  // 19   =                    0b10011
  // 24   =                         0b11000
  inspect(decode_DJUk8(inst), content="{opcode: 1165, uk8: 21, j: 19, d: 24}")
}

///|
test "test DJSk12 decode" {
  let inst = 0xabcdef12U
  // inst = 0b10101011110011011110111100010010
  // 687  = 0b1010101111
  // 891  =           0b001101111011
  // 24   =                       0b11000
  // 18   =                            0b10010
  inspect(decode_DJSk12(inst), content="{opcode: 687, sk12: 891, j: 24, d: 18}")
}

test "test p DJSk14 decode" {
  let inst = 0xdeadbeefU
  // inst   = 0b11011110101011011011111011101111
  // 222    = 0b11011110
  // 11119  =         0b10101101101111
  // 23     =                       0b10111
  // 15     =                            0b01111
  inspect(decode_DJSk14(inst), content="{opcode: 222, sk14: 11119, j: 23, d: 15}")
}

test "test DJSk16 decode" {
  let inst = 0xfeebdaedU
  // inst  = 0b11111110111010111101101011101101
  // 63    = 0b111111
  // 47862 =       0b1011101011110110
  // 23                            0b10111
  // 13    =                            0b01101
  inspect(decode_DJSk16(inst), content="{opcode: 63, sk16: 47862, j: 23, d: 13}")
}

///|
test "test JSd5k16 decode" {
  let inst = 0xfedbca98U
  // inst           = 0b11111110110110111100101010011000
  // 63             = 0b111111
  // 1619698[0:15]  =       0b1011011011110010
  // 20             =                       0b10100
  // 1619698[16:20] =                            0b11000
  inspect(decode_JSd5k16(inst), content="{opcode: 63, sd5k16: 1619698, j: 20}")
}

///|
test "test Sd10k16 decode" {
  let inst = 0xf3112255U
  // inst            = 0b11110011000100010010001001010101
  // 60              = 0b111100
  // 39175240[0:15]  =         1100010001001000
  // 39175240[16:25] =                       0b1001010101
  inspect(decode_Sd10k16(inst), content="{opcode: 60, sd10k16: 39175240}")
}

