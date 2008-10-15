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