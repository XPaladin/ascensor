`timescale 1ns/100ps
module APAGADOR_SOLICITUDES_test_top;
  parameter simulation_cycle = 100;

  bit  SystemClock;

  apagador_solicitudes_io top_io(SystemClock);
  test t(top_io);

  APAGADOR_SOLICITUDES dut(
    .o	(top_io.o),
    .e	(top_io.e),
    .t	(top_io.t),
    .s	(top_io.s),
	.clk (top_io.clk)
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
