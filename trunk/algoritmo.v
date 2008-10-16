/**
 * Es la maquina de estados con el algoritmo de atencion a solicitudes.
 *
 * El algoritmo va dando instrucciones a los distintos componentes para ir
 * atendiendo a los pisos solicitados. Actualiza el estado de la maquina de
 * estados y el estado de los botones solicitados (desactibando los
 * atendidos).
 *
 * @param in:s					  El estado de las solicitudes de los pisos.
 * @param in:estado_inicial       El estado actual del ascensor.
 * @param in:cambio_piso          Si hubo un cambio de piso.
 * @param in:esperar              Si hay que esperar porque las puertas estan abiertas.
 * @param in:clk                  El reloj.
 * @param out:estado_final        El estado del ascensor luego de ejecutar el algoritmo.
 * @param out:motor               La instruccion al motor.
 */
module ALGORITMO (s, estado_inicial, cambio_piso, esperar, clk, estado_final, motor);
	input [9:0] s;
	input [3:0] estado_inicial;
	input cambio_piso;
	input esperar;
	input clk;
	output [3:0] estado_final;
	output [1:0] motor;
	
	reg piso_actual;
	
	always@(posedge clk)
	begin
		piso_actual=estado_inicial[1];
		if(!esperar)
		begin
			if(!estado_inicial[3])//quieto
			begin
				if(e[1])//subiendo
				begin
					case (estado_inicial[1:0])//piso
						2'b00://piso 1
						begin
							if( |s[5:1] || |s[7:9])//algun piso que no sea el 1 solicitado
								motor=2'b10;//sube
						end
						2'b01://piso 2
						begin
							if( |s[5:3] || |s[8:9])//solicitudes mas arriba
								motor=2'b10; //sube
							else
								if( s[0] || s[6]) //solicitudes piso 1
								begin
									motor=2'b01;//baja
									estado_final[2]=0;//bajando
								end
						end
						2'b10://piso 3
						begin
							if( s[5] || s[9]) //piso 4 solicitado
								motor=2'b10;
							else
								if( |s[2:0] || |s[7:6] )
								begin
									motor=2'b01;//baja
									estado_final[2]=0;//bajando
								end
						end
						2'b11://piso 4
						begin
							if( |s[4:0] || |s[8:6] )
							begin
								motor=2'b01;//baja
								estado_final[2]=0;//bajando
							end
						end
				end
			end
			else //moviendose
			begin
				if(piso_actual != cambio_piso)//cambio de piso
				begin
					if(estado_inicial[2])//subiendo
						estado_final[1:0]=estado_inicial[1:0]+1;
					else
						estado_final[1:0]=estado_inicial[1:0]-1;
					if(PISO_SOLICITADO(s,estado_inicial)
					begin
						motor = 2'b00 //detener motor
						estado_final[3] = 0;
					end
				end
			end
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
