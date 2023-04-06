`timescale 1ns / 1ps
module stimulus;
	// Inputs
	reg x;
	reg y;
	reg u;
	// Outputs
	wire z;
	// Instantiate the Unit Under Test (UUT)
	and_gate uut (
		x, 
		y,
		u, 
		z
	);
 
	initial begin
	$dumpfile("test.vcd");
    $dumpvars(0,stimulus);
		// Initialize Inputs
		x = 0;
		y = 0;
		u = 0;
 
	#20 x = 1;
	#20 y = 1;
	#20 u = 1;
	#20 y = 0;	
	#20 x = 1;
	#20 u = 0;	  
	#40 ;
 
	end  
 
		initial begin
		 $monitor("t=%3d x=%d,y=%d,u=%d,z=%d \n",$time,x,y,u,z, );
		 end
 
endmodule
 
 
