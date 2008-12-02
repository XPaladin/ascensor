interface registro_solicitudes_io(input bit clk);
  logic [9:0]	D;
  logic [9:0]	Q;

  clocking cb @ (posedge clk);
    output D;
    input Q;
  endclocking

  modport TB(clocking cb, output D);
endinterface
