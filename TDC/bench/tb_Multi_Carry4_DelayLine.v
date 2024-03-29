/////////////////////////////////////////////////////////////////
//*----- MODULE DELAY LINE WITH CARRY4 XILINX PRIMITIVES -----*//
/////////////////////////////////////////////////////////////////

`define NUMBER_OF_CARRY4 8
`timescale 1ns / 100ps

module tb_Multi_Carry4_DelayLine ;


   ///////////////////////////
   //   device under test   //
   ///////////////////////////

   wire CI = 1'b0;
   reg  trigger;

   wire [31:0]CO;
   wire [31:0]O;

   Multi_Carry4_DelayLine  #(.Ncarry4 (`NUMBER_OF_CARRY4)) DUT (
   
      .CO(CO),          // 4-bit carry out
      .O(O),
      .CI(CI),          // 1-bit carry cascade input
      .trigger(trigger) // 1-bit carry initialization
      

    
      ) ;

   //////////////////
   //   stimulus   //
   //////////////////

   initial begin
   
      #0 trigger = 1'b0;
	  
	  #110 trigger = 1'b1;
	  
	  #500 trigger = 1'b0;
	  
	  #600 $finish;
	  
	 end;
	 
endmodule