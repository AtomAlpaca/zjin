///
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

///|
/// Enum representing LA32 base instructions
pub enum La32BaseInstruction {
  SextH(Inst_DJ)
  SextB(Inst_DJ)
  RdtimelW(Inst_DJ)
  RdtimehW(Inst_DJ)
  Cpucfg(Inst_DJ)
  AddW(Inst_DJK)
  SubW(Inst_DJK)
  Slt(Inst_DJK)
  Sltu(Inst_DJK)
  Maskeqz(Inst_DJK)
  Masknez(Inst_DJK)
  Nor(Inst_DJK)
  And(Inst_DJK)
  Or(Inst_DJK)
  Xor(Inst_DJK)
  Orn(Inst_DJK)
  Andn(Inst_DJK)
  SllW(Inst_DJK)
  SrlW(Inst_DJK)
  SraW(Inst_DJK)
  RotrW(Inst_DJK)
  Break(Inst_Ud15)
  Dbgcall(Inst_Ud15)
  Syscall(Inst_Ud15)
  SlliW(Inst_DJUk5)
  SrliW(Inst_DJUk5)
  SraiW(Inst_DJUk5)
  RotriW(Inst_DJUk5)
  Slti(Inst_DJSk12)
  Sltui(Inst_DJSk12)
  AddiW(Inst_DJSk12)
  Andi(Inst_DJUk12)
  Ori(Inst_DJUk12)
  Xori(Inst_DJUk12)
  Lu12iW(Inst_DSj20)
  Pcaddu2i(Inst_DSj20)
  Pcalau12i(Inst_DSj20)
  Pcaddu12i(Inst_DSj20)
  Pcaddu18i(Inst_DSj20)
  Ldox4W(Inst_DJSk14)
  Stox4W(Inst_DJSk14)
  LdB(Inst_DJSk12)
  LdH(Inst_DJSk12)
  LdW(Inst_DJSk12)
  StB(Inst_DJSk12)
  StH(Inst_DJSk12)
  StW(Inst_DJSk12)
  LdBu(Inst_DJSk12)
  LdHu(Inst_DJSk12)
  Preld(Inst_JUd5Sk12)
  LdxB(Inst_DJK)
  LdxH(Inst_DJK)
  LdxW(Inst_DJK)
  StxB(Inst_DJK)
  StxH(Inst_DJK)
  StxW(Inst_DJK)
  LdxBu(Inst_DJK)
  LdxHu(Inst_DJK)
  Preldx(Inst_JKUd5)
  Dbar(Inst_Ud15)
  Ibar(Inst_Ud15)
  Beqz(Inst_JSd5k16)
  Bnez(Inst_JSd5k16)
  Jirl(Inst_DJSk16)
  B(Inst_Sd10k16)
  Bl(Inst_Sd10k16)
  Beq(Inst_DJSk16)
  Bne(Inst_DJSk16)
  Bgt(Inst_DJSk16)
  Ble(Inst_DJSk16)
  Bgtu(Inst_DJSk16)
  Bleu(Inst_DJSk16)
} derive(Show)

///|
suberror La32ExecError {
  InstNotImplemented(String)
}

///|
/// Store stable_counter[0:31] to rd
/// Store counter id to rj
pub fn CPU::rdtimel_w(self : CPU, ins : Inst_DJ) -> UInt64 raise {
  let pc = self.get_pc()
  let id = self.get_counter_id()
  let count = get_bit_seg(self.get_stable_counter(), 0, 31)
  self.set_reg(R(ins.j), R(id.to_uint64()))
  self.set_reg(R(ins.d), R(count))
  pc + 4
}

///|
pub fn CPU::rdtimeh_w(self : CPU, ins : Inst_DJ) -> UInt64 raise {
  let pc = self.get_pc()
  let id = self.get_counter_id()
  let count = get_bit_seg(self.get_stable_counter(), 32, 63)
  self.set_reg(R(ins.j), R(id.to_uint64()))
  self.set_reg(R(ins.d), R(count))
  pc + 4
}

///|
///  Read CPU config
/// TODO: implement this
pub fn CPU::cpucfg(self : CPU, ins : Inst_DJ) -> UInt64 raise {
  let pc = self.get_pc()
  self.set_reg(R(ins.j), R(0))
  pc + 4
}

