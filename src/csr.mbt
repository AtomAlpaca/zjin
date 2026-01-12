///|
struct CSR {
  regs : FixedArray[UInt64]
}

///|
pub fn CSR::make_CSR() -> CSR {
  { regs: FixedArray::make(0x512, 0) }
}

///|
enum CSR_Type {
  CRMD
  PRMD
  EUEN
  MISC
  ECFG
  ESTAT
  ERA
  BADV
  BADI
  EENTRY
  TLBIDX
  TLBEHI
  TLBELO0
  TLBELO1
  ASID
  PGDL
  PGDH
  PGD
  PWCL
  PWCH
  STLBPS
  RVACFG
  CPUID
  PRCFG1
  PRCFG2
  PRCFG3
  SAVEn(Int)
  TID
  TCFG
  TVAL
  CNTC
  TICLR
  LLBCTL
  IMPCTL1
  IMPCTL2
  TLBENTRY
  TLBRBADV
  TLBRERA
  TLBRSAVE
  TLBRELO0
  TLBRELO1
  TLBREHI
  TLBRPRMD
  MERRCTL
  MERRINFO1
  MERRINFO2
  MERRENTRY
  MERRERA
  MERRSAVE
  CTAG
  MSGIS0
  MSGIS1
  MSGIS2
  MSGIS3
  MSGIR
  MSGIE
  DMWn(Int)
  PMCFGn(Int)
  PMCNTn(Int)
  MWPC
  MWPS
  MWPnCFG1(Int)
  MWPnCFG2(Int)
  MWPnCFG3(Int)
  MWPnCFG4(Int)
  FWPC
  FWPS
  FWPnCFG1(Int)
  FWPnCFG2(Int)
  FWPnCFG3(Int)
  FWPnCFG4(Int)
  DBG
  DERA
  DSAVE
}

///|
pub fn CSR::get_csr(self : CSR, csr_num : Int) -> UInt64 {
  if csr_num >= 0x502 || csr_num < 0 {
    0
  } else {
    self.regs[csr_num]
  }
}

pub fn CSR::set_csr(self : CSR, csr_num : Int, val : UInt64) -> Unit {
  if csr_num >= 0x502 || csr_num < 0 {
    return
  }
  self.regs[csr_num] = val
}

///|
suberror CSR_Access_Error {
  CSR_REG_INVALID(String)
}

