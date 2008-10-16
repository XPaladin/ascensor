module APAGADOR_SOLICITUDES (e, t, s);
	input [3:0] e;
	input t;
	inout [9:0] s;

	always@(t or e or s)
	begin
		if (t==1)
		begin
			case (e)
				4'b0100://piso 1 arriba
					s[0]=0;
					s[6]=0;
				4'b0001://piso 2 abajo
					s[1]=0;
					s[7]=0;
				4'b0101://piso 2 arriba
					s[2]=0;
					s[7]=0
				4'b0010://piso 3 abajo	
					s[3]=0;
					s[8]=0;
				4'b0110://piso 3 arriba		
					s[4]=0;
					s[8]=0;
				4'b0111://piso 4 arriba
					s[5]=0;
					s[9]=0;
			endcase
		end
	end
endmodule