///|
/// tmp = GR[rj][31:0] + GR[rk][31:0]
/// GR[rd] = SignExtend(tmp[31:0], GRLEN) 
pub fn CPU::add_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let res = signed_extend(get_bit_seg(x + y, 0, 31), 32, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// tmp = GR[rj][31:0] - GR[rk][31:0]
/// GR[rd] = SignExtend(tmp[31:0], GRLEN) 
pub fn CPU::sub_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let res = signed_extend(get_bit_seg(x - y, 0, 31), 32, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// GR[rd] = (signed(GR[rj]) < signed(GR[rk])) ? 1 : 0
pub fn CPU::slt(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  if x.reinterpret_as_int64() < y.reinterpret_as_int64() {
    self.set_reg(R(ins.d), R(1))
  } else {
    self.set_reg(R(ins.d), R(0))
  }
  pc + 4
}

///|
/// GR[rd] = (unsigned(GR[rj]) < unsigned(GR[rk])) ? 1 : 0
pub fn CPU::sltu(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  if x < y {
    self.set_reg(R(ins.d), R(1))
  } else {
    self.set_reg(R(ins.d), R(0))
  }
  pc + 4
}

///|
/// GR[rd] = (GR[rk]==0) ? 0 : GR[rj]
pub fn CPU::maskeqz(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rk is R(x)
  let rd : Reg = R(ins.d)
  if x == 0 {
    self.set_reg(rd, R(0))
  } else {
    self.set_reg(rd, rj)
  }
  pc + 4
}

///|
/// GR[rd] = (GR[rk]!=0) ? 0 : GR[rj]
pub fn CPU::masknez(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rk is R(x)
  let rd : Reg = R(ins.d)
  if x != 0 {
    self.set_reg(rd, R(0))
  } else {
    self.set_reg(rd, rj)
  }
  pc + 4
}

///|
/// GR[rd] = ~(GR[rj] | GR[rk])
pub fn CPU::nor(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  self.set_reg(R(ins.d), R((x | y).lnot()))
  pc + 4
}

///|
/// GR[rd] = GR[rj] & GR[rk]
pub fn CPU::and_(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  self.set_reg(R(ins.d), R(x & y))
  pc + 4
}

///|
/// GR[rd] = GR[rj] | GR[rk]
pub fn CPU::or(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  self.set_reg(R(ins.d), R(x | y))
  pc + 4
}

///|
/// GR[rd] = GR[rj] ^ GR[rk]
pub fn CPU::xor(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  self.set_reg(R(ins.d), R(x ^ y))
  pc + 4
}

///|
/// GR[rd] = GR[rj] | (~GR[rk])
pub fn CPU::orn(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  self.set_reg(R(ins.d), R(x | y.lnot()))
  pc + 4
}

///|
/// GR[rd] = GR[rj] & (~GR[rk])
pub fn CPU::andn(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  self.set_reg(R(ins.d), R(x & y.lnot()))
  pc + 4
}

///|
/// tmp = SLL(GR[rj][31:0], GR[rk][4:0])
/// GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::sll_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let tmp = get_bit_seg(x, 0, 31) << get_bit_seg(y, 0, 4).to_int()
  self.set_reg(R(ins.d), R(signed_extend(get_bit_seg(tmp, 0, 31), 32, 64)))
  pc + 4
}

///|
/// tmp = SRL(GR[rj][31:0], GR[rk][4:0])
/// GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::srl_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let tmp = get_bit_seg(x, 0, 31) >> get_bit_seg(y, 0, 4).to_int()
  self.set_reg(R(ins.d), R(signed_extend(get_bit_seg(tmp, 0, 31), 32, 64)))
  pc + 4
}

///|
/// tmp = SRA(GR[rj][31:0], GR[rk][4:0])
/// GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::sra_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let tmp = get_bit_seg(x, 0, 31).to_uint().reinterpret_as_int() >>
    get_bit_seg(y, 0, 4).to_int()
  self.set_reg(
    R(ins.d),
    R(signed_extend(get_bit_seg(tmp.to_uint64(), 0, 31), 32, 64)),
  )
  pc + 4
}

///|
/// tmp = ROTR(GR[rj][31:0], GR[rk][4:0])
/// GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::rotr_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let len = get_bit_seg(y, 0, 4)
  let tmp = (get_bit_seg(x, 0, 31) >> len.to_int()) |
    (get_bit_seg(x, 0, len.to_int() - 1) << (31 - len.to_int() + 1))
  self.set_reg(R(ins.d), R(signed_extend(get_bit_seg(tmp, 0, 31), 32, 64)))
  pc + 4
}

