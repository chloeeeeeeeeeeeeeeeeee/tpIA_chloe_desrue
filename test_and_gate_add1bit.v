`timescale 1ns / 1ps
module stimulus;
	// Inputs
	reg x;
	reg y;
	// Outputs
	wire z;
	wire r;
	// Instantiate the Unit Under Test (UUT)
	and_gate uut (
		x, 
		y, 
		z,
		r
	);
 
	initial begin
	$dumpfile("test.vcd");
    $dumpvars(0,stimulus);
		// Initialize Inputs
		x = 0;
		y = 0;
 
	#20 x = 1;
	#20 y = 1;
	#20 y = 1;	
	#20 x = 0;	  
	#40 ;
 
	end  
 
		initial begin
		 $monitor("t=%3d x=%d,y=%d,z=%d \n",$time,x,y,z, );
		 end
 
endmodule
 
 
