program automatic test(registro_estado_io.TB registro_estado);
	initial begin
		$vcdpluson;
		reset();
	end
	task reset();
		registro_estado.D <= 3'b000;
		#200
		registro_estado.D <= 3'b001;
		#200
		registro_estado.D <= 3'b100;
		#200
		registro_estado.D <= 3'b111;
		#200
		registro_estado.D <= 3'b000;
		registro_estado.D <= 3'b111;
	endtask
endprogram
