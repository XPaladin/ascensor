interface registrador_io(input bit clk);
  logic [9:0]	botones;
  logic [9:0]	solicitudes_inicial;
  logic [9:0]	solicitudes_final;

  clocking cb @ (posedge clk);
    output botones;
	output solicitudes_inicial;
	input solicitudes_final;
  endclocking

  modport TB(clocking cb, output botones, output solicitudes_inicial);

endinterface
