
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:052

00:00:082	
476.2772	
182.043Z17-268h px� 
j
Command: %s
53*	vivadotcl29
7synth_design -top SHA3_256_IN_32W -part xc7z020clg484-1Z4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
z
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2	
xc7z020Z17-347h px� 
j
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2	
xc7z020Z17-349h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
15008Z8-7075h px� 
�
%s*synth2u
sStarting Synthesize : Time (s): cpu = 00:00:05 ; elapsed = 00:00:08 . Memory (MB): peak = 921.277 ; gain = 442.070
h px� 
�
synthesizing module '%s'%s4497*oasys2
SHA3_256_IN_32W2
 2R
ND:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/SHA3_256_IN_32W.sv2
58@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
PADDING_MODULE2
 2Q
MD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_MODULE.sv2
58@Z8-6157h px� 
T
%s
*synth2<
:	Parameter WRITE_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter READ_DATA_WIDTH bound to: 1088 - type: integer 
h p
x
� 
J
%s
*synth22
0	Parameter DEPTH bound to: 128 - type: integer 
h p
x
� 
�
synthesizing module '%s'%s4497*oasys2
BUFFER2
 2I
ED:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/BUFFER.sv2
38@Z8-6157h px� 
T
%s
*synth2<
:	Parameter WRITE_DATA_WIDTH bound to: 32 - type: integer 
h p
x
� 
U
%s
*synth2=
;	Parameter READ_DATA_WIDTH bound to: 1088 - type: integer 
h p
x
� 
J
%s
*synth22
0	Parameter DEPTH bound to: 128 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
BUFFER2
 2
02
12I
ED:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/BUFFER.sv2
38@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
PADDER2
 2I
ED:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDER.sv2
48@Z8-6157h px� 
P
%s
*synth28
6	Parameter DATA_WIDTH bound to: 1088 - type: integer 
h p
x
� 
S
%s
*synth2;
9	Parameter DATA_PART_WIDTH bound to: 32 - type: integer 
h p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PADDER2
 2
02
12I
ED:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDER.sv2
48@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
PADDING_CTRL_UNIT2
 2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
58@Z8-6157h px� 
P
%s
*synth28
6	Parameter IN_OUT_RATIO bound to: 34 - type: integer 
h p
x
� 
�
-case statement is not full and has no default155*oasys2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1178@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PADDING_CTRL_UNIT2
 2
02
12T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
58@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PADDING_MODULE2
 2
02
12Q
MD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_MODULE.sv2
58@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
PERMUTATION_MODULE2
 2=
9D:/vivado_projects/sha3/SHA3_vivado/PERMUTATION_MODULE.sv2
58@Z8-6157h px� 
R
%s
*synth2:
8	Parameter R_BLOCK_SIZE bound to: 1088 - type: integer 
h p
x
� 
�
synthesizing module '%s'%s4497*oasys2
RND2
 2.
*D:/vivado_projects/sha3/SHA3_vivado/RND.sv2
58@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
THETA2
 20
,D:/vivado_projects/sha3/SHA3_vivado/THETA.sv2
68@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
THETA_column2
 27
3D:/vivado_projects/sha3/SHA3_vivado/THETA_column.sv2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
THETA_column2
 2
02
127
3D:/vivado_projects/sha3/SHA3_vivado/THETA_column.sv2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
THETA2
 2
02
120
,D:/vivado_projects/sha3/SHA3_vivado/THETA.sv2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
RHO2
 2.
*D:/vivado_projects/sha3/SHA3_vivado/RHO.sv2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RHO2
 2
02
12.
*D:/vivado_projects/sha3/SHA3_vivado/RHO.sv2
68@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
PI2
 2-
)D:/vivado_projects/sha3/SHA3_vivado/PI.sv2
58@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PI2
 2
02
12-
)D:/vivado_projects/sha3/SHA3_vivado/PI.sv2
58@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
CHI2
 2.
*D:/vivado_projects/sha3/SHA3_vivado/CHI.sv2
58@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2	
CHI_row2
 22
.D:/vivado_projects/sha3/SHA3_vivado/CHI_row.sv2
38@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2	
CHI_row2
 2
02
122
.D:/vivado_projects/sha3/SHA3_vivado/CHI_row.sv2
38@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
CHI2
 2
02
12.
*D:/vivado_projects/sha3/SHA3_vivado/CHI.sv2
58@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
IOTA2
 2/
+D:/vivado_projects/sha3/SHA3_vivado/IOTA.sv2
58@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
IOTA2
 2
02
12/
+D:/vivado_projects/sha3/SHA3_vivado/IOTA.sv2
58@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
RND2
 2
02
12.
*D:/vivado_projects/sha3/SHA3_vivado/RND.sv2
58@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
PERMUTATION_CTRL_UNIT2
 2X
TD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PERMUTATION_CTRL_UNIT.sv2
48@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
ROUND_CONSTANT_COUNTER2
 2A
