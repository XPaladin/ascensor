program automatic test(control_puertas_io.TB control_puertas);
	initial begin
		$vcdpluson;
		reset();
	end
	task reset();
		
		control_puertas.estado<=4'b0110;//piso 3 subiendo (detenido)
		control_puertas.botones<=0;
		control_puertas.pisos<=10'b1000000000;//4 piso desde dentro
		control_puertas.boton<=0;
		control_puertas.puertas<=0;
		control_puertas.sensor<=0;		
		control_puertas.timeout<=0;
		#100
		control_puertas.estado<=4'b0111;//piso 4 detenido
		#210
		control_puertas.pisos<=10'b0000000000;//4 piso desde dentro
		control_puertas.puertas<=2'b11;
		#200
		control_puertas.puertas<=2'b01;
		#200
		control_puertas.timeout<=1;
		#110
		control_puertas.puertas<=2'b10;
		control_puertas.timeout<=0;
		#100
		control_puertas.sensor<=1;
		#110
		control_puertas.puertas<=2'b11;
		#100
		control_puertas.sensor<=0;
		#100
		control_puertas.puertas<=2'b01;
		#100
		control_puertas.boton<=2'b10; //cerrar puertas
		control_puertas.sensor<=1;
		#100
		control_puertas.puertas<=2'b10;
		#200
		control_puertas.sensor<=0;
		#100
		control_puertas.botones<=10'b0000100000; //piso 4 desde fuera 
		#100
		control_puertas.botones<=0; 
		#100
		control_puertas.boton<=2'b00;
		repeat(5000) @(control_puertas.cb);
	endtask
endprogram
