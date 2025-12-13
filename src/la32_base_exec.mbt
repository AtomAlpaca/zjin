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
const MASK_SEXT_B : UInt = 0x00005c00
const MASK_RDTIMEL_W : UInt = 0x00006000
const MASK_RDTIMEH_W : UInt = 0x00006400
const MASK_CPUCFG : UInt = 0x00006c00
const MASK_ADD_W : UInt = 0x00100000
const MASK_SUB_W : UInt = 0x00110000
const MASK_SLT : UInt = 0x00120000
const MASK_SLTU : UInt = 0x00128000
const MASK_MASKEQZ : UInt = 0x00130000
const MASK_MASKNEZ : UInt = 0x00138000
const MASK_NOR : UInt = 0x00140000
const MASK_AND : UInt = 0x00148000
const MASK_OR : UInt = 0x00150000
const MASK_XOR : UInt = 0x00158000
const MASK_ORN : UInt = 0x00160000
const MASK_ANDN : UInt = 0x00168000
const MASK_SLL_W : UInt = 0x00170000
const MASK_SRL_W : UInt = 0x00178000
const MASK_SRA_W : UInt = 0x00180000
const MASK_ROTR_W : UInt = 0x001b0000
const MASK_BREAK : UInt = 0x002a0000
const MASK_DBGCALL : UInt = 0x002a8000
const MASK_SYSCALL : UInt = 0x002b0000
const MASK_SLLI_W : UInt = 0x00408000
const MASK_SRLI_W : UInt = 0x00448000
const MASK_SRAI_W : UInt = 0x00488000
const MASK_ROTRI_W : UInt = 0x004c8000
const MASK_SLTI : UInt = 0x02000000
const MASK_SLTUI : UInt = 0x02400000
const MASK_ADDI_W : UInt = 0x02800000
const MASK_ANDI : UInt = 0x03400000
const MASK_ORI : UInt = 0x03800000
const MASK_XORI : UInt = 0x03c00000
const MASK_LU12I_W : UInt = 0x14000000
const MASK_PCADDU2I : UInt = 0x18000000
const MASK_PCALAU12I : UInt = 0x1a000000
const MASK_PCADDU12I : UInt = 0x1c000000
const MASK_PCADDU18I : UInt = 0x1e000000
const MASK_LDOX4_W : UInt = 0x24000000
const MASK_STOX4_W : UInt = 0x25000000
const MASK_LD_B : UInt = 0x28000000
const MASK_LD_H : UInt = 0x28400000
const MASK_LD_W : UInt = 0x28800000
const MASK_ST_B : UInt = 0x29000000
const MASK_ST_H : UInt = 0x29400000
const MASK_ST_W : UInt = 0x29800000
const MASK_LD_BU : UInt = 0x2a000000
const MASK_LD_HU : UInt = 0x2a400000
const MASK_PRELD : UInt = 0x2ac00000
const MASK_LDX_B : UInt = 0x38000000
const MASK_LDX_H : UInt = 0x38040000
const MASK_LDX_W : UInt = 0x38080000
const MASK_STX_B : UInt = 0x38100000
const MASK_STX_H : UInt = 0x38140000
const MASK_STX_W : UInt = 0x38180000
const MASK_LDX_BU : UInt = 0x38200000
const MASK_LDX_HU : UInt = 0x38240000
const MASK_PRELDX : UInt = 0x382c0000
const MASK_DBAR : UInt = 0x38720000
const MASK_IBAR : UInt = 0x38728000
const MASK_BEQZ : UInt = 0x40000000
const MASK_BNEZ : UInt = 0x44000000
const MASK_JIRL : UInt = 0x4c000000
const MASK_B : UInt = 0x50000000
const MASK_BL : UInt = 0x54000000
const MASK_BEQ : UInt = 0x58000000
const MASK_BNE : UInt = 0x5c000000
const MASK_BGT : UInt = 0x60000000
const MASK_BLE : UInt = 0x64000000
const MASK_BGTU : UInt = 0x68000000
const MASK_BLEU : UInt = 0x6c000000


pub fn la32_base_exec(self : CPU, inst : UInt) -> Bool raise {
  if self.la32_base_exec_DJ(inst) {
    return true
  }
  if self.la32_base_exec_DJK(inst) {
    return true
  }
  if self.la32_base_exec_Ud15(inst) {
    return true
  }
  if self.la32_base_exec_DJUk5(inst) {
    return true
  }
  if self.la32_base_exec_DJSk12(inst) {
    return true
  }
  if self.la32_base_exec_DJUk12(inst) {
    return true
  }
  if self.la32_base_exec_DSj20(inst) {
    return true
  }
  if self.la32_base_exec_JSd5k16(inst) {
    return true
  }
  if self.la32_base_exec_DJSk16(inst) {
    return true
  }
  if self.la32_base_exec_Sd10k16(inst) {
    return true
  }
  false
}

pub fn la32_base_exec_DJ(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_DJ(inst)
  match inst & OPCODE_MASK_DJ {
    MASK_RDTIMEH_W => { self.rdtimeh_w(x) }
    MASK_RDTIMEL_W => { self.rdtimel_w(x) }
    MASK_CPUCFG => { self.cpucfg(x) }
    _ => { return false }
  }
  true
}

