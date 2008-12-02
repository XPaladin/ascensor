program automatic test(top_io.TB top);
	initial begin
		$vcdpluson;
		reset();
	end
	task reset();
		// Estado inicial: piso 1 sin solicitudes, puertas cerradas
		top.reset=1;
		top.botones<=0;
		top.boton_puertas<=0;
		top.estado_puertas<=0;
		top.cambio_piso<=0;
		top.sensor_puertas<=0;
		#200
		top.reset=0;

		// Boton 1 desde fuera
		#150
		top.botones<=10'b0000000001;

		// Suelta el boton
		// y se abren las puertas
		#200
		top.botones<=10'b0000000000;
		top.estado_puertas<=2'b11;
		
		// Puertas abiertas
		#500
		top.estado_puertas<=2'b01;
		
		// Boton 4 desde dentro
		#150
		top.botones<=10'b1000000000;
		
		// Suelta el boton
		#150
		top.botones<=10'b0000000000;

		// Puertas cerrandose
		#1000
		top.estado_puertas<=2'b10;

		// Puertas cerradas
		#500
		top.estado_puertas<=2'b00;

		// Cambio de piso (al 2)
		#2000
		top.cambio_piso<=1;
		
		// Apretan piso 3 hacia abajo
		top.botones[3]<=1;
		#150
		
		// Suelta el boton
		top.botones<=0;
		
		// Cambio de piso (al 3)
		#2000
		top.cambio_piso<=0;
		
		#400	
		// Apretan boton abrir puertas
		top.boton_puertas<=2'b01;
		#200

		// Suelta el boton
		top.boton_puertas<=0;

		// Cambio de piso (al 4)
		#1400
		top.cambio_piso<=1;
		
		// Se abren las puertas
		#50
		top.estado_puertas<=2'b11;
		
		// Puertas abiertas
		#500
		top.estado_puertas<=2'b01; 	
		
		// Puertas cerrandose
		#1100
		top.estado_puertas<=2'b10;

		// Puertas cerradas
		#500
		top.estado_puertas<=0;
		
		// Cambio de piso (al 3)
		#2000
		top.cambio_piso<=0;

		// Se abren las puertas
		#150
		top.estado_puertas<=2'b11;
		
		// Puertas abiertas
		#500
		top.estado_puertas<=2'b01; 	
		
		// Puertas cerrandose
		#1100
		top.estado_puertas<=2'b10;

		// Aprietan el boton 1 desde dentro
		top.botones[6]<=1;
		#150
		// Suelta el boton
		top.botones<=0;
		
		//Alguien se interpone
		top.sensor_puertas<=1;
		#150
		
		// Puertas abriendose
		top.estado_puertas<=2'b11;
		
		// Aprieta piso 2 (desde dentro)
		top.botones[7]<=1;
		#150
		
		// Suelta el boton
		top.botones=0;
		
		// Puertas abiertas
		#500
		top.estado_puertas<=2'b01;
		
		// Puertas cerrandose
		#1100
		top.estado_puertas<=2'b10;
		
		// Puertas cerradas
		#500
		top.estado_puertas<=0;

	endtask
endprogram
