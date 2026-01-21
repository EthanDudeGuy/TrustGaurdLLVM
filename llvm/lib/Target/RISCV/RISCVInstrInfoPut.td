//Tablegen file for custom TRUSTGAURD instructions

//PUT takes no args and returns nothing
//It is implemented as RISCV custom instruction opcode CUSTOM0 with funct3 as 0b011

def PUT_SENTRY :
  RVInstI<0b011, OPC_CUSTOM_0,
          (outs),
          (ins GPR:$rs1, simm12_lsb00000:$imm12),
          "put_sentry $rs1", "">,
  Sched<[]>{
    let imm12 = 0;
    let rd = 0;
}

//Pattern matching for ENTER_UNTRUSTED
//Allows the DAG to match the intrinsic and lower to this new instruction
def : Pat<(int_riscv_put_sentry XLenVT:$val), (PUT_SENTRY GPR:$val, 0)>;