///|
/// TODO: Break
pub fn CPU::break_(_ : CPU, _ : Inst_Ud15) -> UInt64 raise {
  raise InstNotImplemented("The instruction break has not been implemented")
}

///|
/// TODO: dbgcall
pub fn CPU::dbgcall(_ : CPU, _ : Inst_Ud15) -> UInt64 raise {
  raise InstNotImplemented("The instruction dbgcall has not been implemented")
}

///|
/// TODO: syscall
pub fn CPU::syscall(_ : CPU, _ : Inst_Ud15) -> UInt64 raise {
  raise InstNotImplemented("The instruction syscall has not been implemented")
}

///|
/// tmp = SLL(GR[rj][31:0], ui5)
//  GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::slli_w(self : CPU, ins : Inst_DJUk5) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let ui5 = ins.uk5
  guard rj is R(x)
  let tmp = get_bit_seg(x, 0, 31) << ui5.reinterpret_as_int()
  self.set_reg(R(ins.d), R(signed_extend(get_bit_seg(tmp, 0, 31), 32, 64)))
  pc + 4
}

///|
/// tmp = SRL(GR[rj][31:0], ui5)
//  GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::srli_w(self : CPU, ins : Inst_DJUk5) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let ui5 = ins.uk5
  guard rj is R(x)
  let tmp = get_bit_seg(x, 0, 31) >> ui5.reinterpret_as_int()
  self.set_reg(R(ins.d), R(signed_extend(get_bit_seg(tmp, 0, 31), 32, 64)))
  pc + 4
}

///|
/// tmp = SRA(GR[rj][31:0], ui5)
//  GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::srai_w(self : CPU, ins : Inst_DJUk5) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let ui5 = ins.uk5
  guard rj is R(x)
  let tmp = get_bit_seg(x, 0, 31).to_uint().reinterpret_as_int() >>
    ui5.reinterpret_as_int()
  self.set_reg(
    R(ins.d),
    R(signed_extend(get_bit_seg(tmp.to_uint64(), 0, 31), 32, 64)),
  )
  pc + 4
}

///|
/// tmp = ROTR(GR[rj][31:0], ui5)
/// GR[rd] = SignExtend(tmp[31:0], GRLEN))
pub fn CPU::rotri_w(self : CPU, ins : Inst_DJUk5) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let len = ins.uk5.reinterpret_as_int()
  let tmp = (get_bit_seg(x, 0, 31) >> len) |
    (get_bit_seg(x, 0, len - 1) << (31 - len + 1))
  self.set_reg(R(ins.d), R(signed_extend(get_bit_seg(tmp, 0, 31), 32, 64)))
  pc + 4
}

