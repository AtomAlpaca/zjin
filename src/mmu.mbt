///|
struct TLB_Entry {
  comp : UInt64
  info0 : UInt64
  info1 : UInt64
}

///|
pub fn TLB_Entry::make_tlb_entry() -> TLB_Entry {
  { comp: 0, info0: 0, info1: 0 }
}

///|
enum TLB_Entry_Field {
  VPPN
  PS
  G
  ASID
  E
  PPN0
  RPLV0
  PLV0
  MAT0
  NX0
  NR0
  D0
  V0
  PPN1
  RPLV1
  PLV1
  MAT1
  NX1
  NR1
  D1
  V1
}

///|
pub fn TLB_Entry::get_field(
  self : TLB_Entry,
  field : TLB_Entry_Field,
) -> UInt64 {
  match field {
    E => get_bit_seg(self.comp, 0, 0)
    ASID => get_bit_seg(self.comp, 1, 10)
    G => get_bit_seg(self.comp, 11, 11)
    PS => get_bit_seg(self.comp, 12, 17)
    VPPN => get_bit_seg(self.comp, 18, 18 + (VALEN - 13) - 1)
    V0 => get_bit_seg(self.info0, 0, 0)
    D0 => get_bit_seg(self.info0, 1, 1)
    NR0 => get_bit_seg(self.info0, 2, 2)
    NX0 => get_bit_seg(self.info0, 3, 3)
    MAT0 => get_bit_seg(self.info0, 4, 5)
    PLV0 => get_bit_seg(self.info0, 6, 7)
    RPLV0 => get_bit_seg(self.info0, 8, 8)
    PPN0 => get_bit_seg(self.info0, 9, 9 + (VALEN - 12) - 1)
    V1 => get_bit_seg(self.info1, 0, 0)
    D1 => get_bit_seg(self.info1, 1, 1)
    NR1 => get_bit_seg(self.info1, 2, 2)
    NX1 => get_bit_seg(self.info1, 3, 3)
    MAT1 => get_bit_seg(self.info1, 4, 5)
    PLV1 => get_bit_seg(self.info1, 6, 7)
    RPLV1 => get_bit_seg(self.info1, 8, 8)
    PPN1 => get_bit_seg(self.info1, 9, 9 + (VALEN - 12) - 1)
  }
}