///|
pub fn CSR::get_csr_by_type(self : CSR, csr_type : CSR_Type) -> UInt64 raise {
  let add = match csr_type {
    CRMD => 0x0
    PRMD => 0x1
    EUEN => 0x2
    MISC => 0x3
    ECFG => 0x4
    ESTAT => 0x5
    ERA => 0x6
    BADV => 0x7
    BADI => 0x8
    EENTRY => 0xc
    TLBIDX => 0x10
    TLBEHI => 0x11
    TLBELO0 => 0x12
    TLBELO1 => 0x13
    ASID => 0x18
    PGDL => 0x19
    PGDH => 0x1A
    PGD => 0x1B
    PWCL => 0x1C
    PWCH => 0x1D
    STLBPS => 0x1E
    RVACFG => 0x1F
    CPUID => 0x20
    PRCFG1 => 0x21
    PRCFG2 => 0x22
    PRCFG3 => 0x23
    SAVEn(n) => {
      if n < 0 || n > 15 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid SAVEn CSR number".to_string(),
        )
      }
      0x30 + n
    }
    TID => 0x40
    TCFG => 0x41
    TVAL => 0x42
    CNTC => 0x43
    TICLR => 0x44
    LLBCTL => 0x60
    IMPCTL1 => 0x80
    IMPCTL2 => 0x81
    TLBENTRY => 0x88
    TLBRBADV => 0x89
    TLBRERA => 0x8A
    TLBRSAVE => 0x8B
    TLBRELO0 => 0x8C
    TLBRELO1 => 0x8D
    TLBREHI => 0x8E
    TLBRPRMD => 0x8F
    MERRCTL => 0x90
    MERRINFO1 => 0x91
    MERRINFO2 => 0x92
    MERRENTRY => 0x93
    MERRERA => 0x94
    MERRSAVE => 0x95
    CTAG => 0x98
    MSGIS0 => 0xA0
    MSGIS1 => 0xA1
    MSGIS2 => 0xA2
    MSGIS3 => 0xA3
    MSGIR => 0xA4
    MSGIE => 0xA5
    DMWn(n) => {
      if n < 0 || n > 3 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid DMWn CSR number".to_string(),
        )
      }
      0x180 + n
    }
    PMCFGn(n) => {
      if n < 0 || n > 31 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid PMCFGn CSR number".to_string(),
        )
      }
      0x200 + 2 * n
    }
    PMCNTn(n) => {
      if n < 0 || n > 31 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid PMCNTn CSR number".to_string(),
        )
      }
      0x201 + 2 * n
    }
    MWPC => 0x300
    MWPS => 0x301
    MWPnCFG1(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid MWPnCFGn CSR number".to_string(),
        )
      }
      0x310 + 8 * n
    }
    MWPnCFG2(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid MWPnCFG2 CSR number".to_string(),
        )
      }
      0x311 + 8 * n
    }
    MWPnCFG3(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid MWPnCFG3 CSR number".to_string(),
        )
      }
      0x312 + 8 * n
    }
    MWPnCFG4(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid MWPnCFG4 CSR number".to_string(),
        )
      }
      0x313 + 8 * n
    }
    FWPC => 0x380
    FWPS => 0x381
    FWPnCFG1(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid FWPnCFG1 CSR number".to_string(),
        )
      }
      0x390 + 8 * n
    }
    FWPnCFG2(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid FWPnCFG2 CSR number".to_string(),
        )
      }
      0x391 + 8 * n
    }
    FWPnCFG3(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid FWPnCFG3 CSR number".to_string(),
        )
      }
      0x392 + 8 * n
    }
    FWPnCFG4(n) => {
      if n < 0 || n > 13 {
        raise CSR_Access_Error::CSR_REG_INVALID(
          "Invalid FWPnCFG4 CSR number".to_string(),
        )
      }
      0x393 + 8 * n
    }
    DBG => 0x500
    DERA => 0x501
    DSAVE => 0x502
  }
  self.get_csr(add)
}

///|
enum CRMD_Field {
  PLV
  IE
  DA
  PG
  DATF
  DATM
  WE
}

///|
enum PRMD_Field {
  PPLV
  PID
  PWE
}

///|
enum EUEN_Field {
  FPE
  SXE
  ASXE
  BTE
}

///|
enum MISC_Field {
  VA32L1
  VA32L2
  VA32L3
  DRDTL1
  DRDTL2
  DRDTL3
  RPCNTL1
  RPCNTL2
  RPCNTL3
  ALCL0
  ALCL1
  ALCL2
  ALCL3
  DWPL0
  DWPL1
  DWPL2
}

///|
enum ECFG_Field {
  LIE
  VS
}

///|
enum ESTAT_Field {
  IS
  MsgInt
  Ecode
  EsubCode
}

///|
enum ERA_Field {
  PC
}

///|
enum BADV_Field {
  VAddr
}

///|
enum BADI_Field {
  Inst
}

///|
enum EENTRY_Field {
  VPN
}

///|
enum RVACFG_Field {
  RBits
}

///|
enum CPUID_Field {
  CoreID
}

///|
enum PRCFG1_Field {
  SAVENum
  TimerBits
  VSMax
}

///|
enum PRCFG2_Field {
  PSVAL
}

///|
enum PRCFG3_Field {
  TLBType
  MTLBEntries
  STLBWays
  STLBSets
}

///|
enum SAVE_Field {
  Data
}

///|
enum LLBCTL_Field {
  ROLLB
  WCLLB
  KLO
}

///|
enum TLBIDX_Field {
  Index
  PS
  NE
}

///|
enum TLBEHI_Field {
  VPPN
  Sign_Ext
}

///|
enum TLBELO_Field {
  V
  D
  PLV
  MAT
  G
  PPN
  NR
  NX
  RPLV
}

///|
enum ASID_Field {
  ASID
  ASIDBITS
}

///|
enum PGDL_Field {
  Base
}

///|
enum PGDH_Field {
  Base
}

///|
enum PGD_Field {
  Base
}

///|
enum PWCL_Field {
  PTbase
  PTwidth
  Dirl_base
  Dirl_width
  Dir2_base
  Dir2_width
  PTEWidth
}

///|
enum PWCH_Field {
  Dir3_base
  Dir3_width
  Dir4_base
  Dir4_width
  HPTW_En
}

