///|
/// 00005800 sext.h                 DJ              @orig_name=ext.w.h @la32 @qemu
/// 00005800 sext.h                 DJ              @orig_name=ext.w.h @la32 @qemu
/// 00005c00 sext.b                 DJ              @orig_name=ext.w.b @la32 @qemu
/// 00006000 rdtimel.w              DJ              @la32 @primary
/// 00006400 rdtimeh.w              DJ              @la32 @primary
/// 00006c00 cpucfg                 DJ              @la32
/// 00100000 add.w                  DJK             @la32 @primary @qemu
/// 00110000 sub.w                  DJK             @la32 @primary @qemu
/// 00120000 slt                    DJK             @la32 @primary @qemu
/// 00128000 sltu                   DJK             @la32 @primary @qemu
/// 00130000 maskeqz                DJK             @la32 @qemu
/// 00138000 masknez                DJK             @la32 @qemu
/// 00140000 nor                    DJK             @la32 @primary @qemu
/// 00148000 and                    DJK             @la32 @primary @qemu
/// 00150000 or                     DJK             @la32 @primary @qemu
/// 00158000 xor                    DJK             @la32 @primary @qemu
/// 00160000 orn                    DJK             @la32 @primary @qemu
/// 00168000 andn                   DJK             @la32 @primary @qemu
/// 00170000 sll.w                  DJK             @la32 @primary @qemu
/// 00178000 srl.w                  DJK             @la32 @primary @qemu
/// 00180000 sra.w                  DJK             @la32 @primary @qemu
/// 001b0000 rotr.w                 DJK             @la32 @qemu
/// 002a0000 break                  Ud15            @la32 @primary
/// 002a8000 dbgcall                Ud15            @orig_name=dbcl
/// 002b0000 syscall                Ud15            @la32 @primary
/// 00408000 slli.w                 DJUk5           @la32 @primary @qemu
/// 00448000 srli.w                 DJUk5           @la32 @primary @qemu
/// 00488000 srai.w                 DJUk5           @la32 @primary @qemu
/// 004c8000 rotri.w                DJUk5           @la32 @qemu
/// 02000000 slti                   DJSk12          @la32 @primary @qemu
/// 02400000 sltui                  DJSk12          @la32 @primary @qemu
/// 02800000 addi.w                 DJSk12          @la32 @primary @qemu
/// 03400000 andi                   DJUk12          @la32 @primary @qemu
/// 03800000 ori                    DJUk12          @la32 @primary @qemu
/// 03c00000 xori                   DJUk12          @la32 @primary @qemu
/// 14000000 lu12i.w                DSj20           @la32 @primary @qemu
/// 18000000 pcaddu2i               DSj20           @orig_name=pcaddi @la32 @primary @qemu
/// 1a000000 pcalau12i              DSj20           @la32 @qemu
/// 1c000000 pcaddu12i              DSj20           @la32 @primary @qemu
/// 1e000000 pcaddu18i              DSj20           @qemu
/// 24000000 ldox4.w                DJSk14          @orig_name=ldptr.w @orig_fmt=DJSk14ps2
/// 25000000 stox4.w                DJSk14          @orig_name=stptr.w @orig_fmt=DJSk14ps2
/// 28000000 ld.b                   DJSk12          @la32 @primary @qemu
/// 28400000 ld.h                   DJSk12          @la32 @primary @qemu
/// 28800000 ld.w                   DJSk12          @la32 @primary @qemu
/// 29000000 st.b                   DJSk12          @la32 @primary @qemu
/// 29400000 st.h                   DJSk12          @la32 @primary @qemu
/// 29800000 st.w                   DJSk12          @la32 @primary @qemu
/// 2a000000 ld.bu                  DJSk12          @la32 @primary @qemu
/// 2a400000 ld.hu                  DJSk12          @la32 @primary @qemu
/// 2ac00000 preld                  JUd5Sk12        @orig_fmt=Ud5JSk12 @la32 @primary
/// 38000000 ldx.b                  DJK             @qemu
/// 38040000 ldx.h                  DJK             @qemu
/// 38080000 ldx.w                  DJK             @qemu
/// 38100000 stx.b                  DJK             @qemu
/// 38140000 stx.h                  DJK             @qemu
/// 38180000 stx.w                  DJK             @qemu
/// 38200000 ldx.bu                 DJK             @qemu
/// 38240000 ldx.hu                 DJK             @qemu
/// 382c0000 preldx                 JKUd5           @orig_fmt=Ud5JK
/// 38720000 dbar                   Ud15            @la32 @primary @qemu
/// 38728000 ibar                   Ud15            @la32 @primary
/// 40000000 beqz                   JSd5k16         @orig_fmt=JSd5k16ps2 @la32
/// 44000000 bnez                   JSd5k16         @orig_fmt=JSd5k16ps2 @la32
/// 4c000000 jirl                   DJSk16          @orig_fmt=DJSk16ps2 @la32 @primary @qemu
/// 50000000 b                      Sd10k16         @orig_fmt=Sd10k16ps2 @la32 @primary @qemu
/// 54000000 bl                     Sd10k16         @orig_fmt=Sd10k16ps2 @la32 @primary @qemu
/// 58000000 beq                    DJSk16          @orig_fmt=JDSk16ps2 @la32 @primary @qemu
/// 5c000000 bne                    DJSk16          @orig_fmt=JDSk16ps2 @la32 @primary @qemu
/// 60000000 bgt                    DJSk16          @orig_name=blt @orig_fmt=JDSk16ps2 @la32 @primary @qemu
/// 64000000 ble                    DJSk16          @orig_name=bge @orig_fmt=JDSk16ps2 @la32 @primary @qemu
/// 68000000 bgtu                   DJSk16          @orig_name=bltu @orig_fmt=JDSk16ps2 @la32 @primary @qemu
/// 6c000000 bleu                   DJSk16          @orig_name=bgeu @orig_fmt=JDSk16ps2 @la32 @primary @qemu00005c00 sext.b                 DJ              @orig_name=ext.w.b @la32 @qemu
const MASK_SEXT_H : UInt = 0x00005800

