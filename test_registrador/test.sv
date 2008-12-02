program automatic test(registrador_io.TB registrador);
	initial begin
		$vcdpluson;
		reset();
	end
	task reset();
		registrador.botones <= 10'b0000100000;
		registrador.solicitudes_inicial <= 10'b1000000001;
		#2
		registrador.botones <= 10'b0101101001;
		registrador.solicitudes_inicial <= 10'b1010010110;
	endtask
endprogram