///|
enum STLBPS_Field {
  PS
}

///|
enum TLBENTRY_Field {
  PPN
}

///|
enum TLBRBADV_Field {
  VAddr
}

///|
enum TLBRERA_Field {
  IsTLBR
  PC
}

///|
enum TLBRSAVE_Field {
  Data
}

///|
enum TLBRELO_Field {
  V
  D
  PLV
  MAT
  G
  PPN
  NR
  NX
  RPLV
}

///|
enum TLBREHI_Field {
  PS
  VPPN
  Sign_Ext
}

///|
enum TLBRPRMD_Field {
  PPLV
  PIE
  PWE
}

///|
enum DMW_Field {
  PLV0
  PLV1
  PLV2
  PLV3
  MAT
  VSEG
}

///|
enum TID_Field {
  TID
}

///|
enum TCFG_Field {
  En
  Periodic
  InitVal
}

///|
enum TVAL_Field {
  TimeVal
}

///|
enum CNTC_Field {
  Cimpensation
}

///|
enum TICLR_Field {
  CLR
}

///|
enum MERRCTL_Field {
  IsMERR
  Repairable
  PPLV
  PIE
  PWE
  PDA
  PPG
  PDATF
  PDATM
  Cause
}

///|
enum MERRENTRY_Field {
  PPN
}

///|
enum MERRERA_Field {
  PC
}

///|
enum MERRSAVE_Field {
  Data
}

///|
enum PMCFG_Field {
  EvCode
  PLV0
  PLV1
  PLV2
  PLV3
  PMIEn
}

///|
enum PMCNT_Field {
  Count
}

///|
enum MWPC_Field {
  Num
}

///|
enum MWPS_Field {
  Status
  Skip
}

///|
enum MWPnCFG1_Field {
  VAddr
}

///|
enum MWPnCFG2_Field {
  Mask
}

///|
enum MWPnCFG3_Field {
  DSOnly
  PLV0
  PLV1
  PLV2
  PLV3
  LCL
  LoadEn
  StoreEn
  Size
}

///|
enum MWPnCFG4_Field {
  ASID
}

///|
enum FWPC_Field {
  Num
}

///|
enum FWPS_Field {
  Status
  Skip
}

///|
enum FWPnCFG1_Field {
  VAddr
}

///|
enum FWPnCFG2_Field {
  Mask
}

///|
enum FWPnCFG3_Field {
  DSOnly
  PLV0
  PLV1
  PLV2
  PLV3
  LCL
}

///|
enum FWPnCFG4_Field {
  ASID
}

///|
enum DBG_Field {
  DS
  DRev
  DEI
  DCL
  DFW
  DMW
  Ecode
}

///|
enum DERA_Field {
  PC
}

///|
enum DSAVE_Field {
  Data
}

///|
enum MSGIS_Field {
  IS
}

///|
enum MSGIR_Field {
  IntNum
  Null
}

///|
enum MSGIE_Field {
  PT
}

