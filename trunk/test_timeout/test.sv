program automatic test(timeout_io.TB timeout);
	initial begin
		$vcdpluson;
		reset();
	end
	task reset();
		timeout.estado <= 2'b00;
		#900
		timeout.estado <= 2'b01;
		#900
		timeout.estado <= 2'b00;
		#500
		timeout.estado <= 2'b01;
		#1000
		timeout.estado <= 2'b00;
		repeat(4000) @(timeout.cb);
	endtask
endprogram