pub fn la32_base_exec_DJK(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_DJK(inst)
  match inst & OPCODE_MASK_DJK {
    MASK_ADD_W => { self.add_w(x) }
    MASK_SUB_W => { self.sub_w(x) }
    MASK_SLT => { self.slt(x) }
    MASK_SLTU => { self.sltu(x) }
    MASK_MASKEQZ => { self.maskeqz(x) }
    MASK_MASKNEZ => { self.masknez(x) }
    MASK_NOR => { self.nor(x) }
    MASK_AND => { self.and_(x) }
    MASK_OR => { self.or(x) }
    MASK_XOR => { self.xor(x) }
    MASK_ORN => { self.orn(x) }
    MASK_ANDN => { self.andn(x) }
    MASK_SLL_W => { self.sll_w(x) }
    MASK_SRL_W => { self.srl_w(x) }
    MASK_SRA_W => { self.sra_w(x) }
    MASK_ROTR_W => { self.rotr_w(x) }
    MASK_LDX_B => { self.ldx_b(x) }
    MASK_LDX_H => { self.ldx_h(x) }
    MASK_LDX_W => { self.ldx_w(x) }
    MASK_STX_B => { self.stx_b(x) }
    MASK_STX_H => { self.stx_h(x) }
    MASK_STX_W => { self.stx_w(x) }
    MASK_LDX_BU => { self.ldx_bu(x) }
    MASK_LDX_HU => { self.ldx_hu(x) }
    _ => { return false }
  }
  true
}

pub fn la32_base_exec_Ud15(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_Ud15(inst)
  match inst & OPCODE_MASK_Ud15 {
    MASK_BREAK => { self.break_(x) }
    MASK_DBGCALL => { self.dbgcall(x) }
    MASK_SYSCALL => { self.syscall(x) }
    _ => { return false }
  }
  true
}
pub fn la32_base_exec_DJUk5(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_DJUk5(inst)
  match inst & OPCODE_MASK_DJUk5 {
    MASK_SLLI_W => { self.slli_w(x) }
    MASK_SRLI_W => { self.srli_w(x) }
    MASK_SRAI_W => { self.srai_w(x) }
    MASK_ROTRI_W => { self.rotri_w(x) }
    _ => { return false }
  }
  true
}

pub fn la32_base_exec_DJSk12(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_DJSk12(inst)
  match inst & OPCODE_MASK_DJSk12 {
    MASK_SLTI => { self.slti(x) }
    MASK_SLTUI => { self.sltui(x) }
    MASK_ADDI_W => { self.addi_w(x) }
    MASK_LD_B => { self.ld_b(x) }
    MASK_LD_H => { self.ld_h(x) }
    MASK_LD_W => { self.ld_w(x) }
    MASK_ST_B => { self.st_b(x) }
    MASK_ST_H => { self.st_h(x) }
    MASK_ST_W => { self.st_w(x) }
    MASK_LD_BU => { self.ld_bu(x) }
    MASK_LD_HU => { self.ld_hu(x) }
    _ => { return false }
  }
  true
}

pub fn la32_base_exec_DJUk12(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_DJUk12(inst)
  match inst & OPCODE_MASK_DJUk12 {
    MASK_ANDI => { self.andi(x) }
    MASK_ORI => { self.ori(x) }
    MASK_XORI => { self.xori(x) }
    _ => { return false }
  }
  true
}

pub fn la32_base_exec_DSj20(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_DSj20(inst)
  match inst & OPCODE_MASK_DSj20 {
    MASK_LU12I_W => { self.lu12i_w(x) }
    MASK_PCALAU12I => { self.pcalau12i(x) }
    MASK_PCADDU12I => { self.pcaddu12i(x) }
    MASK_PCADDU18I => { self.pcaddu18i(x) }
    _ => { return false }
  }
  true
}

pub fn la32_base_exec_JSd5k16(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_JSd5k16(inst)
  match inst & OPCODE_MASK_JSd5k16 {
    MASK_BEQZ => { self.beqz(x) }
    MASK_BNEZ => { self.bnez(x) }
    _ => { return false }
  }
  true
}

pub fn la32_base_exec_DJSk16(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_DJSk16(inst)
  match inst & OPCODE_MASK_DJSk16 {
    MASK_JIRL => { self.jirl(x) }
    MASK_BEQ => { self.beq(x) }
    MASK_BNE => { self.bne(x) }
    MASK_BGT => { self.bgt(x) }
    MASK_BLE => { self.ble(x) }
    MASK_BGTU => { self.bgtu(x) }
    MASK_BLEU => { self.bleu(x) }
    _ => { return false }
  }
  true
}
pub fn la32_base_exec_Sd10k16(self : CPU, inst : UInt) -> Bool raise {
  let x = decode_Sd10k16(inst)
  match inst & OPCODE_MASK_Sd10k16 {
    MASK_B => { self.b(x) }
    MASK_BL => { self.bl(x) }
    _ => { return false }
  }
  true
}