///|
enum CSR_Field {
  CRMD(CRMD_Field)
  PRMD(PRMD_Field)
  EUEN(EUEN_Field)
  MISC(MISC_Field)
  ECFG(ECFG_Field)
  ESTAT(ESTAT_Field)
  ERA(ERA_Field)
  BADV(BADV_Field)
  BADI(BADI_Field)
  EENTRY(EENTRY_Field)
  TLBIDX(TLBIDX_Field)
  TLBEHI(TLBEHI_Field)
  TLBELO0(TLBELO_Field)
  TLBELO1(TLBELO_Field)
  ASID(ASID_Field)
  PGDL(PGDL_Field)
  PGDH(PGDH_Field)
  PGD(PGD_Field)
  PWCL(PWCL_Field)
  PWCH(PWCH_Field)
  STLBPS(STLBPS_Field)
  RVACFG(RVACFG_Field)
  CPUID(CPUID_Field)
  PRCFG1(PRCFG1_Field)
  PRCFG2(PRCFG2_Field)
  PRCFG3(PRCFG3_Field)
  SAVEn(Int, SAVE_Field)
  TID(TID_Field)
  TCFG(TCFG_Field)
  TVAL(TVAL_Field)
  CNTC(CNTC_Field)
  TICLR(TICLR_Field)
  LLBCTL(LLBCTL_Field)
  IMPCTL1
  IMPCTL2
  TLBENTRY(TLBENTRY_Field)
  TLBRBADV(TLBRBADV_Field)
  TLBRERA(TLBRERA_Field)
  TLBRSAVE(TLBRSAVE_Field)
  TLBRELO0(TLBRELO_Field)
  TLBRELO1(TLBRELO_Field)
  TLBREHI(TLBREHI_Field)
  TLBRPRMD(TLBRPRMD_Field)
  MERRCTL(MERRCTL_Field)
  MERRINFO1
  MERRINFO2
  MERRENTRY(MERRENTRY_Field)
  MERRERA(MERRERA_Field)
  MERRSAVE(MERRSAVE_Field)
  CTAG
  MSGIS0(MSGIS_Field)
  MSGIS1(MSGIS_Field)
  MSGIS2(MSGIS_Field)
  MSGIS3(MSGIS_Field)
  MSGIR(MSGIR_Field)
  MSGIE(MSGIE_Field)
  DMWn(Int, DMW_Field)
  PMCFGn(Int, PMCFG_Field)
  PMCNTn(Int, PMCNT_Field)
  MWPC(MWPC_Field)
  MWPS(MWPS_Field)
  MWPnCFG1(Int, MWPnCFG1_Field)
  MWPnCFG2(Int, MWPnCFG2_Field)
  MWPnCFG3(Int, MWPnCFG3_Field)
  MWPnCFG4(Int, MWPnCFG4_Field)
  FWPC(FWPC_Field)
  FWPS(FWPS_Field)
  FWPnCFG1(Int, FWPnCFG1_Field)
  FWPnCFG2(Int, FWPnCFG2_Field)
  FWPnCFG3(Int, FWPnCFG3_Field)
  FWPnCFG4(Int, FWPnCFG4_Field)
  DBG(DBG_Field)
  DERA(DERA_Field)
  DSAVE(DSAVE_Field)
}

