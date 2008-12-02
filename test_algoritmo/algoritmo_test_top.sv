`timescale 1ns/100ps
module ALGORITMO_test_top;
  parameter simulation_cycle = 100;

  bit  SystemClock;
  algoritmo_io top_io(SystemClock);

  test t(top_io);

  ALGORITMO dut(
    .s	(s),
    .estado_inicial	(top_io.estado_inicial),
    .cambio_piso	(top_io.cambio_piso),
    .esperar	(top_io.esperar),
    .clk	(top_io.clk),
    .estado_final	(top_io.estado_final)
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