///|
/// tmp = SignExtend(si12, GRLEN)
/// GR[rd] = (signed(GR[rj]) < signed(tmp)) ? 1 : 0
pub fn CPU::slti(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let y = signed_extend(ins.sk12.to_uint64(), 12, 64)
  let res = (if x.reinterpret_as_int64() < y.reinterpret_as_int64() {
    1
  } else {
    0
  }).to_uint64()
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// tmp = SignExtend(si12, GRLEN)
/// GR[rd] = (unsigned(GR[rj]) < unsigned(tmp)) ? 1 : 0
pub fn CPU::sltui(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let y = ins.sk12
  let res = (if x < y.to_uint64() { 1 } else { 0 }).to_uint64()
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// tmp = GR[rj][31:0] + SignExtend(si12, 32)
/// GR[rd] = SignExtend(tmp[31:0], GRLEN)
pub fn CPU::addi_w(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let y = signed_extend(ins.sk12.to_uint64(), 12, 32).reinterpret_as_int64()
  let res = get_bit_seg(x, 0, 31).reinterpret_as_int64() + y
  self.set_reg(
    R(ins.d),
    R(signed_extend(get_bit_seg(res.reinterpret_as_uint64(), 0, 31), 32, 64)),
  )
  pc + 4
}

///|
/// GR[rd] = GR[rj] & ZeroExtend(ui12, GRLEN)
pub fn CPU::andi(self : CPU, ins : Inst_DJUk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let y = ins.uk12
  let res = x & y.to_uint64()
  self.set_reg(R(ins.d), R(get_bit_seg(res, 0, 31)))
  pc + 4
}

///|
/// GR[rd] = GR[rj] | ZeroExtend(ui12, GRLEN)
pub fn CPU::ori(self : CPU, ins : Inst_DJUk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let y = ins.uk12
  let res = x | y.to_uint64()
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// GR[rd] = GR[rj] ^ ZeroExtend(ui12, GRLEN)
pub fn CPU::xori(self : CPU, ins : Inst_DJUk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let y = ins.uk12
  let res = x ^ y.to_uint64()
  self.set_reg(R(ins.d), R(get_bit_seg(res, 0, 31)))
  pc + 4
}

///|
/// GR[rd] = SignExtend({si20, 12'b0}, GRLEN)
pub fn CPU::lu12i_w(self : CPU, ins : Inst_DSj20) -> UInt64 raise {
  let pc = self.get_pc()
  let si20 = ins.sj20.to_uint64()
  let res = signed_extend(si20 << 12, 32, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// tmp = PC + SignExtend({si20, 12'b0}, GRLEN)
/// GR[rd] = {tmp[GRLEN-1:12], 12'b0}
pub fn CPU::pcalau12i(self : CPU, ins : Inst_DSj20) -> UInt64 raise {
  let pc = self.get_pc()
  let si20 = ins.sj20
  let pc = self.get_pc()
  let res = signed_extend((si20 << 12).to_uint64(), 32, 64) + pc
  self.set_reg(R(ins.d), R(res ^ get_bit_seg(res, 0, 11)))
  pc + 4
}

///|
/// 
/// GR[rd] = PC + SignExtend({si20, 12'b0}, GRLEN)
pub fn CPU::pcaddu12i(self : CPU, ins : Inst_DSj20) -> UInt64 raise {
  let si20 = ins.sj20
  let pc = self.get_pc()
  let res = signed_extend((si20 << 12).to_uint64(), 32, 64) + pc
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// GR[rd] = PC + SignExtend({si20, 18'b0}, GRLEN)
pub fn CPU::pcaddu18i(self : CPU, ins : Inst_DSj20) -> UInt64 raise {
  let si20 = ins.sj20.reinterpret_as_uint()
  let pc = self.get_pc()
  let res = signed_extend((si20 << 18).to_uint64(), 32, 64) + pc
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + SignExtend(si12, GRLEN)
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// byte = MemoryLoad(paddr, BYTE)
/// GR[rd] = SignExtend(byte, GRLEN)
pub fn CPU::ld_b(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=1)
  let res = signed_extend(get_bit_seg(byte, 0, 7), 8, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + SignExtend(si12, GRLEN)
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// halfword = MemoryLoad(paddr, HALFWORD)
/// GR[rd] = SignExtend(halfword, GRLEN)
pub fn CPU::ld_h(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=2)
  let res = signed_extend(get_bit_seg(byte, 0, 15), 16, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + SignExtend(si12, GRLEN)
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// word = MemoryLoad(paddr, WORD)
/// GR[rd] = SignExtend(word, GRLEN)
pub fn CPU::ld_w(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=4)
  let res = signed_extend(get_bit_seg(byte, 0, 31), 32, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + SignExtend(si12, GRLEN)
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// MemoryStore(GR[rd][7:0], paddr, BYTE)
pub fn CPU::st_b(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  self.bus.store(paddr.to_uint(), get_bit_seg(y, 0, 7), size=1)
  pc + 4
}

///|
/// vaddr = GR[rj] + SignExtend(si12, GRLEN)
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// MemoryStore(GR[rd][15:0], paddr, HALFWORD)
pub fn CPU::st_h(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  self.bus.store(paddr.to_uint(), get_bit_seg(y, 0, 15), size=2)
  pc + 4
}

///|
/// vaddr = GR[rj] + SignExtend(si12, GRLEN)
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// MemoryStore(GR[rd][31:0], paddr, WORD)
pub fn CPU::st_w(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  self.bus.store(paddr.to_uint(), get_bit_seg(y, 0, 31), size=4)
  pc + 4
}

///|
/// GR[rd] = ZeroExtend(byte, GRLEN)
pub fn CPU::ld_bu(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=1)
  let res = zero_extend(get_bit_seg(byte, 0, 7), 8, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + SignExtend(si12, GRLEN)
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// halfword = MemoryLoad(paddr, HALFWORD)
/// GR[rd] = ZeroExtend(halfword, GRLEN)
fn CPU::ld_hu(self : CPU, ins : Inst_DJSk12) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let si12 = ins.sk12
  let vaddr = signed_extend(si12.to_uint64(), 12, 64) + x
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=2)
  let res = zero_extend(get_bit_seg(byte, 0, 15), 16, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// preld not implemented
pub fn CPU::preld(_ : CPU, _ : Inst_JUd5Sk12) -> UInt64 raise {
  raise InstNotImplemented("The instruction preld has not been implemented")
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// byte = MemoryLoad(paddr, BYTE)
/// GR[rd] = SignExtend(byte, GRLEN)
pub fn CPU::ldx_b(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=1)
  let res = signed_extend(get_bit_seg(byte, 0, 7), 8, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// halfword = MemoryLoad(paddr, HALFWORD)
/// GR[rd] = SignExtend(halfword, GRLEN)
pub fn CPU::ldx_h(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=2)
  let res = signed_extend(get_bit_seg(byte, 0, 15), 16, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// word = MemoryLoad(paddr, WORD)
/// GR[rd] = SignExtend(word, GRLEN)
pub fn CPU::ldx_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=4)
  let res = signed_extend(get_bit_seg(byte, 0, 31), 32, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// MemoryStore(GR[rd][7:0], paddr, BYTE)
pub fn CPU::stx_b(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rk is R(y)
  guard rd is R(z)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  self.bus.store(paddr.to_uint(), get_bit_seg(z, 0, 7), size=1)
  pc + 4
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// MemoryStore(GR[rd][15:0], paddr, HALFWORD)
pub fn CPU::stx_h(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rk is R(y)
  guard rd is R(z)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  self.bus.store(paddr.to_uint(), get_bit_seg(z, 0, 15), size=2)
  pc + 4
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// MemoryStore(GR[rd][31:0], paddr, WORD)
pub fn CPU::stx_w(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rk is R(y)
  guard rd is R(z)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  self.bus.store(paddr.to_uint(), get_bit_seg(z, 0, 31), size=4)
  pc + 4
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// byte = MemoryLoad(paddr, BYTE)
/// GR[rd] = ZeroExtend(byte, GRLEN)
pub fn CPU::ldx_bu(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=1)
  let res = zero_extend(get_bit_seg(byte, 0, 7), 8, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// vaddr = GR[rj] + GR[rk]
/// AddressComplianceCheck(vaddr)
/// paddr = AddressTranslation(vaddr)
/// halfword = MemoryLoad(paddr, HALFWORD)
/// GR[rd] = ZeroExtend(halfword, GRLEN)
pub fn CPU::ldx_hu(self : CPU, ins : Inst_DJK) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  let rk = self.get_reg(R(ins.k))
  guard rj is R(x)
  guard rk is R(y)
  let vaddr = x + y
  let paddr = vaddr // TODO: vaddr
  let byte = self.bus.load(paddr.to_uint(), size=2)
  let res = zero_extend(get_bit_seg(byte, 0, 15), 16, 64)
  self.set_reg(R(ins.d), R(res))
  pc + 4
}

///|
/// preldx not implemented
pub fn CPU::preldx(_ : CPU, _ : Inst_JKUd5) -> UInt64 raise {
  raise InstNotImplemented("The instruction preldx has not been implemented")
}

///|
/// dbar not implemented
/// TODO: memory barrier implementation
pub fn CPU::dbar(_ : CPU, _ : Inst_Ud15) -> UInt64 raise {
  raise InstNotImplemented("The instruction dbar has not been implemented")
}

///|
/// ibar not implemented
/// TODO: instruction barrier implementation
pub fn CPU::ibar(_ : CPU, _ : Inst_Ud15) -> UInt64 raise {
  raise InstNotImplemented("The instruction ibar has not been implemented")
}

///|
/// if GR[rj]==0 :
/// PC = PC + SignExtend({offs21, 2'b0}, GRLEN)
pub fn CPU::beqz(self : CPU, ins : Inst_JSd5k16) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let offset = signed_extend(ins.sd5k16.to_uint64() << 2, 23, 64)
  if x == 0 {
    pc + offset
  } else {
    pc + 4
  }
}

///|
/// if GR[rj]!=0 :
/// PC = PC + SignExtend({offs21, 2'b0}, GRLEN)
pub fn CPU::bnez(self : CPU, ins : Inst_JSd5k16) -> UInt64 raise {
  let pc = self.get_pc()
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let offset = signed_extend(ins.sd5k16.to_uint64() << 2, 23, 64)
  if x != 0 {
    pc + offset
  } else {
    pc + 4
  }
}

///|
/// GR[rd] = PC + 4
/// PC = GR[rj] + SignExtend({offs16, 2'b0}, GRLEN)
pub fn CPU::jirl(self : CPU, ins : Inst_DJSk16) -> UInt64 raise {
  let rj = self.get_reg(R(ins.j))
  guard rj is R(x)
  let pc = self.get_pc()
  self.set_reg(R(ins.d), R(pc + 4))
  let offset = signed_extend(ins.sk16.to_uint64() << 2, 18, 64)
  x + offset
}

///|
/// PC = PC + SignExtend({offs26, 2'b0}, GRLEN)
pub fn CPU::b(self : CPU, ins : Inst_Sd10k16) -> UInt64 raise {
  let pc = self.get_pc()
  let offset = signed_extend(ins.sd10k16.to_uint64() << 2, 28, 64)
  pc + offset
}

///|
/// GR[1] = PC + 4
/// PC = PC + SignExtend({offs26, 2'b0}, GRLEN)
pub fn CPU::bl(self : CPU, ins : Inst_Sd10k16) -> UInt64 raise {
  let pc = self.get_pc()
  self.set_reg(R(1), R(pc + 4))
  let offset = signed_extend(ins.sd10k16.to_uint64() << 2, 28, 64)
  pc + offset
}

///|
/// if GR[rj]==GR[rd] :
///     PC = PC + SignExtend({offs16, 2'b0}, GRLEN)
pub fn CPU::beq(self : CPU, ins : Inst_DJSk16) -> UInt64 raise {
  let pc = self.get_pc()
  let offset = signed_extend(ins.sk16.to_uint64() << 2, 18, 64)
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  if x == y {
    pc + offset
  } else {
    pc + 4
  }
}

///|
/// if GR[rj]!=GR[rd] :
///     PC = PC + SignExtend({offs16, 2'b0}, GRLEN)
pub fn CPU::bne(self : CPU, ins : Inst_DJSk16) -> UInt64 raise {
  let pc = self.get_pc()
  let offset = signed_extend(ins.sk16.to_uint64() << 2, 18, 64)
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  if x != y {
    pc + offset
  } else {
    pc + 4
  }
}

///|
/// if signed(GR[rj]) >= signed(GR[rd]) :
///     PC = PC + SignExtend({offs16, 2'b0}, GRLEN)
/// bge or bgt?
pub fn CPU::bgt(self : CPU, ins : Inst_DJSk16) -> UInt64 raise {
  let pc = self.get_pc()
  let offset = signed_extend(ins.sk16.to_uint64() << 2, 18, 64)
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  if x.reinterpret_as_int64() >= y.reinterpret_as_int64() {
    pc + offset
  } else {
    pc + 4
  }
}

///|
/// if signed(GR[rj]) < signed(GR[rd]) :
///     PC = PC + SignExtend({offs16, 2'b0}, GRLEN)
pub fn CPU::ble(self : CPU, ins : Inst_DJSk16) -> UInt64 raise {
  let pc = self.get_pc()
  let offset = signed_extend(ins.sk16.to_uint64() << 2, 18, 64)
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  if x.reinterpret_as_int64() < y.reinterpret_as_int64() {
    pc + offset
  } else {
    pc + 4
  }
}

///|
/// if unsigned(GR[rj]) >= unsigned(GR[rd]) :
///     PC = PC + SignExtend({offs16, 2'b0}, GRLEN
pub fn CPU::bgtu(self : CPU, ins : Inst_DJSk16) -> UInt64 raise {
  let pc = self.get_pc()
  let offset = signed_extend(ins.sk16.to_uint64() << 2, 18, 64)
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  if x >= y {
    pc + offset
  } else {
    pc + 4
  }
}

///|
/// if unsigned(GR[rj]) < unsigned(GR[rd]) :
///     PC = PC + SignExtend({offs16, 2'b0}, GRLEN)
pub fn CPU::bleu(self : CPU, ins : Inst_DJSk16) -> UInt64 raise {
  let pc = self.get_pc()
  let offset = signed_extend(ins.sk16.to_uint64() << 2, 18, 64)
  let rj = self.get_reg(R(ins.j))
  let rd = self.get_reg(R(ins.d))
  guard rj is R(x)
  guard rd is R(y)
  if x < y {
    pc + offset
  } else {
    pc + 4
  }
}
