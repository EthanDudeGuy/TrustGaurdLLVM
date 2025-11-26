//Tablegen file for custom TRUSTGAURD instructions

//ENTER_UNTRUSTED takes no args and returns nothing
//It is implemented as RISCV custom instruction CUSTOM0
//TODO: clean it up so It is truley modeled as a zero operand instruction instead of faking it
def ENTER_UNTRUSTED :
  RVInstI<0b010, OPC_CUSTOM_0,
          (outs),
          (ins GPR:$rs1, simm12_lsb00000:$imm12),
          "enter_untrusted", "">,
  Sched<[]>{
    let rs1 = 0;
    let imm12 = 0;
    let rd = 0;
    let isBarrier = 1;
}


//Pattern matching for ENTER_UNTRUSTED
//Allows the DAG to match the intrinsic and lower to this new instruction
def : Pat<(int_riscv_enter_untrusted), (ENTER_UNTRUSTED (XLenVT 0), 0)>;