///|
pub fn CSR::get_csr_field(self : CSR, field : CSR_Field) -> UInt64 raise {
  match field {
    CRMD(x) => {
      let v = self.get_csr_by_type(CRMD)
      match x {
        PLV => get_bit_seg(v, 0, 1)
        IE => get_bit_seg(v, 2, 2)
        DA => get_bit_seg(v, 3, 3)
        PG => get_bit_seg(v, 4, 4)
        DATF => get_bit_seg(v, 5, 6)
        DATM => get_bit_seg(v, 7, 8)
        WE => get_bit_seg(v, 9, 9)
      }
    }
    PRMD(x) => {
      let v = self.get_csr_by_type(PRMD)
      match x {
        PPLV => get_bit_seg(v, 0, 1)
        PID => get_bit_seg(v, 2, 2)
        PWE => get_bit_seg(v, 3, 3)
      }
    }
    EUEN(x) => {
      let v = self.get_csr_by_type(EUEN)
      match x {
        FPE => get_bit_seg(v, 0, 0)
        SXE => get_bit_seg(v, 1, 1)
        ASXE => get_bit_seg(v, 2, 2)
        BTE => get_bit_seg(v, 3, 3)
      }
    }
    MISC(x) => {
      let v = self.get_csr_by_type(MISC)
      match x {
        VA32L1 => get_bit_seg(v, 1, 1)
        VA32L2 => get_bit_seg(v, 2, 2)
        VA32L3 => get_bit_seg(v, 3, 3)
        DRDTL1 => get_bit_seg(v, 5, 5)
        DRDTL2 => get_bit_seg(v, 6, 6)
        DRDTL3 => get_bit_seg(v, 7, 7)
        RPCNTL1 => get_bit_seg(v, 9, 9)
        RPCNTL2 => get_bit_seg(v, 10, 10)
        RPCNTL3 => get_bit_seg(v, 11, 11)
        ALCL0 => get_bit_seg(v, 12, 12)
        ALCL1 => get_bit_seg(v, 13, 13)
        ALCL2 => get_bit_seg(v, 14, 14)
        ALCL3 => get_bit_seg(v, 15, 15)
        DWPL0 => get_bit_seg(v, 16, 16)
        DWPL1 => get_bit_seg(v, 17, 17)
        DWPL2 => get_bit_seg(v, 18, 18)
      }
    }
    ECFG(x) => {
      let v = self.get_csr_by_type(ECFG)
      match x {
        LIE => get_bit_seg(v, 0, 12)
        VS => get_bit_seg(v, 16, 18)
      }
    }
    ESTAT(x) => {
      let v = self.get_csr_by_type(ESTAT)
      match x {
        IS => get_bit_seg(v, 0, 12)
        MsgInt => get_bit_seg(v, 14, 14)
        Ecode => get_bit_seg(v, 16, 21)
        EsubCode => get_bit_seg(v, 22, 30)
      }
    }
    ERA(x) => {
      let v = self.get_csr_by_type(ERA)
      match x {
        PC => get_bit_seg(v, 0, 63)
      }
    }
    BADV(x) => {
      let v = self.get_csr_by_type(BADV)
      match x {
        VAddr => get_bit_seg(v, 0, 63)
      }
    }
    BADI(x) => {
      let v = self.get_csr_by_type(BADI)
      match x {
        Inst => get_bit_seg(v, 0, 31)
      }
    }
    EENTRY(x) => {
      let v = self.get_csr_by_type(EENTRY)
      match x {
        VPN => get_bit_seg(v, 12, 63)
      }
    }
    RVACFG(x) => {
      let v = self.get_csr_by_type(RVACFG)
      match x {
        RBits => get_bit_seg(v, 0, 3)
      }
    }
    CPUID(x) => {
      let v = self.get_csr_by_type(CPUID)
      match x {
        CoreID => get_bit_seg(v, 0, 8)
      }
    }
    PRCFG1(x) => {
      let v = self.get_csr_by_type(PRCFG1)
      match x {
        SAVENum => get_bit_seg(v, 0, 3)
        TimerBits => get_bit_seg(v, 4, 11)
        VSMax => get_bit_seg(v, 12, 14)
      }
    }
    PRCFG2(x) => {
      let v = self.get_csr_by_type(PRCFG2)
      match x {
        PSVAL => get_bit_seg(v, 0, 63)
      }
    }
    PRCFG3(x) => {
      let v = self.get_csr_by_type(PRCFG3)
      match x {
        TLBType => get_bit_seg(v, 0, 3)
        MTLBEntries => get_bit_seg(v, 4, 11)
        STLBWays => get_bit_seg(v, 12, 19)
        STLBSets => get_bit_seg(v, 20, 25)
      }
    }
    SAVEn(i, x) => {
      let v = self.get_csr_by_type(SAVEn(i))
      match x {
        Data => get_bit_seg(v, 0, 63)
      }
    }
    LLBCTL(x) => {
      let v = self.get_csr_by_type(LLBCTL)
      match x {
        ROLLB => get_bit_seg(v, 0, 0)
        WCLLB => get_bit_seg(v, 1, 1)
        KLO => get_bit_seg(v, 2, 2)
      }
    }
    IMPCTL1 => self.get_csr_by_type(IMPCTL1)
    IMPCTL2 => self.get_csr_by_type(IMPCTL2)
    CTAG => self.get_csr_by_type(CTAG)
    TLBIDX(x) => {
      let v = self.get_csr_by_type(TLBIDX)
      match x {
        Index => get_bit_seg(v, 0, 15)
        PS => get_bit_seg(v, 24, 29)
        NE => get_bit_seg(v, 31, 31)
      }
    }
    TLBEHI(x) => {
      let v = self.get_csr_by_type(TLBEHI)
      match x {
        VPPN => get_bit_seg(v, 13, 63)
        Sign_Ext => get_bit_seg(v, 63, 63)
      }
    }
    TLBELO0(x) => {
      let v = self.get_csr_by_type(TLBELO0)
      match x {
        V => get_bit_seg(v, 0, 0)
        D => get_bit_seg(v, 1, 1)
        PLV => get_bit_seg(v, 2, 3)
        MAT => get_bit_seg(v, 4, 5)
        G => get_bit_seg(v, 6, 6)
        PPN => get_bit_seg(v, 12, PALEN - 1)
        NR => get_bit_seg(v, 61, 61)
        NX => get_bit_seg(v, 62, 62)
        RPLV => get_bit_seg(v, 63, 63)
      }
    }
    TLBELO1(x) => {
      let v = self.get_csr_by_type(TLBELO0)
      match x {
        V => get_bit_seg(v, 0, 0)
        D => get_bit_seg(v, 1, 1)
        PLV => get_bit_seg(v, 2, 3)
        MAT => get_bit_seg(v, 4, 5)
        G => get_bit_seg(v, 6, 6)
        PPN => get_bit_seg(v, 12, PALEN - 1)
        NR => get_bit_seg(v, 61, 61)
        NX => get_bit_seg(v, 62, 62)
        RPLV => get_bit_seg(v, 63, 63)
      }
    }
    ASID(x) => {
      let v = self.get_csr_by_type(ASID)
      match x {
        ASID => get_bit_seg(v, 0, 9)
        ASIDBITS => get_bit_seg(v, 16, 23)
      }
    }
    PGDL(x) => {
      let v = self.get_csr_by_type(PGDL)
      match x {
        Base => get_bit_seg(v, 12, GRLEN - 1)
      }
    }
    PGDH(x) => {
      let v = self.get_csr_by_type(PGDH)
      match x {
        Base => get_bit_seg(v, 12, GRLEN - 1)
      }
    }
    PGD(x) => {
      let v = self.get_csr_by_type(PGD)
      match x {
        Base => get_bit_seg(v, 12, GRLEN - 1)
      }
    }
    PWCL(x) => {
      let v = self.get_csr_by_type(PWCL)
      match x {
        PTbase => get_bit_seg(v, 0, 4)
        PTwidth => get_bit_seg(v, 5, 9)
        Dirl_base => get_bit_seg(v, 10, 14)
        Dirl_width => get_bit_seg(v, 15, 19)
        Dir2_base => get_bit_seg(v, 20, 24)
        Dir2_width => get_bit_seg(v, 25, 29)
        PTEWidth => get_bit_seg(v, 30, 31)
      }
    }
    PWCH(x) => {
      let v = self.get_csr_by_type(PWCH)
      match x {
        Dir3_base => get_bit_seg(v, 0, 5)
        Dir3_width => get_bit_seg(v, 6, 11)
        Dir4_base => get_bit_seg(v, 12, 17)
        Dir4_width => get_bit_seg(v, 18, 23)
        HPTW_En => get_bit_seg(v, 24, 24)
      }
    }
    STLBPS(x) => {
      let v = self.get_csr_by_type(STLBPS)
      match x {
        PS => get_bit_seg(v, 0, 5)
      }
    }
    TLBENTRY(x) => {
      let v = self.get_csr_by_type(TLBENTRY)
      match x {
        PPN => get_bit_seg(v, 12, PALEN - 1)
      }
    }
    TLBRBADV(x) => {
      let v = self.get_csr_by_type(TLBRBADV)
      match x {
        VAddr => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    TLBRERA(x) => {
      let v = self.get_csr_by_type(TLBRBADV)
      match x {
        IsTLBR => get_bit_seg(v, 0, 0)
        PC => get_bit_seg(v, 2, GRLEN - 1)
      }
    }
    TLBRSAVE(x) => {
      let v = self.get_csr_by_type(TLBRSAVE)
      match x {
        Data => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    TLBRELO0(x) => {
      let v = self.get_csr_by_type(TLBRELO0)
      match x {
        V => get_bit_seg(v, 0, 0)
        D => get_bit_seg(v, 1, 1)
        PLV => get_bit_seg(v, 2, 3)
        MAT => get_bit_seg(v, 4, 5)
        G => get_bit_seg(v, 6, 6)
        PPN => get_bit_seg(v, 12, PALEN - 1)
        NR => get_bit_seg(v, 61, 61)
        NX => get_bit_seg(v, 62, 62)
        RPLV => get_bit_seg(v, 63, 63)
      }
    }
    TLBRELO1(x) => {
      let v = self.get_csr_by_type(TLBRELO1)
      match x {
        V => get_bit_seg(v, 0, 0)
        D => get_bit_seg(v, 1, 1)
        PLV => get_bit_seg(v, 2, 3)
        MAT => get_bit_seg(v, 4, 5)
        G => get_bit_seg(v, 6, 6)
        PPN => get_bit_seg(v, 12, PALEN - 1)
        NR => get_bit_seg(v, 61, 61)
        NX => get_bit_seg(v, 62, 62)
        RPLV => get_bit_seg(v, 63, 63)
      }
    }
    TLBREHI(x) => {
      let v = self.get_csr_by_type(TLBREHI)
      match x {
        PS => get_bit_seg(v, 0, 5)
        VPPN => get_bit_seg(v, 13, VALEN - 1)
        Sign_Ext => get_bit_seg(v, VALEN, 63)
      }
    }
    TLBRPRMD(x) => {
      let v = self.get_csr_by_type(TLBRPRMD)
      match x {
        PPLV => get_bit_seg(v, 0, 1)
        PIE => get_bit_seg(v, 2, 2)
        PWE => get_bit_seg(v, 4, 4)
      }
    }
    DMWn(i, x) => {
      let v = self.get_csr_by_type(DMWn(i))
      match x {
        PLV0 => get_bit_seg(v, 0, 0)
        PLV1 => get_bit_seg(v, 1, 1)
        PLV2 => get_bit_seg(v, 2, 2)
        PLV3 => get_bit_seg(v, 3, 3)
        MAT => get_bit_seg(v, 4, 5)
        VSEG => get_bit_seg(v, 60, 63)
      }
    }
    TID(x) => {
      let v = self.get_csr_by_type(TID)
      match x {
        TID => get_bit_seg(v, 0, 31)
      }
    }
    TCFG(x) => {
      let v = self.get_csr_by_type(TCFG)
      match x {
        En => get_bit_seg(v, 0, 0)
        Periodic => get_bit_seg(v, 1, 1)
        InitVal => get_bit_seg(v, GRLEN - 1, 2)
      }
    }
    TVAL(x) => {
      let v = self.get_csr_by_type(TVAL)
      match x {
        TimeVal => get_bit_seg(v, GRLEN - 1, 0)
      }
    }
    CNTC(x) => {
      let v = self.get_csr_by_type(CNTC)
      match x {
        Cimpensation => get_bit_seg(v, GRLEN - 1, 1)
      }
    }
    TICLR(x) => {
      let v = self.get_csr_by_type(TICLR)
      match x {
        CLR => get_bit_seg(v, 0, 1)
      }
    }
    MERRCTL(x) => {
      let v = self.get_csr_by_type(MERRCTL)
      match x {
        IsMERR => get_bit_seg(v, 0, 0)
        Repairable => get_bit_seg(v, 1, 1)
        PPLV => get_bit_seg(v, 2, 3)
        PIE => get_bit_seg(v, 4, 4)
        PWE => get_bit_seg(v, 6, 6)
        PDA => get_bit_seg(v, 7, 7)
        PPG => get_bit_seg(v, 8, 8)
        PDATF => get_bit_seg(v, 9, 10)
        PDATM => get_bit_seg(v, 11, 12)
        Cause => get_bit_seg(v, 16, 23)
      }
    }
    MERRINFO1 => self.get_csr_by_type(MERRINFO1)
    MERRINFO2 => self.get_csr_by_type(MERRINFO2)
    MERRENTRY(x) => {
      let v = self.get_csr_by_type(MERRENTRY)
      match x {
        PPN => get_bit_seg(v, 12, PALEN - 1)
      }
    }
    MERRERA(x) => {
      let v = self.get_csr_by_type(MERRERA)
      match x {
        PC => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    MERRSAVE(x) => {
      let v = self.get_csr_by_type(MERRSAVE)
      match x {
        Data => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    PMCFGn(i, x) => {
      let v = self.get_csr_by_type(PMCFGn(i))
      match x {
        EvCode => get_bit_seg(v, 0, 9)
        PLV0 => get_bit_seg(v, 16, 16)
        PLV1 => get_bit_seg(v, 17, 17)
        PLV2 => get_bit_seg(v, 18, 18)
        PLV3 => get_bit_seg(v, 19, 19)
        PMIEn => get_bit_seg(v, 20, 20)
      }
    }
    PMCNTn(i, x) => {
      let v = self.get_csr_by_type(PMCNTn(i))
      match x {
        Count => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    MWPC(x) => {
      let v = self.get_csr_by_type(MWPC)
      match x {
        Num => get_bit_seg(v, 0, 5)
      }
    }
    MWPS(x) => {
      let v = self.get_csr_by_type(MWPS)
      match x {
        Status => get_bit_seg(v, 15, 1)
        Skip => get_bit_seg(v, 16, 16)
      }
    }
    MWPnCFG1(i, x) => {
      let v = self.get_csr_by_type(MWPnCFG1(i))
      match x {
        VAddr => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    MWPnCFG2(i, x) => {
      let v = self.get_csr_by_type(MWPnCFG2(i))
      match x {
        Mask => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    MWPnCFG3(i, x) => {
      let v = self.get_csr_by_type(MWPnCFG3(i))
      match x {
        DSOnly => get_bit_seg(v, 0, 0)
        PLV0 => get_bit_seg(v, 1, 1)
        PLV1 => get_bit_seg(v, 2, 2)
        PLV2 => get_bit_seg(v, 3, 3)
        PLV3 => get_bit_seg(v, 4, 4)
        LCL => get_bit_seg(v, 7, 7)
        LoadEn => get_bit_seg(v, 8, 8)
        StoreEn => get_bit_seg(v, 9, 9)
        Size => get_bit_seg(v, 10, 11)
      }
    }
    MWPnCFG4(i, x) => {
      let v = self.get_csr_by_type(MWPnCFG4(i))
      match x {
        ASID => get_bit_seg(v, 0, 9)
      }
    }
    FWPC(x) => {
      let v = self.get_csr_by_type(FWPC)
      match x {
        Num => get_bit_seg(v, 0, 5)
      }
    }
    FWPS(x) => {
      let v = self.get_csr_by_type(FWPS)
      match x {
        Status => get_bit_seg(v, 1, 15)
        Skip => get_bit_seg(v, 16, 16)
      }
    }
    FWPnCFG1(i, x) => {
      let v = self.get_csr_by_type(FWPnCFG1(i))
      match x {
        VAddr => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    FWPnCFG2(i, x) => {
      let v = self.get_csr_by_type(FWPnCFG2(i))
      match x {
        Mask => get_bit_seg(v, 0, GRLEN - 1)
      }
    }
    FWPnCFG3(i, x) => {
      let v = self.get_csr_by_type(FWPnCFG3(i))
      match x {
        DSOnly => get_bit_seg(v, 0, 0)
        PLV0 => get_bit_seg(v, 1, 1)
        PLV1 => get_bit_seg(v, 2, 2)
        PLV2 => get_bit_seg(v, 3, 3)
        PLV3 => get_bit_seg(v, 4, 4)
        LCL => get_bit_seg(v, 7, 7)
      }
    }
    FWPnCFG4(i, x) => {
      let v = self.get_csr_by_type(FWPnCFG4(i))
      match x {
        ASID => get_bit_seg(v, 0, 9)
      }
    }
    DBG(x) => {
      let v = self.get_csr_by_type(DBG)
      match x {
        DS => get_bit_seg(v, 0, 0)
        DRev => get_bit_seg(v, 1, 7)
        DEI => get_bit_seg(v, 8, 8)
        DCL => get_bit_seg(v, 9, 9)
        DFW => get_bit_seg(v, 10, 10)
        DMW => get_bit_seg(v, 11, 11)
        Ecode => get_bit_seg(v, 16, 21)
      }
    }
    DERA(x) => {
      let v = self.get_csr_by_type(DERA)
      match x {
        PC => get_bit_seg(v, 0, 63)
      }
    }
    DSAVE(x) => {
      let v = self.get_csr_by_type(DSAVE)
      match x {
        Data => get_bit_seg(v, 0, 63)
      }
    }
    MSGIS0(x) => {
      let v = self.get_csr_by_type(MSGIS0)
      match x {
        IS => get_bit_seg(v, 0, 63)
      }
    }
    MSGIS1(x) => {
      let v = self.get_csr_by_type(MSGIS1)
      match x {
        IS => get_bit_seg(v, 0, 63)
      }
    }
    MSGIS2(x) => {
      let v = self.get_csr_by_type(MSGIS2)
      match x {
        IS => get_bit_seg(v, 0, 63)
      }
    }
    MSGIS3(x) => {
      let v = self.get_csr_by_type(MSGIS3)
      match x {
        IS => get_bit_seg(v, 0, 63)
      }
    }
    MSGIR(x) => {
      let v = self.get_csr_by_type(MSGIR)
      match x {
        IntNum => get_bit_seg(v, 0, 7)
        Null => get_bit_seg(v, 31, 31)
      }
    }
    MSGIE(x) => {
      let v = self.get_csr_by_type(MSGIE)
      match x {
        PT => get_bit_seg(v, 0, 7)
      }
    }
  }
}
