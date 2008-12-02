program automatic test(registro_solicitudes_io.TB registro_solicitudes);
	initial begin
		$vcdpluson;
		reset();
	end
	task reset();
		registro_solicitudes.D = 10'b000000000;
		#200
		registro_solicitudes.D = 10'b000001000;
		#100
		registro_solicitudes.D = 10'b001001000;
		#50
		registro_solicitudes.D = 10'b010101010;
		#10
		registro_solicitudes.D = 10'b111111111;
	endtask
endprogram
