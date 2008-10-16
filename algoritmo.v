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
 */
module ALGORITMO (s, estado_inicial, cambio_piso, esperar, clk, estado_final);
	input [9:0] s;
	input [3:0] estado_inicial;
	input cambio_piso;
	input esperar;
	input clk;
	output [3:0] estado_final;
	
	reg [3:0] estado_final;
	reg piso_actual;

	always@(posedge clk)
	begin
		estado_final=estado_inicial;
		piso_actual=estado_inicial[1];
		if(!esperar)
		begin
			if(!estado_inicial[3])//quieto
			begin
				if(estado_inicial[1])//subiendo
				begin
					case (estado_inicial[1:0])//piso
						2'b00://piso 1
						begin
							if( |s[5:1] || |s[9:7])//algun piso que no sea el 1 solicitado
								estado_final[3]=1;//muevete
						end
						2'b01://piso 2
						begin
							if( |s[5:3] || |s[8:9])//solicitudes mas arriba
								estado_final[3]=1;//muevete
							else
								if( s[0] || s[6]) //solicitudes piso 1
								begin
									estado_final[3]=1;//muevete
									estado_final[2]=0;//bajando
								end
						end
						2'b10://piso 3
						begin  
							if( s[5] || s[9]) //piso 4 solicitado
								estado_final[3]=1;//muevete
							else
								if( |s[2:0] || |s[7:6] )//pisos abajo solicitados
								begin
									estado_final[3]=1;//muevete
									estado_final[2]=0;//bajando
								end
						end
						2'b11://piso 4
						begin
							if( |s[4:0] || |s[8:6] )//solicitudes abajo
							begin
								estado_final[3]=1;//muevete
								estado_final[2]=0;//bajando
							end
						end
					endcase
				end
				else//bajando
				begin
					case (estado_inicial[1:0])//piso
						2'b00://piso 1
						begin
							if( |s[5:1] || |s[9:7])//algun piso que no sea el 1 solicitado
							begin
								estado_final[3]=1; //muevete
								estado_final[2]=1; //subiendo
							end
						end
						2'b01://piso 2
						begin
							if( s[0] || s[6]) //solicitudes piso 1
							begin
								estado_final[3]=1;//muevete
							end
							else
								if( |s[5:3] || |s[8:9])//solicitudes mas arriba
								begin
									estado_final[3]=1;//muevete
									estado_final[2]=1;//subiendo
								end
						end
						2'b10://piso 3
						begin
							if( |s[2:0] || |s[7:6] )
								estado_final[3]=1;//muevete
							else
								if( s[5] || s[9]) //piso 4 solicitado
								begin
									estado_final[2]=1;//subiendo
									estado_final[3]=1;//muevete
								end
						end
						2'b11://piso 4
						begin
							if( |s[4:0] || |s[8:6] )
							begin
								estado_final[3]=1;//muevete
								estado_final[2]=0;//bajando
							end
						end
					endcase
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
					if(PISO_SOLICITADO(s,estado_inicial))
					begin
						estado_final[3] = 0;//detente
					end
				end
			end
		end
	end

	function PISO_SOLICITADO;
		input [9:0] o;
		input [3:0] e;

		begin
			PISO_SOLICITADO = (
				(!e[0] && !e[1]) && (o[6] || o[0]) ||
				//piso 1 && (dentro o fuera llaman)
				(!e[0] && e[1]) && (o[7] || (o[1] && !e[2]) || (o[2] && e[2])) ||
				//piso 2 && (dentro o (hacia abajo y bajando) o (hacia arriba y subiendo))
				(e[0] && !e[1]) && (o[8] || (o[3] && !e[2]) || (o[4] && e[2])) ||
				//piso 3 && (dentro o (abajo y bajando) o (arriba y subiendo))
				(e[0] && e[1]) && (o[9] || o[5])
				//piso 4 && (dentro o bajando)
			);
		end
	endfunction

endmodule
