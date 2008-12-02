program automatic test(apagador_solicitudes_io.TB apagador_solicitudes);
	initial begin
		$vcdpluson;
		reset();
	end
	task reset();
		apagador_solicitudes.o <= 10'b0010000110;
		//alguien afuera apreto arriba y abajo en piso 2 y alguien dentro apreto piso 2
		apagador_solicitudes.e<= 4'b0001;
		//estamos detenidos en el piso 2, bajando
		apagador_solicitudes.t <= 1'b0;
		//no hemos empezado a trabajar
		#1000
		apagador_solicitudes.t <= 1;
		#1000
		apagador_solicitudes.o <= 10'b1111111111;
		//todos los botones apretados
		apagador_solicitudes.e<= 4'b0011;
		//piso 4
		apagador_solicitudes.t <= 1'b0;
		//no hemos empezado a trabajar
		#1000
		apagador_solicitudes.t <= 1;
		repeat(5000) @(apagador_solicitudes.cb);
	endtask
endprogram