///|
const MASK_SEXT_B : UInt = 0x00005c00

///|
const MASK_RDTIMEL_W : UInt = 0x00006000

///|
const MASK_RDTIMEH_W : UInt = 0x00006400

///|
const MASK_CPUCFG : UInt = 0x00006c00

///|
const MASK_ADD_W : UInt = 0x00100000

///|
const MASK_SUB_W : UInt = 0x00110000

///|
const MASK_SLT : UInt = 0x00120000

///|
const MASK_SLTU : UInt = 0x00128000

///|
const MASK_MASKEQZ : UInt = 0x00130000

///|
const MASK_MASKNEZ : UInt = 0x00138000

///|
const MASK_NOR : UInt = 0x00140000

///|
const MASK_AND : UInt = 0x00148000

///|
const MASK_OR : UInt = 0x00150000

///|
const MASK_XOR : UInt = 0x00158000

///|
const MASK_ORN : UInt = 0x00160000

///|
const MASK_ANDN : UInt = 0x00168000

///|
const MASK_SLL_W : UInt = 0x00170000

///|
const MASK_SRL_W : UInt = 0x00178000

///|
const MASK_SRA_W : UInt = 0x00180000

///|
const MASK_ROTR_W : UInt = 0x001b0000

///|
const MASK_BREAK : UInt = 0x002a0000

///|
const MASK_DBGCALL : UInt = 0x002a8000

///|
const MASK_SYSCALL : UInt = 0x002b0000

///|
const MASK_SLLI_W : UInt = 0x00408000

///|
const MASK_SRLI_W : UInt = 0x00448000

///|
const MASK_SRAI_W : UInt = 0x00488000

///|
const MASK_ROTRI_W : UInt = 0x004c8000

///|
const MASK_SLTI : UInt = 0x02000000

///|
const MASK_SLTUI : UInt = 0x02400000

///|
const MASK_ADDI_W : UInt = 0x02800000

///|
const MASK_ANDI : UInt = 0x03400000

///|
const MASK_ORI : UInt = 0x03800000

///|
const MASK_XORI : UInt = 0x03c00000

///|
const MASK_LU12I_W : UInt = 0x14000000

///|
const MASK_PCADDU2I : UInt = 0x18000000

///|
const MASK_PCALAU12I : UInt = 0x1a000000

///|
const MASK_PCADDU12I : UInt = 0x1c000000

///|
const MASK_PCADDU18I : UInt = 0x1e000000

///|
const MASK_LDOX4_W : UInt = 0x24000000

///|
const MASK_STOX4_W : UInt = 0x25000000

///|
const MASK_LD_B : UInt = 0x28000000

///|
const MASK_LD_H : UInt = 0x28400000

///|
const MASK_LD_W : UInt = 0x28800000

///|
const MASK_ST_B : UInt = 0x29000000

///|
const MASK_ST_H : UInt = 0x29400000

///|
const MASK_ST_W : UInt = 0x29800000

