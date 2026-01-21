//Tablegen file for custom TRUSTGAURD instructions

//ALERT takes no args and returns nothing
//It is implemented as RISCV custom instruction opcode CUSTOM0 with funct3 as 0b101

def ALERT_SENTRY :
  RVInstI<0b101, OPC_CUSTOM_0,
          (outs),
          (ins GPR:$rs1, simm12_lsb00000:$imm12),
          "alert_sentry", "">,
  Sched<[]>{
    let rs1 = 0;
    let imm12 = 0;
    let rd = 0;
    let isBarrier = 1; //makes it a memory fence kind of thing, is this enough?
}

//Pattern matching for ALERT_SENTRY
//Allows the DAG to match the intrinsic and lower to this new instruction
def : Pat<(int_riscv_alert_sentry), (ALERT_SENTRY (XLenVT 0), 0)>;



