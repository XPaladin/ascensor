module APAGADOR_SOLICITUDES (o, e, t, clk, s);
	input [9:0] o;
	input [3:0] e;
	input t;
	input clk;
	output [9:0] s;
	
	reg [9:0] s;

	always@(posedge clk)
	begin
		s=o;
		if (t==1)
		begin
			case (e)
				4'b0000://piso 1 abajo
				begin
					s[0]=0;
					s[6]=0;
				end
				4'b0100://piso 1 arriba
				begin
					s[0]=0;
					s[6]=0;
				end
				4'b0001://piso 2 abajo
				begin
					s[1]=0;
					s[7]=0;
				end
				4'b0101://piso 2 arriba
				begin
					s[2]=0;
					s[7]=0;
				end
				4'b0010://piso 3 abajo	
				begin
					s[3]=0;
					s[8]=0;
				end
				4'b0110://piso 3 arriba		
				begin
					s[4]=0;
					s[8]=0;
				end
				4'b0011://piso 4 abajo
				begin
					s[5]=0;
					s[9]=0;
				end
				4'b0111://piso 4 arriba
				begin
					s[5]=0;
					s[9]=0;
				end
			endcase
		end
	end
endmodule