///|
pub fn TLB_Entry::set_field(
  self : TLB_Entry,
  field : TLB_Entry_Field,
  value : UInt64,
) -> TLB_Entry {
  match field {
    E => {
      let comp = set_bit_seg(self.comp, 0, 0, value)
      { comp, info0: self.info0, info1: self.info1 }
    }
    ASID => {
      let comp = set_bit_seg(self.comp, 1, 10, value)
      { comp, info0: self.info0, info1: self.info1 }
    }
    G => {
      let comp = set_bit_seg(self.comp, 11, 11, value)
      { comp, info0: self.info0, info1: self.info1 }
    }
    PS => {
      let comp = set_bit_seg(self.comp, 12, 17, value)
      { comp, info0: self.info0, info1: self.info1 }
    }
    VPPN => {
      let comp = set_bit_seg(self.comp, 18, 18 + (VALEN - 13) - 1, value)
      { comp, info0: self.info0, info1: self.info1 }
    }
    V0 => {
      let info0 = set_bit_seg(self.info0, 0, 0, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    D0 => {
      let info0 = set_bit_seg(self.info0, 1, 1, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    NR0 => {
      let info0 = set_bit_seg(self.info0, 2, 2, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    NX0 => {
      let info0 = set_bit_seg(self.info0, 3, 3, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    MAT0 => {
      let info0 = set_bit_seg(self.info0, 4, 5, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    PLV0 => {
      let info0 = set_bit_seg(self.info0, 6, 7, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    RPLV0 => {
      let info0 = set_bit_seg(self.info0, 8, 8, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    PPN0 => {
      let info0 = set_bit_seg(self.info0, 9, 9 + (VALEN - 12) - 1, value)
      { comp: self.comp, info0, info1: self.info1 }
    }
    V1 => {
      let info1 = set_bit_seg(self.info1, 0, 0, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
    D1 => {
      let info1 = set_bit_seg(self.info1, 1, 1, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
    NR1 => {
      let info1 = set_bit_seg(self.info1, 2, 2, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
    NX1 => {
      let info1 = set_bit_seg(self.info1, 3, 3, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
    MAT1 => {
      let info1 = set_bit_seg(self.info1, 4, 5, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
    PLV1 => {
      let info1 = set_bit_seg(self.info1, 6, 7, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
    RPLV1 => {
      let info1 = set_bit_seg(self.info1, 8, 8, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
    PPN1 => {
      let info1 = set_bit_seg(self.info1, 9, 9 + (VALEN - 12) - 1, value)
      { comp: self.comp, info0: self.info0, info1 }
    }
  }
}

///|
struct Page_Entry {
  info : UInt64
}

///|
pub fn Page_Entry::make_page_entry() -> Page_Entry {
  { info: 0 }
}

///|
struct MMU {
  stlb : FixedArray[FixedArray[TLB_Entry]]
  mtlb : FixedArray[TLB_Entry]
}

///|
pub fn MMU::make_mmu() -> MMU {
  {
    stlb: FixedArray::make(
      STLB_WAYS,
      FixedArray::make(2 << STLB_INDEX, TLB_Entry::make_tlb_entry()),
    ),
    mtlb: FixedArray::make(MTLB_ENTREIS, TLB_Entry::make_tlb_entry()),
  }
}

///|
const STLB_WAYS : Int = 8

///|
const STLB_INDEX : Int = 8

///|
const MTLB_ENTREIS : Int = 1024

///|
enum AccessType {
  Load
  Store
  Fetch
} derive(Eq)

///|
suberror AddressTranslateError {
  TLBMultiplyHit(String, UInt64)
  UnknownPageTableLevel(String, Int)
}

///|
pub fn CPU::translate_vaddr(
  self : CPU,
  vaddr : UInt64,
  acc_type : AccessType,
) -> UInt64 raise {
  let plv = self.csr.get_csr_field(CRMD(PLV))
  let vaddr = if get_bit_seg(
      self.csr.get_csr_by_type(MISC),
      plv.to_int(),
      plv.to_int(),
    ) ==
    1 {
    zero_extend(get_bit_seg(vaddr, 0, 31), 32, 64)
  } else {
    vaddr
  }
  let rdva = self.csr.get_csr_field(RVACFG(RBits))
  if self.csr.get_csr_field(CRMD(DA)) == 1 &&
    self.csr.get_csr_field(CRMD(PG)) == 0 {
    return get_bit_seg(vaddr, 0, PALEN - 1)
  } else if self.direct_address_map(
      get_bit_seg(vaddr, 0, VALEN - rdva.to_int() - 1),
      acc_type,
    )
    is Some(add) {
    return add
  }
  while true {
    if self.address_tlb_hit(
        get_bit_seg(vaddr, 0, VALEN - rdva.to_int() - 1),
        acc_type,
      )
      is Some(add) {
      return add
    }
    let _TLBRERA = self.csr.get_csr_by_type(TLBRERA)
    let _TLBRBADV = self.csr.get_csr_by_type(TLBRBADV)
    let _TLBREHI = self.csr.get_csr_by_type(TLBREHI)
    let _TLBRELO0 = self.csr.get_csr_by_type(TLBRELO0)
    let _TLBRELO1 = self.csr.get_csr_by_type(TLBRELO1)
    self.csr.set_csr_field(TLBRERA(IsTLBR), 1)
    self.csr.set_csr_field(TLBRERA(PC), self.pc)
    self.csr.set_csr_field(TLBRBADV(VAddr), vaddr)
    self.csr.set_csr_field(TLBREHI(VPPN), get_bit_seg(vaddr, 13, VALEN - 1))
    let mut base = if get_bit_seg(vaddr, 63, 63) == 0 {
      self.csr.get_csr_field(PGDL(Base))
    } else {
      self.csr.get_csr_field(PGDH(Base))
    }
    for level = 4; level >= 1; level = level - 1 {
      if self.get_dir_width(level) is None {
        continue
      }
      base = self.load_dir(base, level)
    }
    let (p0, pte_addr0) = self.load_pte(base, false)
    let (p1, pte_addr1) = self.load_pte(base, true)
    self.csr.set_csr_by_type(TLBRELO0, set_bit_seg(p0, 7, 11, 0))
    self.csr.set_csr_by_type(TLBRELO1, set_bit_seg(p1, 7, 11, 0))
    let tlb_ps = self.csr.get_csr_field(STLBPS(PS))
    // This is ugly
    // Fix it pls
    if ((vaddr << tlb_ps.to_int()) & 1) == 0 {
      let p = get_bit_seg(p0, 7, 7)
      let w = get_bit_seg(p0, 8, 8)
      self.csr.set_csr_field(TLBELO0(V), p)
      let mut pte = self.bus.load(pte_addr0.to_uint())
      if acc_type == Store && self.csr.get_csr_field(TLBELO0(D)) == 0 && w != 0 {
        pte = set_bit_seg(pte, 1, 1, 1)
        self.csr.set_csr_field(TLBELO0(D), 1)
      }
      if p != 0 && self.csr.get_csr_field(TLBELO0(V)) == 0 {
        self.csr.set_csr_field(TLBELO0(V), 1)
      }
      self.bus.store(pte_addr0.to_uint(), pte)
    } else {
      let p = get_bit_seg(p1, 7, 7)
      let w = get_bit_seg(p1, 8, 8)
      self.csr.set_csr_field(TLBELO1(V), p)
      let mut pte = self.bus.load(pte_addr1.to_uint())
      if acc_type == Store && self.csr.get_csr_field(TLBELO1(D)) == 0 && w != 0 {
        pte = set_bit_seg(pte, 1, 1, 1)
        self.csr.set_csr_field(TLBELO1(D), 1)
      }
      if p != 0 && self.csr.get_csr_field(TLBELO1(V)) == 0 {
        self.csr.set_csr_field(TLBELO1(V), 1)
      }
      self.bus.store(pte_addr1.to_uint(), pte)
    }
    self.fill_tlb()
    self.csr.set_csr_by_type(TLBRERA, _TLBRERA)
    self.csr.set_csr_by_type(TLBRBADV, _TLBRBADV)
    self.csr.set_csr_by_type(TLBREHI, _TLBREHI)
    self.csr.set_csr_by_type(TLBRELO0, _TLBRELO0)
    self.csr.set_csr_by_type(TLBRELO1, _TLBRELO1)
  }
  0
}

///|
pub fn CPU::fill_tlb(self : CPU) -> Unit raise {
  let addr = self.csr.get_csr_field(TLBREHI(VPPN)) << 13
  let page_size = self.csr.get_csr_field(TLBREHI(PS))
  let stlb_ps = self.csr.get_csr_field(STLBPS(PS))
  let random = @random.Rand::new()
  let mut way = 0
  let mut index = 0
  let mut tlb : TLB_Entry = if page_size == stlb_ps {
    way = random.int(limit=STLB_WAYS)
    index = get_bit_seg(
      addr,
      stlb_ps.to_int() + 1,
      stlb_ps.to_int() + STLB_INDEX,
    ).to_int()
    self.mmu.stlb[way][index]
  } else {
    index = random.int(limit=MTLB_ENTREIS)
    self.mmu.mtlb[index]
  }
  tlb = tlb.set_field(PS, self.csr.get_csr_field(TLBREHI(PS)))
  tlb = tlb.set_field(VPPN, self.csr.get_csr_field(TLBREHI(VPPN)))
  tlb = tlb.set_field(E, 1)
  tlb = tlb.set_field(ASID, self.csr.get_csr_field(ASID(ASID)))
  tlb = tlb.set_field(
    G,
    self.csr.get_csr_field(TLBELO0(G)) & self.csr.get_csr_field(TLBELO1(G)),
  )
  let res = {
    comp: tlb.comp,
    info0: self.csr.get_csr_by_type(TLBELO0),
    info1: self.csr.get_csr_by_type(TLBELO1),
  }
  if page_size == stlb_ps {
    self.mmu.stlb[way][index] = res
  } else {
    self.mmu.mtlb[index] = res
  }
}

///|
pub fn CPU::load_pte(
  self : CPU,
  base : UInt64,
  odd : Bool,
) -> (UInt64, UInt64) raise {
  let table_width = (self.csr.get_csr_field(PWCL(PTEWidth)) + 1) * 3
  let badaddr = self.csr.get_csr_field(TLBRBADV(VAddr))
  let pt_base = self.csr.get_csr_field(PWCL(PTbase))
  let pt_width = self.csr.get_csr_field(PWCL(PTwidth))
  let mut index = get_bit_seg(
    badaddr,
    pt_base.to_int(),
    pt_base.to_int() + pt_width.to_int() - 1,
  )
  index = index ^ (index & 1)
  let offset0 = index << table_width.to_int()
  let offset1 = (index + 1) << table_width.to_int()
  let addr = base | (if odd { offset1 } else { offset0 })
  (self.load(addr.to_uint()), addr)
}

///|
pub fn CPU::load_dir(self : CPU, base : UInt64, level : Int) -> UInt64 raise {
  let badaddr = self.csr.get_csr_field(TLBRBADV(VAddr))
  // 0 : 64 bits，1 : 128 bits，etc.
  let table_width = (self.csr.get_csr_field(PWCL(PTEWidth)) + 1) * 3
  guard self.get_dir_width(level) is Some(dir_width)
  guard self.get_dir_base(level) is Some(dir_base)
  let index = get_bit_seg(
    badaddr,
    dir_base.to_int(),
    dir_base.to_int() + dir_width.to_int() - 1,
  )
  let addr = base | (index << table_width.to_int())
  self.load(addr.to_uint())
}

///|
pub fn CPU::get_dir_width(self : CPU, level : Int) -> UInt64? raise {
  let width = match level {
    4 => self.csr.get_csr_field(PWCH(Dir4_width))
    3 => self.csr.get_csr_field(PWCH(Dir3_width))
    2 => self.csr.get_csr_field(PWCL(Dir2_width))
    1 => self.csr.get_csr_field(PWCL(Dir1_width))
    _ => raise UnknownPageTableLevel("Unknown Pagetable Level \{level}", level)
  }
  if width != 0 {
    Some(width)
  } else {
    None
  }
}

///|
pub fn CPU::get_dir_base(self : CPU, level : Int) -> UInt64? raise {
  let base = match level {
    4 => self.csr.get_csr_field(PWCH(Dir4_base))
    3 => self.csr.get_csr_field(PWCH(Dir3_base))
    2 => self.csr.get_csr_field(PWCL(Dir2_base))
    1 => self.csr.get_csr_field(PWCL(Dir1_base))
    _ => raise UnknownPageTableLevel("Unknown Pagetable Level \{level}", level)
  }
  if base != 0 {
    Some(base)
  } else {
    None
  }
}

///|
pub fn CPU::direct_address_map(
  self : CPU,
  vaddr : UInt64,
  acc_type : AccessType,
) -> UInt64? raise {
  let plv = self.csr.get_csr_field(CRMD(PLV))
  for i = 0; i < (if acc_type == Fetch { 2 } else { 4 }); i = i + 1 {
    let lv = get_bit_seg(
      self.csr.get_csr_by_type(DMWn(i)),
      plv.to_int(),
      plv.to_int(),
    )
    if plv == lv &&
      get_bit_seg(vaddr, 60, 63) == self.csr.get_csr_field(DMWn(i, VSEG)) {
      return Some(get_bit_seg(vaddr, 0, PALEN - 1))
    }
  } where {
    reasoning: "The first two windows can be used by fetch and load/store, the last two are for load/store only",
  }
  None
}

///|
pub fn CPU::address_tlb_hit(
  self : CPU,
  vaddr : UInt64,
  acc_type : AccessType,
) -> UInt64? raise {
  let plv = self.csr.get_csr_field(CRMD(PLV))
  let stlb_ps = self.csr.get_csr_field(STLBPS(PS))
  let asid = self.csr.get_csr_field(ASID(ASID))
  let mut stlb_hit = false
  let mut mtlb_hit = false
  let mut res : UInt64 = 0
  let mut found_v : UInt64 = 0
  let mut found_d : UInt64 = 0
  let mut found_nr : UInt64 = 0
  let mut found_nx : UInt64 = 0
  let mut found_mat : UInt64 = 0
  let mut found_plv : UInt64 = 0
  let mut found_rplv : UInt64 = 0
  let mut found_ppn : UInt64 = 0
  let mut found_ps : UInt64 = 0
  let stlb_index = get_bit_seg(
    vaddr,
    stlb_ps.to_int() + 1,
    stlb_ps.to_int() + STLB_INDEX,
  )
  // STLB
  for way = 0; way < STLB_WAYS; way = way + 1 {
    let entry = self.mmu.stlb[way][stlb_index.to_int()]
    if entry.get_field(E) == 1 &&
      (entry.get_field(G) == 1 || entry.get_field(ASID) == asid) &&
      get_bit_seg(entry.get_field(VPPN), stlb_ps.to_int() + 1, VALEN - 1) ==
      get_bit_seg(vaddr, stlb_ps.to_int() + 1, VALEN - 1) {
      if stlb_hit {
        raise TLBMultiplyHit(
          "Multiple STLB entries hit when translating virtual address \{vaddr}",
          vaddr,
        )
      }
      stlb_hit = true
      if get_bit_seg(vaddr, stlb_ps.to_int(), stlb_ps.to_int()) == 0 {
        found_v = entry.get_field(V0)
        found_d = entry.get_field(D0)
        found_nr = entry.get_field(NR0)
        found_nx = entry.get_field(NX0)
        found_mat = entry.get_field(MAT0)
        found_plv = entry.get_field(PLV0)
        found_rplv = entry.get_field(RPLV0)
        found_ppn = entry.get_field(PPN0)
        found_ps = entry.get_field(PS)
        res = entry.info0
      } else {
        found_v = entry.get_field(V1)
        found_d = entry.get_field(D1)
        found_nr = entry.get_field(NR1)
        found_nx = entry.get_field(NX1)
        found_mat = entry.get_field(MAT1)
        found_plv = entry.get_field(PLV1)
        found_rplv = entry.get_field(RPLV1)
        found_ppn = entry.get_field(PPN1)
        found_ps = entry.get_field(PS)
        res = entry.info1
      }
    }
  }
  // MTLB
  for i = 0; i < MTLB_ENTREIS; i = i + 1 {
    let entry = self.mmu.mtlb[i]
    if entry.get_field(E) == 1 &&
      (entry.get_field(G) == 1 || entry.get_field(ASID) == asid) &&
      get_bit_seg(
        entry.get_field(VPPN),
        entry.get_field(PS).to_int() + 1,
        VALEN - 1,
      ) ==
      get_bit_seg(vaddr, entry.get_field(PS).to_int() + 1, VALEN - 1) {
      if mtlb_hit {
        raise TLBMultiplyHit(
          "Multiple MTLB entries hit when translating virtual address \{vaddr}",
          vaddr,
        )
      }
      mtlb_hit = true
      if get_bit_seg(
          vaddr,
          entry.get_field(PS).to_int(),
          entry.get_field(PS).to_int(),
        ) ==
        0 {
        found_v = entry.get_field(V0)
        found_d = entry.get_field(D0)
        found_nr = entry.get_field(NR0)
        found_nx = entry.get_field(NX0)
        found_mat = entry.get_field(MAT0)
        found_plv = entry.get_field(PLV0)
        found_rplv = entry.get_field(RPLV0)
        found_ppn = entry.get_field(PPN0)
        found_ps = entry.get_field(PS)
        res = entry.info0
      } else {
        found_v = entry.get_field(V1)
        found_d = entry.get_field(D1)
        found_nr = entry.get_field(NR1)
        found_nx = entry.get_field(NX1)
        found_mat = entry.get_field(MAT1)
        found_plv = entry.get_field(PLV1)
        found_rplv = entry.get_field(RPLV1)
        found_ppn = entry.get_field(PPN1)
        found_ps = entry.get_field(PS)
        res = entry.info1
      }
    }
  }
  if stlb_hit && mtlb_hit {
    raise TLBMultiplyHit(
      "Multiple TLB entries hit when translating virtual address \{vaddr}",
      vaddr,
    )
  }
  if !stlb_hit && !mtlb_hit {
    // TODO TLB REFILL EXCEPTION
    return None
  }
  if found_v == 0 {
    let _ = match acc_type {
      Load =>
        {
        // TODO LOAD PAGE FAULT EXCEPTION
        }
      Store =>
        {
        // TODO STORE PAGE FAULT EXCEPTION
        }
      Fetch =>
        {
        // TODO INSTRUCTION PAGE FAULT EXCEPTION
        }
    }
    return None
  }
  if acc_type == Fetch && found_nx == 1 {
    // TODO INSTRUCTION PAGE FAULT EXCEPTION
    return None
  }
  if (found_rplv == 0 && plv > found_plv) ||
    (found_rplv == 1 && plv >= found_plv) {
    // TODO PRIVILEGE PAGE FAULT EXCEPTION 
    return None
  }
  if acc_type == Load && found_nr == 1 {
    // TODO LOAD PAGE FAULT EXCEPTION
    return None
  }
  if acc_type == Store &&
    found_d == 0 &&
    (
      plv == 3 ||
      get_bit_seg(
        self.csr.get_csr_by_type(MISC),
        16 + plv.to_int(),
        16 + plv.to_int(),
      ) ==
      0
    ) {
    // TODO STORE PAGE FAULT EXCEPTION
    return None
  }
  let paddr = (get_bit_seg(found_ppn, found_ps.to_int() - 12, PALEN - 13) << 12) |
    get_bit_seg(vaddr, 0, found_ps.to_int() - 1)
  Some(paddr)
}
