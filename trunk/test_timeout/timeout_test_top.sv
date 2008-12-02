`timescale 1ns/100ps
module TIMEOUT_test_top;
  parameter simulation_cycle = 100;

  bit  SystemClock;

  timeout_io top_io(SystemClock);
  test t(top_io);

  TIMEOUT dut(
    .estado	(top_io.estado),
    .clk (top_io.clock),
	.timeout	(top_io.timeout),
	.count   (top_io.count)
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
