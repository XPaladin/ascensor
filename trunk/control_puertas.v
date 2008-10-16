/**
* Abre las puertas si es que le corresponde, es decir, estoy en un piso solicitado y el ascensor no
* se esta moviendo, y envia un aviso para emitir un sonido en el piso en que corresponda.
*
* @param in:pisos            Solicitud de los pisos en el ciclo actual.
* @param in:estado           El estado actual del ascensor.
* @param in:boton            Si se esta presionando el boton para abrir o cerrar o ninguno.
* 								-01 abrir
* 								-10 cerrar
* 								-00 nada
* @param in:puertas          El estado de las puertas:
* 								-00 completamente cerradas
* 								-01 completamente abiertas
* 								-10 puertas cerrandose
* 								-11 puertas abriendose
* @param in:timeout          Si es que se genero un timeout con las puertas abiertas.
* @param in:sensor           Si hay algo entre las puertas o no.
* 								-1 sensado
* 								-0 nada
* @param out:aviso           Aviso al piso sonoro al piso adecuado.
* @param out:salida_puertas  Abrir o cerrar las puertas o hacer nada.
* 								-01 abrir
* 								-10 cerrar
* 								-00 nada
* @param out:trabajando      Si es que el control de puertas esta trabajando o no.
*/
module CONTROL_PUERTAS (pisos, estado, boton, puertas, timeout, sensor, aviso, salida_puertas, trabajando);
	input [9:0] pisos;
	input [3:0] estado;
	input [1:0] boton;
	input [1:0] puertas;
	input timeout;
	input sensor;
	output [3:0] aviso;
	output [1:0] salida_puertas;
	output trabajando;

	reg trabajando;
	reg [3:0] aviso;
	reg [1:0] salida_puertas;
:
	always@(pisos or estado or boton or sensor or puertas or timeout)
	begin
		if ((puertas[0] || puertas[1]) || (!estado[3] && PISO_SOLICITADO(pisos, estado)))
		// puertas abiertas o (no moviendose y este es un piso solicitado) 
		begin
			trabajando = 1;
			if (puertas == 2'b00)//puertas cerradas
			begin
				if (estado[3:2] == 2'b00) aviso = 4'b1000; //piso 1
				else if (estado[3:2] == 2'b01) aviso = 4'b0100; // piso 2
				else if (estado[3:2] == 2'b10) aviso = 4'b0010; // piso 3
				else aviso = 4'b0001; //piso 4
			end
			if (puertas == 2'b00 || puertas == 2'b11 || (puertas == 2'b10 && (boton == 2'b01 || sensor))) 
			//puertas cerradas o abriendose || (cerrandose && (boton abrir || sensor))
				salida_puertas = 2'b01; //abrir puertas
			else if ((puertas == 2'b01 && (boton == 2'b10 || timeout)) || puertas== 2'b10)
			//puertas (abiertas && (boton cerrar || timeout)) || puertas cerrandose 
				salida_puertas = 2'b10; //cerrar puertas
			else salida_puertas = 2'b00; //hacer nada
		end
		else //puertas cerradas && (moviendose || piso no solicitado)
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
				//piso 1 && (dentro o fuera llaman)
				(!e[0] && e[1]) && (s[7] || (s[1] && !e[2]) || (s[2] && e[2])) ||
				//piso 2 && (dentro o (hacia abajo y bajando) o (hacia arriba y subiendo))
				(e[0] && !e[1]) && (s[8] || (s[3] && !e[2]) || (s[4] && e[2])) ||
				//piso 3 && (dentro o (abajo y bajando) o (arriba y subiendo))
				(e[0] && e[1]) && (s[9] || s[5])
				//piso 4 && (dentro o bajando)
			);
		end
	endfunction
endmodule