=D:/vivado_projects/sha3/SHA3_vivado/ROUND_CONSTANT_COUNTER.sv2
48@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
ROUND_CONSTANT_COUNTER2
 2
02
12A
=D:/vivado_projects/sha3/SHA3_vivado/ROUND_CONSTANT_COUNTER.sv2
48@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PERMUTATION_CTRL_UNIT2
 2
02
12X
TD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PERMUTATION_CTRL_UNIT.sv2
48@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
PERMUTATION_MODULE2
 2
02
12=
9D:/vivado_projects/sha3/SHA3_vivado/PERMUTATION_MODULE.sv2
58@Z8-6155h px� 
�
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
16012
OUT2
16002
PERMUTATION_MODULE2R
ND:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/SHA3_256_IN_32W.sv2
478@Z8-689h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
SHA3_256_IN_32W2
 2
02
12R
ND:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/SHA3_256_IN_32W.sv2
58@Z8-6155h px� 
}
9Port %s in module %s is either unconnected or has no load4866*oasys2
	BUF_EMPTY2
PADDING_CTRL_UNITZ8-7129h px� 
�
%s*synth2v
tFinished Synthesize : Time (s): cpu = 00:00:08 ; elapsed = 00:00:14 . Memory (MB): peak = 1095.008 ; gain = 615.801
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:09 ; elapsed = 00:00:15 . Memory (MB): peak = 1095.008 ; gain = 615.801
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Loading part: xc7z020clg484-1
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:09 ; elapsed = 00:00:15 . Memory (MB): peak = 1095.008 ; gain = 615.801
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
Loading part %s157*device2
xc7z020clg484-1Z21-403h px� 
u
3inferred FSM for state register '%s' in module '%s'802*oasys2
	STATE_reg2
PADDING_CTRL_UNITZ8-802h px� 
y
3inferred FSM for state register '%s' in module '%s'802*oasys2
	state_reg2
PERMUTATION_CTRL_UNITZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    INIT |                              001 | 00000000000000000000000000000000
h p
x
� 
y
%s
*synth2a
_                COUNTING |                              010 | 00000000000000000000000000000001
h p
x
� 
y
%s
*synth2a
_               READ_NEXT |                              100 | 00000000000000000000000000000010
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	STATE_reg2	
one-hot2
PADDING_CTRL_UNITZ8-3354h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
%s
*synth2a
_                    INIT |                             0001 | 00000000000000000000000000000000
h p
x
� 
y
%s
*synth2a
_                COUNTING |                             0010 | 00000000000000000000000000000010
h p
x
� 
y
%s
*synth2a
_                   VALID |                             0100 | 00000000000000000000000000000100
h p
x
� 
y
%s
*synth2a
_      WAIT_FOR_NEXT_MESS |                             1000 | 00000000000000000000000000000011
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
�
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2
	state_reg2	
one-hot2
PERMUTATION_CTRL_UNITZ8-3354h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:33 ; elapsed = 00:00:58 . Memory (MB): peak = 1434.684 ; gain = 955.477
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    7 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit       Adders := 1     
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	   2 Input   1088 Bit         XORs := 1     
h p
x
� 
H
%s
*synth20
.	   2 Input      1 Bit         XORs := 3584  
h p
x
� 
&
%s
*synth2
+---XORs : 
h p
x
� 
H
%s
*synth20
.	                5 Bit    Wide XORs := 320   
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	             1600 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	             1088 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                6 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	                5 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 1     
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input 1600 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 36    
h p
x
� 
F
%s
*synth2.
,	   3 Input   32 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input   31 Bit        Muxes := 35    
h p
x
� 
F
%s
*synth2.
,	   3 Input    6 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    6 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    5 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   3 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	 128 Input    2 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 6     
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 2     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
q
%s
*synth2Y
WPart Resources:
DSPs: 220 (col length:60)
BRAMs: 280 (col length: RAMB18 60 RAMB36 30)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st25
3PADDING_PART/pad_ctrl_unit/read_en_counter_reg[5]/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st25
3PADDING_PART/pad_ctrl_unit/read_en_counter_reg[3]/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st25
3PADDING_PART/pad_ctrl_unit/read_en_counter_reg[2]/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st25
3PADDING_PART/pad_ctrl_unit/read_en_counter_reg[1]/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1138@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st28
6PADDING_PART/pad_ctrl_unit/read_en_counter_reg[4]__0/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
998@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
998@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
998@Z8-6858h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
1st28
6PADDING_PART/pad_ctrl_unit/read_en_counter_reg[0]__0/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
998@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
Q2
2nd2
GND2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
998@Z8-6859h px� 
�
rmulti-driven net %s is connected to at least one constant driver which has been preserved, other driver is ignored4707*oasys2
Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
998@Z8-6858h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:01:03 ; elapsed = 00:01:54 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Timing Optimization : Time (s): cpu = 00:01:05 ; elapsed = 00:01:57 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Technology Mapping : Time (s): cpu = 00:01:06 ; elapsed = 00:01:59 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2x
vFinished IO Insertion : Time (s): cpu = 00:01:09 ; elapsed = 00:02:05 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:09 ; elapsed = 00:02:05 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
PADDING_PART/ctrl_read_en2
1st23
1PADDING_PART/pad_ctrl_unit/CTRL_BUF_READ_EN_reg/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
1038@Z8-6859h px� 
�
2multi-driven net on pin %s with %s driver pin '%s'4708*oasys2
PADDING_PART/ctrl_read_en2
2nd26
4PADDING_PART/pad_ctrl_unit/CTRL_BUF_READ_EN_reg__0/Q2T
PD:/vivado_projects/sha3/SHA3_vivado/sha3.srcs/sources_1/new/PADDING_CTRL_UNIT.sv2
868@Z8-6859h px� 
2
%s
*synth2