///|
const MASK_LD_BU : UInt = 0x2a000000

///|
const MASK_LD_HU : UInt = 0x2a400000

///|
const MASK_PRELD : UInt = 0x2ac00000

///|
const MASK_LDX_B : UInt = 0x38000000

///|
const MASK_LDX_H : UInt = 0x38040000

///|
const MASK_LDX_W : UInt = 0x38080000

///|
const MASK_STX_B : UInt = 0x38100000

///|
const MASK_STX_H : UInt = 0x38140000

///|
const MASK_STX_W : UInt = 0x38180000

///|
const MASK_LDX_BU : UInt = 0x38200000

///|
const MASK_LDX_HU : UInt = 0x38240000

///|
const MASK_PRELDX : UInt = 0x382c0000

///|
const MASK_DBAR : UInt = 0x38720000

///|
const MASK_IBAR : UInt = 0x38728000

///|
const MASK_BEQZ : UInt = 0x40000000

///|
const MASK_BNEZ : UInt = 0x44000000

///|
const MASK_JIRL : UInt = 0x4c000000

///|
const MASK_B : UInt = 0x50000000

///|
const MASK_BL : UInt = 0x54000000

///|
const MASK_BEQ : UInt = 0x58000000

///|
const MASK_BNE : UInt = 0x5c000000

///|
const MASK_BGT : UInt = 0x60000000

///|
const MASK_BLE : UInt = 0x64000000

///|
const MASK_BGTU : UInt = 0x68000000

///|
const MASK_BLEU : UInt = 0x6c000000

