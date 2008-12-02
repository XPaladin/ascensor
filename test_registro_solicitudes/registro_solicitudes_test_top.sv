`timescale 1ns/100ps
module REGISTRO_SOLICITUDES_test_top;
  parameter simulation_cycle = 100;

  bit  SystemClock;

  registro_solicitudes_io top_io(SystemClock);
  test t(top_io);

  REGISTRO_SOLICITUDES dut(
    .D		(top_io.D),
    .clk	(top_io.clk),
    .Q		(top_io.Q)
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