Report Check Netlist: 
h p
x
� 
c
%s
*synth2K
I+------+------------------+-------+---------+-------+------------------+
h p
x
� 
c
%s
*synth2K
I|      |Item              |Errors |Warnings |Status |Description       |
h p
x
� 
c
%s
*synth2K
I+------+------------------+-------+---------+-------+------------------+
h p
x
� 
c
%s
*synth2K
I|1     |multi_driven_nets |      0|        1|Failed |Multi driven nets |
h p
x
� 
c
%s
*synth2K
I+------+------------------+-------+---------+-------+------------------+
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:09 ; elapsed = 00:02:05 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:09 ; elapsed = 00:02:05 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:09 ; elapsed = 00:02:06 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:09 ; elapsed = 00:02:06 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
| |BlackBox name |Instances |
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
8
%s
*synth2 
+-+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|      |Cell |Count |
h px� 
0
%s*synth2
+------+-----+------+
h px� 
0
%s*synth2
|1     |BUFG |     1|
h px� 
0
%s*synth2
|2     |LUT1 |     6|
h px� 
0
%s*synth2
|3     |LUT2 |    15|
h px� 
0
%s*synth2
|4     |LUT3 |  1931|
h px� 
0
%s*synth2
|5     |LUT4 |   836|
h px� 
0
%s*synth2
|6     |LUT5 |  1383|
h px� 
0
%s*synth2
|7     |LUT6 |   254|
h px� 
0
%s*synth2
|8     |FDCE |  2191|
h px� 
0
%s*synth2
|9     |FDPE |     4|
h px� 
0
%s*synth2
|10    |FDRE |    33|
h px� 
0
%s*synth2
|11    |IBUF |    36|
h px� 
0
%s*synth2
|12    |OBUF |   257|
h px� 
0
%s*synth2
+------+-----+------+
h px� 
3
%s
*synth2

Report Instance Areas: 
h p
x
� 
U
%s
*synth2=
;+------+-------------------+----------------------+------+
h p
x
� 
U
%s
*synth2=
;|      |Instance           |Module                |Cells |
h p
x
� 
U
%s
*synth2=
;+------+-------------------+----------------------+------+
h p
x
� 
U
%s
*synth2=
;|1     |top                |                      |  6947|
h p
x
� 
U
%s
*synth2=
;|2     |  PADDING_PART     |PADDING_MODULE        |  3044|
h p
x
� 
U
%s
*synth2=
;|3     |    buffer1        |BUFFER                |  1707|
h p
x
� 
U
%s
*synth2=
;|4     |    pad_ctrl_unit  |PADDING_CTRL_UNIT     |  1335|
h p
x
� 
U
%s
*synth2=
;|5     |  PERMUTATION_PART |PERMUTATION_MODULE    |  3609|
h p
x
� 
U
%s
*synth2=
;|6     |    PERM_CTRL_CNT  |PERMUTATION_CTRL_UNIT |    28|
h p
x
� 
U
%s
*synth2=
;|7     |    RND1           |RND                   |   443|
h p
x
� 
U
%s
*synth2=
;|8     |      T            |THETA                 |   443|
h p
x
� 
U
%s
*synth2=
;+------+-------------------+----------------------+------+
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:09 ; elapsed = 00:02:06 . Memory (MB): peak = 1460.945 ; gain = 981.738
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
a
%s
*synth2I
GSynthesis finished with 0 errors, 20 critical warnings and 3 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:09 ; elapsed = 00:02:06 . Memory (MB): peak = 1460.945 ; gain = 981.738
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:09 ; elapsed = 00:02:06 . Memory (MB): peak = 1460.945 ; gain = 981.738
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.1362

1467.7462
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0022

1493.4612
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

5b7e5d2bZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
472
32
202
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:01:112

00:02:102

1493.4612

1017.184Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0182

1493.4612
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2K
ID:/vivado_projects/sha3/SHA3_vivado/sha3.runs/synth_1/SHA3_256_IN_32W.dcpZ17-1381h px� 
�
%s4*runtcl2v
tExecuting : report_utilization -file SHA3_256_IN_32W_utilization_synth.rpt -pb SHA3_256_IN_32W_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Wed Sep 25 12:06:14 2024Z17-206h px� 


End Record