///|
pub fn CPU::la32_base_exec(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  if self.la32_base_exec_DJ(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_DJK(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_Ud15(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_DJUk5(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_DJSk12(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_DJUk12(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_DSj20(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_JSd5k16(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_DJSk16(inst) is Some(x) {
    return Some(x)
  }
  if self.la32_base_exec_Sd10k16(inst) is Some(x) {
    return Some(x)
  }
  None
}

///|
pub fn CPU::la32_base_exec_DJ(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_DJ(inst)
  match inst & OPCODE_MASK_DJ {
    MASK_RDTIMEH_W => Some((La32Base(RdtimehW(x)), self.rdtimeh_w(x)))
    MASK_RDTIMEL_W => Some((La32Base(RdtimelW(x)), self.rdtimel_w(x)))
    MASK_CPUCFG => Some((La32Base(Cpucfg(x)), self.cpucfg(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_DJK(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_DJK(inst)
  match inst & OPCODE_MASK_DJK {
    MASK_ADD_W => Some((La32Base(AddW(x)), self.add_w(x)))
    MASK_SUB_W => Some((La32Base(SubW(x)), self.sub_w(x)))
    MASK_SLT => Some((La32Base(Slt(x)), self.slt(x)))
    MASK_SLTU => Some((La32Base(Sltu(x)), self.sltu(x)))
    MASK_MASKEQZ => Some((La32Base(Maskeqz(x)), self.maskeqz(x)))
    MASK_MASKNEZ => Some((La32Base(Masknez(x)), self.masknez(x)))
    MASK_NOR => Some((La32Base(Nor(x)), self.nor(x)))
    MASK_AND => Some((La32Base(And(x)), self.and_(x)))
    MASK_OR => Some((La32Base(Or(x)), self.or(x)))
    MASK_XOR => Some((La32Base(Xor(x)), self.xor(x)))
    MASK_ORN => Some((La32Base(Orn(x)), self.orn(x)))
    MASK_ANDN => Some((La32Base(Andn(x)), self.andn(x)))
    MASK_SLL_W => Some((La32Base(SllW(x)), self.sll_w(x)))
    MASK_SRL_W => Some((La32Base(SrlW(x)), self.srl_w(x)))
    MASK_SRA_W => Some((La32Base(SraW(x)), self.sra_w(x)))
    MASK_ROTR_W => Some((La32Base(RotrW(x)), self.rotr_w(x)))
    MASK_LDX_B => Some((La32Base(LdxB(x)), self.ldx_b(x)))
    MASK_LDX_H => Some((La32Base(LdxH(x)), self.ldx_h(x)))
    MASK_LDX_W => Some((La32Base(LdxW(x)), self.ldx_w(x)))
    MASK_STX_B => Some((La32Base(StxB(x)), self.stx_b(x)))
    MASK_STX_H => Some((La32Base(StxH(x)), self.stx_h(x)))
    MASK_STX_W => Some((La32Base(StxW(x)), self.stx_w(x)))
    MASK_LDX_BU => Some((La32Base(LdxBu(x)), self.ldx_bu(x)))
    MASK_LDX_HU => Some((La32Base(LdxHu(x)), self.ldx_hu(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_Ud15(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_Ud15(inst)
  match inst & OPCODE_MASK_Ud15 {
    MASK_BREAK => Some((La32Base(Break(x)), self.break_(x)))
    MASK_DBGCALL => Some((La32Base(Dbgcall(x)), self.dbgcall(x)))
    MASK_SYSCALL => Some((La32Base(Syscall(x)), self.syscall(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_DJUk5(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_DJUk5(inst)
  match inst & OPCODE_MASK_DJUk5 {
    MASK_SLLI_W => Some((La32Base(SlliW(x)), self.slli_w(x)))
    MASK_SRLI_W => Some((La32Base(SrliW(x)), self.srli_w(x)))
    MASK_SRAI_W => Some((La32Base(SraiW(x)), self.srai_w(x)))
    MASK_ROTRI_W => Some((La32Base(RotriW(x)), self.rotri_w(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_DJSk12(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_DJSk12(inst)
  match inst & OPCODE_MASK_DJSk12 {
    MASK_SLTI => Some((La32Base(Slti(x)), self.slti(x)))
    MASK_SLTUI => Some((La32Base(Sltui(x)), self.sltui(x)))
    MASK_ADDI_W => Some((La32Base(AddiW(x)), self.addi_w(x)))
    MASK_LD_B => Some((La32Base(LdB(x)), self.ld_b(x)))
    MASK_LD_H => Some((La32Base(LdH(x)), self.ld_h(x)))
    MASK_LD_W => Some((La32Base(LdW(x)), self.ld_w(x)))
    MASK_ST_B => Some((La32Base(StB(x)), self.st_b(x)))
    MASK_ST_H => Some((La32Base(StH(x)), self.st_h(x)))
    MASK_ST_W => Some((La32Base(StW(x)), self.st_w(x)))
    MASK_LD_BU => Some((La32Base(LdBu(x)), self.ld_bu(x)))
    MASK_LD_HU => Some((La32Base(LdHu(x)), self.ld_hu(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_DJUk12(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_DJUk12(inst)
  match inst & OPCODE_MASK_DJUk12 {
    MASK_ANDI => Some((La32Base(Andi(x)), self.andi(x)))
    MASK_ORI => Some((La32Base(Ori(x)), self.ori(x)))
    MASK_XORI => Some((La32Base(Xori(x)), self.xori(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_DSj20(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_DSj20(inst)
  match inst & OPCODE_MASK_DSj20 {
    MASK_LU12I_W => Some((La32Base(Lu12iW(x)), self.lu12i_w(x)))
    MASK_PCALAU12I => Some((La32Base(Pcalau12i(x)), self.pcalau12i(x)))
    MASK_PCADDU12I => Some((La32Base(Pcaddu12i(x)), self.pcaddu12i(x)))
    MASK_PCADDU18I => Some((La32Base(Pcaddu18i(x)), self.pcaddu18i(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_JSd5k16(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_JSd5k16(inst)
  match inst & OPCODE_MASK_JSd5k16 {
    MASK_BEQZ => Some((La32Base(Beqz(x)), self.beqz(x)))
    MASK_BNEZ => Some((La32Base(Bnez(x)), self.bnez(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_DJSk16(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_DJSk16(inst)
  match inst & OPCODE_MASK_DJSk16 {
    MASK_JIRL => Some((La32Base(Jirl(x)), self.jirl(x)))
    MASK_BEQ => Some((La32Base(Beq(x)), self.beq(x)))
    MASK_BNE => Some((La32Base(Bne(x)), self.bne(x)))
    MASK_BGT => Some((La32Base(Bgt(x)), self.bgt(x)))
    MASK_BLE => Some((La32Base(Ble(x)), self.ble(x)))
    MASK_BGTU => Some((La32Base(Bgtu(x)), self.bgtu(x)))
    MASK_BLEU => Some((La32Base(Bleu(x)), self.bleu(x)))
    _ => None
  }
}

///|
pub fn CPU::la32_base_exec_Sd10k16(
  self : CPU,
  inst : UInt,
) -> (Instruction, UInt64)? raise {
  let x = decode_Sd10k16(inst)
  match inst & OPCODE_MASK_Sd10k16 {
    MASK_B => Some((La32Base(B(x)), self.b(x)))
    MASK_BL => Some((La32Base(Bl(x)), self.bl(x)))
    _ => None
  }
}
