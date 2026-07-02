//Tablegen file for custom TRUSTGAURD instructions

//PUT takes no args and returns value gotten from the hardware
//It is implemented as RISCV custom instruction opcode CUSTOM0 with funct3 as 0b100

def GET_SENTRY :
  RVInstI<0b100, OPC_CUSTOM_0,
          (outs GPR:$rd),
          (ins GPR:$rs1, simm12_lsb00000:$imm12),
          "get_sentry $rd", "">,
  Sched<[]>{
    let rs1 = 0;
    let imm12 = 0;
    //let rd = 0;
}

//Pattern matching for GET_SENTRY
//Allows the DAG to match the intrinsic and lower to this new instruction
def : Pat<(int_riscv_get_sentry), (GET_SENTRY (XLenVT 0), 0)>;

