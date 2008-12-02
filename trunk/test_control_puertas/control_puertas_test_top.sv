`timescale 1ns/100ps
module CONTROL_PUERTAS_test_top;
  parameter simulation_cycle = 100;

  bit  SystemClock;
  control_puertas_io top_io(SystemClock);
  test t(top_io);
  
  CONTROL_PUERTAS dut(
    .clk (top_io.clk),
	.pisos	(top_io.pisos),
    .estado	(top_io.estado),
    .boton	(top_io.boton),
    .botones	(top_io.botones),
    .puertas	(top_io.puertas),
    .timeout	(top_io.timeout),
    .sensor	(top_io.sensor),
    .aviso	(top_io.aviso),
    .salida_puertas	(top_io.salida_puertas),
    .trabajando	(top_io.trabajando)
  );

  initial begin
	$timeformat(-9, 1, "ns", 10);
    SystemClock = 0;
    forever begin
      #(simulation_cycle/2)
        SystemClock = ~SystemClock;
    end
  end

endmodule
