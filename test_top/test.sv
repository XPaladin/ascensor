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

		// Aprietan el boton 2 desde dentro
		top.botones[7]<=1;
		#150
		// Suelta el boton
		top.botones<=0;
		
		//Alguien se interpone
		top.sensor_puertas<=1;
		#150
		
		// Puertas abriendose
		top.estado_puertas<=2'b11;

		//Entra (deja de interponerse)
		top.sensor_puertas<=0;
		#50	
		// Aprieta piso 4 (desde dentro)
		top.botones[9]<=1;
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
		
		// Cambio piso (al 2)
		#2000
		top.cambio_piso=~top.cambio_piso;
		
		// Se abren las puertas
		#100
		top.estado_puertas<=2'b11;
	
		// Puertas abiertas
		#500
		top.estado_puertas<=2'b01;

		// Aprieta cerrar puertas
		#100
		top.boton_puertas<=2'b10;
		
		// Puertas cerrandose
		#150
		top.estado_puertas<=2'b10;
		
		// Suelta boton
		#200
		top.boton_puertas<=0;

		// Apretar abrir puertas
		#100
		top.boton_puertas<=2'b01;
		
		// Se abren las puertas
		#100
		top.estado_puertas<=2'b11;

		// Suelta el boton
		#100
		top.boton_puertas<=0;
		
		// Puertas abiertas
		#500
		top.estado_puertas<=2'b01;

		// Timeout
		#1100
		
		//Puertas cerrandose
		top.estado_puertas<=2'b10;

		//Puertas cerradas
		#500
		top.estado_puertas<=0;

		//Cambio de piso (2 veces)
		#1000
		top.cambio_piso=~top.cambio_piso;
		#1000
		top.cambio_piso=~top.cambio_piso;
		
		//Puertas se empiezan a abrir
		#150
		top.estado_puertas<=2'b11;
		//Puertas completamente abiertas
		#500
		top.estado_puertas<=2'b01;
		#1100
		top.estado_puertas<=2'b10;
		#500
		top.estado_puertas<=0;
	endtask
endprogram
