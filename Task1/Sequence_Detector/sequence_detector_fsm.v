// Sankatmochan Bot : Task 1 C : FSM
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.
This file is used to design a Finite State Machine to detect patter/sequence 1100

Recommended Quartus Version : 19.1
The submitted project file must be 19.1 compatible as the evaluation will be done on Quartus Prime Lite 19.1.

Warning: The error due to compatibility will not be entertained.
			Do not make any changes to Test_Bench_Vector.txt file. Violating will result into Disqualification.
-------------------
*/

//Finite State Machine design
//Inputs : Clock, X (Input Stream)
//Output : Y (Y = 1 when 1100 pattern/sequence is detected)

//////////////////DO NOT MAKE ANY CHANGES IN MODULE///////////////////////////////
module sequence_detector_fsm(
		input Clk,		//Clock input
		input X,			//Input Bitstream 
		output Y			//Output: Y = 1 when 1100 pattern/sequence is detected.	
);

////////////////////////WRITE YOUR CODE FROM HERE////////////////////

// using mealy finite state machine modelling 


parameter State0=0,
          State1=1,
			 State11=2,
			 State110=3;
//various States of the machine 		 
			 
reg[2:0] State,out; 

initial 
begin
State=State0;
end



always @(posedge Clk)
begin

//next value for State is decided based on 
//present value of state and input value X 

case(State)

State0:
begin
if(X)
State<=State1;
else
State<=State0;
end

State1:
begin
if(X)
State<=State11;
else
State<=State0;
end

State11:
begin
if(X)
State<=State11;
else
State<=State110;
end

State110:
begin
if(X)
State<=State1;
else
State<=State0;
end


endcase 

//output is 1 when present value of State is 110 and input X is 0 
//output is 0 in all other cases
out = ((State == State110) && !X )? 1:0;

end
	 
assign Y = out;

// Tip : Write your code such that Quartus Generates a State Machine 
//			(Tools > Netlist Viewers > State Machine Viewer).
// 		For doing so, you will have to properly declare State Variables of the
//       State Machine and also perform State Assignments correctly.  






	
///////////////////////YOUR CODE ENDS HERE////////////////////////////
endmodule
///////////////////////////////MODULE ENDS///////////////////////////