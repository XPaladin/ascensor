/**
* El estado de los botones se codifica en un arreglo de la siguiente forma:
*	0: piso 1 arriba
*	1: piso 2 abajo
*	2: piso 2 arriba
*	3: piso 3 abajo
*	4: piso 3 arriba
* 	5: piso 4 abajo
*	6: piso 1 ascensor
*	7: piso 2 ascensor
* 	8: piso 3 ascensor
*	9: piso 4 ascensor
* Los estados se codifican de la siguiente manera:
*	0: bit 1 del piso actual
*	1: bit 2 del piso actual
*	2: direccion en la que va (1 arriba, 0 abajo)
*	3: si se esta moviendo o no (1 si, 0 no)
*/

/**
* Almacena el estado (apretado o no) de los 10 botones para solicitar pisos.
* @param botones Arreglo con 1 si es que un boton esta apretado.
* @param anterior El estado de los botones apretados en el estado anterior.
* @param final El estado de los botones para el estado actual.
* El arreglo de botones contiene la siguiente informacion:
*	0: piso 1 arriba
*	1: piso 2 abajo
*	2: piso 2 arriba
*	3: piso 3 abajo
*	4: piso 3 arriba
* 	5: piso 4 abajo
*	6: piso 1 ascensor
*	7: piso 2 ascensor
* 	8: piso 3 ascensor
*	9: piso 4 ascensor
*/
module registrador (botones, anterior, actual);
	input [9:0] botones, anterior;
	output [9:0] actual;

	reg [9:0] actual;

	always@(botones or anterior)
	begin
		actual = botones | anterior;
	end
endmodule

/**
* Prende y apaga las luces, y le envia el piso y direccion a los displays.
* @param solicitudes Solicitud de los pisos en el ciclo actual.
* @param estado El estado actual.
* @param luces El estado de las luces de todos los botones.
* @param display_num El numero de los displays.
* @param display_dir La direccion del ascensor:
*	~: nada
*	2: subiendo
*	3: bajando
*/
module interfaz_de_salida(solicitudes, estado, luces, display_num, display_dir);
	input [9:0] solicitudes;
	input [3:0] estado;
	output [9:0] luces;
	output [1:0] display_num, display_dir;

	reg [9:0] luces;
	reg [1:0] display_num, display_dir;

	always@(solicitudes or estado)
	begin
		luces = solicitudes;
		display_num[0] = estado[0];
		display_num[1] = estado[1];
		if (~|solicitudes && !estado[3])
			display_dir[0] = 0;
		else
			display_dir[0] = 1;
		display_dir[1] = estado[2];
	end
endmodule

/**
* Abre las puertas si es que le corresponde, es decir, estoy en un piso solicitado y el ascensor no
* se esta moviendo, y envia un aviso para emitir un sonido en el piso en que corresponda.
* @param solicitudes Solicitud de los pisos en el ciclo actual.
* @param estado El estado actual.
* @param boton_abrir_cerrar Si se esta presionando el boton para abrir o cerrar o ninguno.
* @param puertas 0 si es que estan cerradas, 1 abiertas, 2 abriendose y 3 cerrandose.
* @param timeout 1 si es que se genero un timeout con las puertas abiertas.
* @param sensor Si hay algo entre las puertas o no.
* @param trabajando Si es que el control de puertas esta trabajando o no.
* @param salida_puertas Abrir o cerrar las puertas o hacer nada.
*/
module control_de_puertas(solicitudes, estado, boton_abrir_cerrar, sensor, puertas, timeout, trabajando, aviso, salida_puertas);
	input [9:0] solicitudes;
	input [3:0] estado;
	input [1:0] boton_abrir_cerrar;
	input [1:0] puertas;
	input timeout;
	input sensor;
	output trabajando;
	output [3:0] aviso;
	output [1:0] salida_puertas;

	reg trabajando;
	reg [3:0] aviso;
	reg [1:0] salida_puertas;

	always@(solicitudes or estado or boton_abrir_cerrar or sensor or puertas)
	begin
		if ((puertas[0] || puertas[1]) || !estado[3] && PISO_SOLICITADO(solicitudes, estado))
		begin
			trabajando = 1;
			if (puertas == 2'b00)
			begin
				if (estado == 4'b00xx) aviso = 4'b1000;
				else if (estado == 4'b01xx) aviso = 4'b0100;
				else if (estado == 4'b10xx) aviso = 4'b0010;
				else aviso = 4'b0001;
			end
			if (puertas == 2'b00 || puertas == 2'b10 || (puertas == 2'b11 && boton_abrir_cerrar == 2'b1x)) salida_puertas = 2'b01;
			else if (puertas == 2'b01 && (boton_abrir_cerrar == 2'bx1 || timeout)) salida_puertas = 2'b10;
			else salida_puertas = 2'b00;
		end
		else
		begin
			trabajando = 0;
		end
	end

	function PISO_SOLICITADO;
		input [9:0] s;
		input [3:0] e;

		begin
			PISO_SOLICITADO = (
				(!e[0] && !e[1]) && (s[6] || s[0]) ||
				(!e[0] && e[1]) && (s[7] || (s[1] && !e[2]) || (s[2] && e[2])) ||
				(e[0] && !e[1]) && (s[8] || (s[3] && !e[2]) || (s[4] && e[2])) ||
				(e[0] && e[1]) && (s[9] || s[5])
			);
		end
	endfunction
endmodule

module timeout_puertas(puertas, salida);
	input [1:0] puertas;
	output salida;

	reg salida;

	always@(puertas)
	begin
		if (puertas == 2'b01)
		begin
			#100 // ojala que salga de aca cuando cambian las puertas
			salida = 1;
		end
		else
			salida = 0;
	end
endmodule

/**

module A1(a1, b1)
	...
endmodule

module top(a, b)
	A1 nombre(.a1(a), .b1(b))
endmodule
*/
