//EXIT_UNTRUSTED takes nno args and returns nothing
//It is implemented as a RISCV custom instruction opcode CUSTOM0 with funct3 as 0b001

def EXIT_UNTRUSTED :
  RVInstI<0b001, OPC_CUSTOM_0,
          (outs),
          (ins GPR:$rs1, simm12_lsb00000:$imm12),
          "exit_untrusted", "">,
  Sched<[]>{
    let rs1 = 0;
    let imm12 = 0;
    let rd = 0;
    let isBarrier = 1; //makes it a memory fence kind of thing, is this enough?
}

//Pattern matching for EXIT_UNTRUSTED
//Allowis the DAG to match the intrinsic and lower to instruction
def : Pat<(int_riscv_exit_untrusted), (EXIT_UNTRUSTED (XLenVT 0), 0)>;

