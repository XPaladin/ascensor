interface registro_estado_io(input bit clk);
  logic [3:0]	D;
  logic [3:0]	Q;

  clocking cb @ (posedge clk);
    output D;
    input Q;
  endclocking

  modport TB(clocking cb, output D);
endinterface
