//
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2025-03-23T19:14:47
// /tmp/.mount_bambu-DxUHHJ/usr/bin/bambu executed with: /tmp/.mount_bambu-DxUHHJ/usr/bin/bambu --top-fname=heapSort heapsort_bambu.c
//
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_SE(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;

  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    if (wenable)
      reg_out1 <= in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output out1;
  assign out1 = in1 != {BITSIZE_in1{1'b0}};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module BMEMORY_CTRLN(clock,
  in1,
  in2,
  in3,
  in4,
  sel_LOAD,
  sel_STORE,
  out1,
  Min_oe_ram,
  Mout_oe_ram,
  Min_we_ram,
  Mout_we_ram,
  Min_addr_ram,
  Mout_addr_ram,
  M_Rdata_ram,
  Min_Wdata_ram,
  Mout_Wdata_ram,
  Min_data_ram_size,
  Mout_data_ram_size,
  M_DataRdy);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_in2=1, PORTSIZE_in2=2,
    BITSIZE_in3=1, PORTSIZE_in3=2,
    BITSIZE_in4=1, PORTSIZE_in4=2,
    BITSIZE_sel_LOAD=1, PORTSIZE_sel_LOAD=2,
    BITSIZE_sel_STORE=1, PORTSIZE_sel_STORE=2,
    BITSIZE_out1=1, PORTSIZE_out1=2,
    BITSIZE_Min_oe_ram=1, PORTSIZE_Min_oe_ram=2,
    BITSIZE_Min_we_ram=1, PORTSIZE_Min_we_ram=2,
    BITSIZE_Mout_oe_ram=1, PORTSIZE_Mout_oe_ram=2,
    BITSIZE_Mout_we_ram=1, PORTSIZE_Mout_we_ram=2,
    BITSIZE_M_DataRdy=1, PORTSIZE_M_DataRdy=2,
    BITSIZE_Min_addr_ram=1, PORTSIZE_Min_addr_ram=2,
    BITSIZE_Mout_addr_ram=1, PORTSIZE_Mout_addr_ram=2,
    BITSIZE_M_Rdata_ram=8, PORTSIZE_M_Rdata_ram=2,
    BITSIZE_Min_Wdata_ram=8, PORTSIZE_Min_Wdata_ram=2,
    BITSIZE_Mout_Wdata_ram=8, PORTSIZE_Mout_Wdata_ram=2,
    BITSIZE_Min_data_ram_size=1, PORTSIZE_Min_data_ram_size=2,
    BITSIZE_Mout_data_ram_size=1, PORTSIZE_Mout_data_ram_size=2;
  // IN
  input clock;
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  input [(PORTSIZE_in2*BITSIZE_in2)+(-1):0] in2;
  input [(PORTSIZE_in3*BITSIZE_in3)+(-1):0] in3;
  input [PORTSIZE_in4-1:0] in4;
  input [PORTSIZE_sel_LOAD-1:0] sel_LOAD;
  input [PORTSIZE_sel_STORE-1:0] sel_STORE;
  input [PORTSIZE_Min_oe_ram-1:0] Min_oe_ram;
  input [PORTSIZE_Min_we_ram-1:0] Min_we_ram;
  input [(PORTSIZE_Min_addr_ram*BITSIZE_Min_addr_ram)+(-1):0] Min_addr_ram;
  input [(PORTSIZE_M_Rdata_ram*BITSIZE_M_Rdata_ram)+(-1):0] M_Rdata_ram;
  input [(PORTSIZE_Min_Wdata_ram*BITSIZE_Min_Wdata_ram)+(-1):0] Min_Wdata_ram;
  input [(PORTSIZE_Min_data_ram_size*BITSIZE_Min_data_ram_size)+(-1):0] Min_data_ram_size;
  input [PORTSIZE_M_DataRdy-1:0] M_DataRdy;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  output [PORTSIZE_Mout_oe_ram-1:0] Mout_oe_ram;
  output [PORTSIZE_Mout_we_ram-1:0] Mout_we_ram;
  output [(PORTSIZE_Mout_addr_ram*BITSIZE_Mout_addr_ram)+(-1):0] Mout_addr_ram;
  output [(PORTSIZE_Mout_Wdata_ram*BITSIZE_Mout_Wdata_ram)+(-1):0] Mout_Wdata_ram;
  output [(PORTSIZE_Mout_data_ram_size*BITSIZE_Mout_data_ram_size)+(-1):0] Mout_data_ram_size;

  parameter max_n_writes = PORTSIZE_sel_STORE > PORTSIZE_Mout_we_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_we_ram;
  parameter max_n_reads = PORTSIZE_sel_LOAD > PORTSIZE_Mout_oe_ram ? PORTSIZE_sel_STORE : PORTSIZE_Mout_oe_ram;
  parameter max_n_rw = max_n_writes > max_n_reads ? max_n_writes : max_n_reads;
  wire  [(PORTSIZE_in2*BITSIZE_in2)-1:0] tmp_addr;
  wire [PORTSIZE_sel_LOAD-1:0] int_sel_LOAD;
  wire [PORTSIZE_sel_STORE-1:0] int_sel_STORE;
  assign int_sel_LOAD = sel_LOAD & in4;
  assign int_sel_STORE = sel_STORE & in4;
  assign tmp_addr = in2;
  generate
  genvar i;
    for (i=0; i<max_n_rw; i=i+1)
    begin : L0
      assign Mout_addr_ram[(i+1)*BITSIZE_Mout_addr_ram-1:i*BITSIZE_Mout_addr_ram] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (tmp_addr[(i+1)*BITSIZE_in2-1:i*BITSIZE_in2]) : Min_addr_ram[(i+1)*BITSIZE_Min_addr_ram-1:i*BITSIZE_Min_addr_ram];
    end
    endgenerate
  assign Mout_oe_ram = int_sel_LOAD | Min_oe_ram;
  assign Mout_we_ram = int_sel_STORE | Min_we_ram;
  generate
    for (i=0; i<max_n_reads; i=i+1)
    begin : L1
      assign out1[(i+1)*BITSIZE_out1-1:i*BITSIZE_out1] = M_Rdata_ram[i*BITSIZE_M_Rdata_ram+BITSIZE_out1-1:i*BITSIZE_M_Rdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L2
      assign Mout_Wdata_ram[(i+1)*BITSIZE_Mout_Wdata_ram-1:i*BITSIZE_Mout_Wdata_ram] = int_sel_STORE[i] ? in1[(i+1)*BITSIZE_in1-1:i*BITSIZE_in1] : Min_Wdata_ram[(i+1)*BITSIZE_Min_Wdata_ram-1:i*BITSIZE_Min_Wdata_ram];
  end
  endgenerate
  generate
    for (i=0; i<max_n_rw; i=i+1)
    begin : L3
      assign Mout_data_ram_size[(i+1)*BITSIZE_Mout_data_ram_size-1:i*BITSIZE_Mout_data_ram_size] = ((i < PORTSIZE_sel_LOAD && int_sel_LOAD[i]) || (i < PORTSIZE_sel_STORE && int_sel_STORE[i])) ? (in3[(i+1)*BITSIZE_in3-1:i*BITSIZE_in3]) : Min_data_ram_size[(i+1)*BITSIZE_Min_data_ram_size-1:i*BITSIZE_Min_data_ram_size];
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_ior_concat_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1,
    OFFSET_PARAMETER=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;

  parameter nbit_out = BITSIZE_out1 > OFFSET_PARAMETER ? BITSIZE_out1 : 1+OFFSET_PARAMETER;
  wire signed [nbit_out-1:0] tmp_in1;
  wire signed [OFFSET_PARAMETER-1:0] tmp_in2;
  generate
    if(BITSIZE_in1 >= nbit_out)
      assign tmp_in1=in1[nbit_out-1:0];
    else
      assign tmp_in1={{(nbit_out-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  endgenerate
  generate
    if(BITSIZE_in2 >= OFFSET_PARAMETER)
      assign tmp_in2=in2[OFFSET_PARAMETER-1:0];
    else
      assign tmp_in2={{(OFFSET_PARAMETER-BITSIZE_in2){in2[BITSIZE_in2-1]}},in2};
  endgenerate
  assign out1 = {tmp_in1[nbit_out-1:OFFSET_PARAMETER] , tmp_in2};
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module gt_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 > in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module le_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 <= in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 <<< in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 <<< in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ne_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >>> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >>> in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  input [BITSIZE_in3-1:0] in3;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 << in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 << in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_pointer_plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    LSB_PARAMETER=-1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  wire [BITSIZE_out1-1:0] in1_tmp;
  wire [BITSIZE_out1-1:0] in2_tmp;
  assign in1_tmp = in1;
  assign in2_tmp = in2;generate if (BITSIZE_out1 > LSB_PARAMETER) assign out1[BITSIZE_out1-1:LSB_PARAMETER] = (in1_tmp[BITSIZE_out1-1:LSB_PARAMETER] + in2_tmp[BITSIZE_out1-1:LSB_PARAMETER]); else assign out1 = 0; endgenerate
  generate if (LSB_PARAMETER != 0 && BITSIZE_out1 > LSB_PARAMETER) assign out1[LSB_PARAMETER-1:0] = 0; endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2013-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bus_merger(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;

  function [BITSIZE_out1-1:0] merge;
    input [BITSIZE_in1*PORTSIZE_in1-1:0] m;
    reg [BITSIZE_out1-1:0] res;
    integer i1;
  begin
    res={BITSIZE_in1{1'b0}};
    for(i1 = 0; i1 < PORTSIZE_in1; i1 = i1 + 1)
    begin
      res = res | m[i1*BITSIZE_in1 +:BITSIZE_in1];
    end
    merge = res;
  end
  endfunction

  assign out1 = merge(in1);
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module join_signal(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;

  generate
  genvar i1;
  for (i1=0; i1<PORTSIZE_in1; i1=i1+1)
    begin : L1
      assign out1[(i1+1)*(BITSIZE_out1/PORTSIZE_in1)-1:i1*(BITSIZE_out1/PORTSIZE_in1)] = in1[(i1+1)*BITSIZE_in1-1:i1*BITSIZE_in1];
    end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module split_signal(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1, PORTSIZE_out1=2;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [(PORTSIZE_out1*BITSIZE_out1)+(-1):0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ASSIGN_SIGNED_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// Datapath RTL description for heapSort
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_heapSort(clock,
  reset,
  in_port_A,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size,
  fuselector_BMEMORY_CTRLN_57_i0_LOAD,
  fuselector_BMEMORY_CTRLN_57_i0_STORE,
  fuselector_BMEMORY_CTRLN_57_i1_LOAD,
  fuselector_BMEMORY_CTRLN_57_i1_STORE,
  selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0,
  selector_MUX_114_reg_0_0_0_0,
  selector_MUX_114_reg_0_0_0_1,
  selector_MUX_116_reg_10_0_0_0,
  selector_MUX_118_reg_12_0_0_0,
  selector_MUX_120_reg_14_0_0_0,
  selector_MUX_121_reg_15_0_0_0,
  selector_MUX_122_reg_16_0_0_0,
  selector_MUX_129_reg_22_0_0_0,
  selector_MUX_131_reg_24_0_0_0,
  selector_MUX_133_reg_26_0_0_0,
  selector_MUX_137_reg_3_0_0_0,
  selector_MUX_138_reg_30_0_0_0,
  selector_MUX_140_reg_32_0_0_0,
  selector_MUX_142_reg_34_0_0_0,
  selector_MUX_143_reg_35_0_0_0,
  selector_MUX_146_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0,
  selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0,
  selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1,
  selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_heapSort_33671_33696,
  OUT_CONDITION_heapSort_33671_33810,
  OUT_CONDITION_heapSort_33671_33820,
  OUT_CONDITION_heapSort_33671_33824,
  OUT_CONDITION_heapSort_33671_33826,
  OUT_CONDITION_heapSort_33671_33941,
  OUT_CONDITION_heapSort_33671_33947,
  OUT_CONDITION_heapSort_33671_33957,
  OUT_CONDITION_heapSort_33671_33961,
  OUT_CONDITION_heapSort_33671_33963,
  OUT_CONDITION_heapSort_33671_33966,
  OUT_CONDITION_heapSort_33671_33968);
  // IN
  input clock;
  input reset;
  input [31:0] in_port_A;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  input fuselector_BMEMORY_CTRLN_57_i0_LOAD;
  input fuselector_BMEMORY_CTRLN_57_i0_STORE;
  input fuselector_BMEMORY_CTRLN_57_i1_LOAD;
  input fuselector_BMEMORY_CTRLN_57_i1_STORE;
  input selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0;
  input selector_MUX_114_reg_0_0_0_0;
  input selector_MUX_114_reg_0_0_0_1;
  input selector_MUX_116_reg_10_0_0_0;
  input selector_MUX_118_reg_12_0_0_0;
  input selector_MUX_120_reg_14_0_0_0;
  input selector_MUX_121_reg_15_0_0_0;
  input selector_MUX_122_reg_16_0_0_0;
  input selector_MUX_129_reg_22_0_0_0;
  input selector_MUX_131_reg_24_0_0_0;
  input selector_MUX_133_reg_26_0_0_0;
  input selector_MUX_137_reg_3_0_0_0;
  input selector_MUX_138_reg_30_0_0_0;
  input selector_MUX_140_reg_32_0_0_0;
  input selector_MUX_142_reg_34_0_0_0;
  input selector_MUX_143_reg_35_0_0_0;
  input selector_MUX_146_reg_6_0_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0;
  input selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1;
  input selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2;
  input selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3;
  input selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0;
  input selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1;
  input selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0;
  input selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0;
  input selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1;
  input selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0;
  input selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0;
  input selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1;
  input selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2;
  input selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3;
  input selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0;
  input selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1;
  input selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0;
  input wrenable_reg_0;
  input wrenable_reg_1;
  input wrenable_reg_10;
  input wrenable_reg_11;
  input wrenable_reg_12;
  input wrenable_reg_13;
  input wrenable_reg_14;
  input wrenable_reg_15;
  input wrenable_reg_16;
  input wrenable_reg_17;
  input wrenable_reg_18;
  input wrenable_reg_19;
  input wrenable_reg_2;
  input wrenable_reg_20;
  input wrenable_reg_21;
  input wrenable_reg_22;
  input wrenable_reg_23;
  input wrenable_reg_24;
  input wrenable_reg_25;
  input wrenable_reg_26;
  input wrenable_reg_27;
  input wrenable_reg_28;
  input wrenable_reg_29;
  input wrenable_reg_3;
  input wrenable_reg_30;
  input wrenable_reg_31;
  input wrenable_reg_32;
  input wrenable_reg_33;
  input wrenable_reg_34;
  input wrenable_reg_35;
  input wrenable_reg_4;
  input wrenable_reg_5;
  input wrenable_reg_6;
  input wrenable_reg_7;
  input wrenable_reg_8;
  input wrenable_reg_9;
  // OUT
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  output OUT_CONDITION_heapSort_33671_33696;
  output OUT_CONDITION_heapSort_33671_33810;
  output OUT_CONDITION_heapSort_33671_33820;
  output OUT_CONDITION_heapSort_33671_33824;
  output OUT_CONDITION_heapSort_33671_33826;
  output OUT_CONDITION_heapSort_33671_33941;
  output OUT_CONDITION_heapSort_33671_33947;
  output OUT_CONDITION_heapSort_33671_33957;
  output OUT_CONDITION_heapSort_33671_33961;
  output OUT_CONDITION_heapSort_33671_33963;
  output OUT_CONDITION_heapSort_33671_33966;
  output OUT_CONDITION_heapSort_33671_33968;
  // Component and signal declarations
  wire [31:0] out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0;
  wire [31:0] out_BMEMORY_CTRLN_57_i1_BMEMORY_CTRLN_57_i0;
  wire [29:0] out_IUdata_converter_FU_10_i0_fu_heapSort_33671_33777;
  wire [29:0] out_IUdata_converter_FU_11_i0_fu_heapSort_33671_33788;
  wire [29:0] out_IUdata_converter_FU_12_i0_fu_heapSort_33671_33749;
  wire [29:0] out_IUdata_converter_FU_32_i0_fu_heapSort_33671_33832;
  wire [29:0] out_IUdata_converter_FU_38_i0_fu_heapSort_33671_33893;
  wire [29:0] out_IUdata_converter_FU_39_i0_fu_heapSort_33671_33943;
  wire [29:0] out_IUdata_converter_FU_40_i0_fu_heapSort_33671_33906;
  wire [29:0] out_IUdata_converter_FU_41_i0_fu_heapSort_33671_33917;
  wire [29:0] out_IUdata_converter_FU_42_i0_fu_heapSort_33671_33862;
  wire [29:0] out_IUdata_converter_FU_8_i0_fu_heapSort_33671_33764;
  wire [29:0] out_IUdata_converter_FU_9_i0_fu_heapSort_33671_33806;
  wire [31:0] out_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0;
  wire [31:0] out_MUX_114_reg_0_0_0_0;
  wire [31:0] out_MUX_114_reg_0_0_0_1;
  wire [31:0] out_MUX_116_reg_10_0_0_0;
  wire [31:0] out_MUX_118_reg_12_0_0_0;
  wire [31:0] out_MUX_120_reg_14_0_0_0;
  wire [31:0] out_MUX_121_reg_15_0_0_0;
  wire [31:0] out_MUX_122_reg_16_0_0_0;
  wire [31:0] out_MUX_129_reg_22_0_0_0;
  wire [31:0] out_MUX_131_reg_24_0_0_0;
  wire [31:0] out_MUX_133_reg_26_0_0_0;
  wire [31:0] out_MUX_137_reg_3_0_0_0;
  wire [31:0] out_MUX_138_reg_30_0_0_0;
  wire [31:0] out_MUX_140_reg_32_0_0_0;
  wire [31:0] out_MUX_142_reg_34_0_0_0;
  wire [31:0] out_MUX_143_reg_35_0_0_0;
  wire [31:0] out_MUX_146_reg_6_0_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1;
  wire [31:0] out_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1;
  wire [31:0] out_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0;
  wire [31:0] out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0;
  wire [31:0] out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1;
  wire [31:0] out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2;
  wire [31:0] out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3;
  wire [31:0] out_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0;
  wire [31:0] out_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1;
  wire [31:0] out_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0;
  wire signed [31:0] out_bit_ior_concat_expr_FU_58_i0_fu_heapSort_33671_33694;
  wire signed [31:0] out_bit_ior_concat_expr_FU_58_i1_fu_heapSort_33671_33872;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_59_i0_fu_heapSort_33671_34132;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_59_i1_fu_heapSort_33671_34138;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_59_i2_fu_heapSort_33671_34141;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_59_i3_fu_heapSort_33671_34147;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [2:0] out_const_2;
  wire [6:0] out_const_3;
  wire [3:0] out_const_4;
  wire out_const_5;
  wire [1:0] out_const_6;
  wire [5:0] out_conv_out_const_3_7_6;
  wire [31:0] out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_3_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_4_32;
  wire [31:0] out_conv_out_i_assign_conn_obj_6_ASSIGN_SIGNED_FU_i_assign_2_I_1_32;
  wire out_gt_expr_FU_32_32_32_60_i0_fu_heapSort_33671_34022;
  wire out_gt_expr_FU_32_32_32_60_i1_fu_heapSort_33671_34026;
  wire out_gt_expr_FU_32_32_32_60_i2_fu_heapSort_33671_34032;
  wire out_gt_expr_FU_32_32_32_60_i3_fu_heapSort_33671_34034;
  wire out_gt_expr_FU_32_32_32_60_i4_fu_heapSort_33671_34038;
  wire out_gt_expr_FU_32_32_32_60_i5_gt_expr_FU_32_32_32_60_i5;
  wire signed [2:0] out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0;
  wire signed [3:0] out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1;
  wire signed [0:0] out_i_assign_conn_obj_6_ASSIGN_SIGNED_FU_i_assign_2;
  wire [31:0] out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_3;
  wire [31:0] out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_4;
  wire [31:0] out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_5;
  wire [31:0] out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_6;
  wire [31:0] out_iu_conv_conn_obj_7_IUdata_converter_FU_iu_conv_7;
  wire [31:0] out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_8;
  wire out_le_expr_FU_32_0_32_61_i0_fu_heapSort_33671_34020;
  wire out_le_expr_FU_32_0_32_62_i0_le_expr_FU_32_0_32_62_i0;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_63_i0_fu_heapSort_33671_33693;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_63_i1_fu_heapSort_33671_33875;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_63_i2_fu_heapSort_33671_34099;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_63_i3_fu_heapSort_33671_34108;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_63_i4_fu_heapSort_33671_34120;
  wire signed [31:0] out_lshift_expr_FU_32_0_32_63_i5_fu_heapSort_33671_34129;
  wire out_ne_expr_FU_32_0_32_64_i0_fu_heapSort_33671_34030;
  wire out_ne_expr_FU_32_0_32_65_i0_fu_heapSort_33671_34042;
  wire out_ne_expr_FU_32_32_32_66_i0_fu_heapSort_33671_34028;
  wire out_ne_expr_FU_32_32_32_66_i1_fu_heapSort_33671_34040;
  wire signed [31:0] out_plus_expr_FU_32_0_32_67_i0_fu_heapSort_33671_33713;
  wire signed [31:0] out_plus_expr_FU_32_0_32_67_i1_fu_heapSort_33671_33839;
  wire signed [31:0] out_plus_expr_FU_32_0_32_68_i0_fu_heapSort_33671_34105;
  wire signed [31:0] out_plus_expr_FU_32_0_32_68_i1_fu_heapSort_33671_34126;
  wire out_read_cond_FU_13_i0_fu_heapSort_33671_33696;
  wire out_read_cond_FU_14_i0_fu_heapSort_33671_33810;
  wire out_read_cond_FU_15_i0_fu_heapSort_33671_33820;
  wire out_read_cond_FU_22_i0_fu_heapSort_33671_33824;
  wire out_read_cond_FU_23_i0_fu_heapSort_33671_33826;
  wire out_read_cond_FU_43_i0_fu_heapSort_33671_33941;
  wire out_read_cond_FU_44_i0_fu_heapSort_33671_33947;
  wire out_read_cond_FU_45_i0_fu_heapSort_33671_33957;
  wire out_read_cond_FU_52_i0_fu_heapSort_33671_33961;
  wire out_read_cond_FU_53_i0_fu_heapSort_33671_33963;
  wire out_read_cond_FU_55_i0_fu_heapSort_33671_33966;
  wire out_read_cond_FU_56_i0_fu_heapSort_33671_33968;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_reg_10_reg_10;
  wire out_reg_11_reg_11;
  wire [31:0] out_reg_12_reg_12;
  wire [31:0] out_reg_13_reg_13;
  wire [31:0] out_reg_14_reg_14;
  wire [31:0] out_reg_15_reg_15;
  wire [31:0] out_reg_16_reg_16;
  wire [31:0] out_reg_17_reg_17;
  wire [31:0] out_reg_18_reg_18;
  wire out_reg_19_reg_19;
  wire [31:0] out_reg_1_reg_1;
  wire [31:0] out_reg_20_reg_20;
  wire [31:0] out_reg_21_reg_21;
  wire [31:0] out_reg_22_reg_22;
  wire [31:0] out_reg_23_reg_23;
  wire [31:0] out_reg_24_reg_24;
  wire [31:0] out_reg_25_reg_25;
  wire [31:0] out_reg_26_reg_26;
  wire [31:0] out_reg_27_reg_27;
  wire [31:0] out_reg_28_reg_28;
  wire [31:0] out_reg_29_reg_29;
  wire out_reg_2_reg_2;
  wire [31:0] out_reg_30_reg_30;
  wire out_reg_31_reg_31;
  wire [31:0] out_reg_32_reg_32;
  wire [31:0] out_reg_33_reg_33;
  wire [31:0] out_reg_34_reg_34;
  wire [31:0] out_reg_35_reg_35;
  wire [31:0] out_reg_3_reg_3;
  wire [31:0] out_reg_4_reg_4;
  wire [31:0] out_reg_5_reg_5;
  wire [31:0] out_reg_6_reg_6;
  wire [31:0] out_reg_7_reg_7;
  wire [31:0] out_reg_8_reg_8;
  wire [31:0] out_reg_9_reg_9;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_69_i0_fu_heapSort_33671_34091;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_69_i1_fu_heapSort_33671_34103;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_69_i2_fu_heapSort_33671_34111;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_69_i3_fu_heapSort_33671_34115;
  wire signed [30:0] out_rshift_expr_FU_32_0_32_69_i4_fu_heapSort_33671_34124;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_70_i0_fu_heapSort_33671_34135;
  wire [31:0] out_ui_cond_expr_FU_32_32_32_32_70_i1_fu_heapSort_33671_34144;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i0_fu_heapSort_33671_33743;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i1_fu_heapSort_33671_33761;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i2_fu_heapSort_33671_33774;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i3_fu_heapSort_33671_33785;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i4_fu_heapSort_33671_33807;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i5_fu_heapSort_33671_33859;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i6_fu_heapSort_33671_33890;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i7_fu_heapSort_33671_33903;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i8_fu_heapSort_33671_33914;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_71_i9_fu_heapSort_33671_33944;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_72_i0_fu_heapSort_33671_33998;
  wire [31:0] out_ui_lshift_expr_FU_32_0_32_72_i1_fu_heapSort_33671_34005;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i0_fu_heapSort_33671_33737;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i10_fu_heapSort_33671_34001;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i11_fu_heapSort_33671_34008;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i1_fu_heapSort_33671_33758;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i2_fu_heapSort_33671_33771;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i3_fu_heapSort_33671_33782;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i4_fu_heapSort_33671_33808;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i5_fu_heapSort_33671_33856;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i6_fu_heapSort_33671_33887;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i7_fu_heapSort_33671_33900;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i8_fu_heapSort_33671_33911;
  wire [31:0] out_ui_pointer_plus_expr_FU_32_32_32_73_i9_fu_heapSort_33671_33945;
  wire [63:0] sig_in_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_in_vector_bus_mergerMout_Wdata_ram0_0;
  wire [63:0] sig_in_vector_bus_mergerMout_addr_ram1_0;
  wire [11:0] sig_in_vector_bus_mergerMout_data_ram_size2_0;
  wire [1:0] sig_in_vector_bus_mergerMout_oe_ram3_0;
  wire [1:0] sig_in_vector_bus_mergerMout_we_ram4_0;
  wire [63:0] sig_out_bus_mergerMout_Wdata_ram0_;
  wire [63:0] sig_out_bus_mergerMout_addr_ram1_;
  wire [11:0] sig_out_bus_mergerMout_data_ram_size2_;
  wire [1:0] sig_out_bus_mergerMout_oe_ram3_;
  wire [1:0] sig_out_bus_mergerMout_we_ram4_;

  ASSIGN_SIGNED_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(3)) ASSIGN_SIGNED_FU_i_assign_0 (.out1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0),
    .in1(out_const_2));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(4)) ASSIGN_SIGNED_FU_i_assign_1 (.out1(out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1),
    .in1(out_const_4));
  ASSIGN_SIGNED_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) ASSIGN_SIGNED_FU_i_assign_2 (.out1(out_i_assign_conn_obj_6_ASSIGN_SIGNED_FU_i_assign_2),
    .in1(out_const_0));
  BMEMORY_CTRLN #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_in2(32),
    .PORTSIZE_in2(2),
    .BITSIZE_in3(6),
    .PORTSIZE_in3(2),
    .BITSIZE_in4(1),
    .PORTSIZE_in4(2),
    .BITSIZE_sel_LOAD(1),
    .PORTSIZE_sel_LOAD(2),
    .BITSIZE_sel_STORE(1),
    .PORTSIZE_sel_STORE(2),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2),
    .BITSIZE_Min_oe_ram(1),
    .PORTSIZE_Min_oe_ram(2),
    .BITSIZE_Min_we_ram(1),
    .PORTSIZE_Min_we_ram(2),
    .BITSIZE_Mout_oe_ram(1),
    .PORTSIZE_Mout_oe_ram(2),
    .BITSIZE_Mout_we_ram(1),
    .PORTSIZE_Mout_we_ram(2),
    .BITSIZE_M_DataRdy(1),
    .PORTSIZE_M_DataRdy(2),
    .BITSIZE_Min_addr_ram(32),
    .PORTSIZE_Min_addr_ram(2),
    .BITSIZE_Mout_addr_ram(32),
    .PORTSIZE_Mout_addr_ram(2),
    .BITSIZE_M_Rdata_ram(32),
    .PORTSIZE_M_Rdata_ram(2),
    .BITSIZE_Min_Wdata_ram(32),
    .PORTSIZE_Min_Wdata_ram(2),
    .BITSIZE_Mout_Wdata_ram(32),
    .PORTSIZE_Mout_Wdata_ram(2),
    .BITSIZE_Min_data_ram_size(6),
    .PORTSIZE_Min_data_ram_size(2),
    .BITSIZE_Mout_data_ram_size(6),
    .PORTSIZE_Mout_data_ram_size(2)) BMEMORY_CTRLN_57_i0 (.out1({out_BMEMORY_CTRLN_57_i1_BMEMORY_CTRLN_57_i0,
      out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0}),
    .Mout_oe_ram(sig_in_vector_bus_mergerMout_oe_ram3_0),
    .Mout_we_ram(sig_in_vector_bus_mergerMout_we_ram4_0),
    .Mout_addr_ram(sig_in_vector_bus_mergerMout_addr_ram1_0),
    .Mout_Wdata_ram(sig_in_vector_bus_mergerMout_Wdata_ram0_0),
    .Mout_data_ram_size(sig_in_vector_bus_mergerMout_data_ram_size2_0),
    .clock(clock),
    .in1({out_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0,
      out_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0}),
    .in2({out_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0,
      out_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0}),
    .in3({out_conv_out_const_3_7_6,
      out_conv_out_const_3_7_6}),
    .in4({out_const_5,
      out_const_5}),
    .sel_LOAD({fuselector_BMEMORY_CTRLN_57_i1_LOAD,
      fuselector_BMEMORY_CTRLN_57_i0_LOAD}),
    .sel_STORE({fuselector_BMEMORY_CTRLN_57_i1_STORE,
      fuselector_BMEMORY_CTRLN_57_i0_STORE}),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .M_Rdata_ram(M_Rdata_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .M_DataRdy(M_DataRdy));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_3 (.out1(out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_3),
    .in1(out_reg_15_reg_15));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_4 (.out1(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_4),
    .in1(out_reg_21_reg_21));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_5 (.out1(out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_5),
    .in1(out_reg_21_reg_21));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_6 (.out1(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_6),
    .in1(out_reg_20_reg_20));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_7 (.out1(out_iu_conv_conn_obj_7_IUdata_converter_FU_iu_conv_7),
    .in1(out_reg_34_reg_34));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) IUdata_converter_FU_iu_conv_8 (.out1(out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_8),
    .in1(out_reg_20_reg_20));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_0_BMEMORY_CTRLN_57_i0_0_0_0 (.out1(out_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0),
    .sel(selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0),
    .in1(out_iu_conv_conn_obj_7_IUdata_converter_FU_iu_conv_7),
    .in2(out_iu_conv_conn_obj_8_IUdata_converter_FU_iu_conv_8));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_114_reg_0_0_0_0 (.out1(out_MUX_114_reg_0_0_0_0),
    .sel(selector_MUX_114_reg_0_0_0_0),
    .in1(out_reg_14_reg_14),
    .in2(out_reg_1_reg_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_114_reg_0_0_0_1 (.out1(out_MUX_114_reg_0_0_0_1),
    .sel(selector_MUX_114_reg_0_0_0_1),
    .in1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_3_32),
    .in2(out_MUX_114_reg_0_0_0_0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_116_reg_10_0_0_0 (.out1(out_MUX_116_reg_10_0_0_0),
    .sel(selector_MUX_116_reg_10_0_0_0),
    .in1(out_ui_cond_expr_FU_32_32_32_32_70_i1_fu_heapSort_33671_34144),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_73_i1_fu_heapSort_33671_33758));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_118_reg_12_0_0_0 (.out1(out_MUX_118_reg_12_0_0_0),
    .sel(selector_MUX_118_reg_12_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_120_reg_14_0_0_0 (.out1(out_MUX_120_reg_14_0_0_0),
    .sel(selector_MUX_120_reg_14_0_0_0),
    .in1(out_reg_3_reg_3),
    .in2(out_cond_expr_FU_32_32_32_32_59_i2_fu_heapSort_33671_34141));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_121_reg_15_0_0_0 (.out1(out_MUX_121_reg_15_0_0_0),
    .sel(selector_MUX_121_reg_15_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_cond_expr_FU_32_32_32_32_59_i3_fu_heapSort_33671_34147));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_122_reg_16_0_0_0 (.out1(out_MUX_122_reg_16_0_0_0),
    .sel(selector_MUX_122_reg_16_0_0_0),
    .in1(out_reg_17_reg_17),
    .in2(out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_4_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_129_reg_22_0_0_0 (.out1(out_MUX_129_reg_22_0_0_0),
    .sel(selector_MUX_129_reg_22_0_0_0),
    .in1(out_reg_35_reg_35),
    .in2(out_conv_out_i_assign_conn_obj_6_ASSIGN_SIGNED_FU_i_assign_2_I_1_32));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_131_reg_24_0_0_0 (.out1(out_MUX_131_reg_24_0_0_0),
    .sel(selector_MUX_131_reg_24_0_0_0),
    .in1(out_reg_22_reg_22),
    .in2(out_bit_ior_concat_expr_FU_58_i1_fu_heapSort_33671_33872));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_133_reg_26_0_0_0 (.out1(out_MUX_133_reg_26_0_0_0),
    .sel(selector_MUX_133_reg_26_0_0_0),
    .in1(out_reg_30_reg_30),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_73_i7_fu_heapSort_33671_33900));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_137_reg_3_0_0_0 (.out1(out_MUX_137_reg_3_0_0_0),
    .sel(selector_MUX_137_reg_3_0_0_0),
    .in1(out_reg_0_reg_0),
    .in2(out_bit_ior_concat_expr_FU_58_i0_fu_heapSort_33671_33694));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_138_reg_30_0_0_0 (.out1(out_MUX_138_reg_30_0_0_0),
    .sel(selector_MUX_138_reg_30_0_0_0),
    .in1(out_ui_cond_expr_FU_32_32_32_32_70_i0_fu_heapSort_33671_34135),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_73_i6_fu_heapSort_33671_33887));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_140_reg_32_0_0_0 (.out1(out_MUX_140_reg_32_0_0_0),
    .sel(selector_MUX_140_reg_32_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_142_reg_34_0_0_0 (.out1(out_MUX_142_reg_34_0_0_0),
    .sel(selector_MUX_142_reg_34_0_0_0),
    .in1(out_reg_20_reg_20),
    .in2(out_cond_expr_FU_32_32_32_32_59_i1_fu_heapSort_33671_34138));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_143_reg_35_0_0_0 (.out1(out_MUX_143_reg_35_0_0_0),
    .sel(selector_MUX_143_reg_35_0_0_0),
    .in1(out_reg_24_reg_24),
    .in2(out_cond_expr_FU_32_32_32_32_59_i0_fu_heapSort_33671_34132));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_146_reg_6_0_0_0 (.out1(out_MUX_146_reg_6_0_0_0),
    .sel(selector_MUX_146_reg_6_0_0_0),
    .in1(out_reg_10_reg_10),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_73_i2_fu_heapSort_33671_33771));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_57_i0_1_0_0 (.out1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0),
    .in1(out_reg_6_reg_6),
    .in2(out_reg_30_reg_30));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_57_i0_1_0_1 (.out1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1),
    .in1(out_reg_26_reg_26),
    .in2(out_reg_23_reg_23));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_57_i0_1_0_2 (.out1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2),
    .sel(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2),
    .in1(in_port_A),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_73_i1_fu_heapSort_33671_33758));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_57_i0_1_0_3 (.out1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3),
    .sel(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i6_fu_heapSort_33671_33887),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_73_i8_fu_heapSort_33671_33911));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_57_i0_1_1_0 (.out1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_57_i0_1_1_1 (.out1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1),
    .sel(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1),
    .in1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2),
    .in2(out_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_1_BMEMORY_CTRLN_57_i0_1_2_0 (.out1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0),
    .sel(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0),
    .in1(out_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0),
    .in2(out_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_57_i1_0_0_0 (.out1(out_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0),
    .in1(out_iu_conv_conn_obj_1_IUdata_converter_FU_iu_conv_3),
    .in2(out_iu_conv_conn_obj_2_IUdata_converter_FU_iu_conv_4));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_57_i1_0_0_1 (.out1(out_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1),
    .sel(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1),
    .in1(out_iu_conv_conn_obj_4_IUdata_converter_FU_iu_conv_5),
    .in2(out_iu_conv_conn_obj_5_IUdata_converter_FU_iu_conv_6));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_4_BMEMORY_CTRLN_57_i1_0_1_0 (.out1(out_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0),
    .sel(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0),
    .in1(out_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0),
    .in2(out_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_BMEMORY_CTRLN_57_i1_1_0_0 (.out1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0),
    .in1(out_reg_8_reg_8),
    .in2(out_reg_4_reg_4));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_BMEMORY_CTRLN_57_i1_1_0_1 (.out1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1),
    .sel(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1),
    .in1(out_reg_28_reg_28),
    .in2(out_reg_18_reg_18));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_BMEMORY_CTRLN_57_i1_1_0_2 (.out1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2),
    .sel(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2),
    .in1(out_reg_10_reg_10),
    .in2(in_port_A));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_BMEMORY_CTRLN_57_i1_1_0_3 (.out1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3),
    .sel(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i10_fu_heapSort_33671_34001),
    .in2(out_ui_pointer_plus_expr_FU_32_32_32_73_i3_fu_heapSort_33671_33782));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_BMEMORY_CTRLN_57_i1_1_1_0 (.out1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0),
    .in1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0),
    .in2(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_BMEMORY_CTRLN_57_i1_1_1_1 (.out1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1),
    .sel(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1),
    .in1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2),
    .in2(out_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3));
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_5_BMEMORY_CTRLN_57_i1_1_2_0 (.out1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0),
    .sel(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0),
    .in1(out_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0),
    .in2(out_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerMout_Wdata_ram0_ (.out1(sig_out_bus_mergerMout_Wdata_ram0_),
    .in1({sig_in_bus_mergerMout_Wdata_ram0_0}));
  bus_merger #(.BITSIZE_in1(64),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(64)) bus_mergerMout_addr_ram1_ (.out1(sig_out_bus_mergerMout_addr_ram1_),
    .in1({sig_in_bus_mergerMout_addr_ram1_0}));
  bus_merger #(.BITSIZE_in1(12),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(12)) bus_mergerMout_data_ram_size2_ (.out1(sig_out_bus_mergerMout_data_ram_size2_),
    .in1({sig_in_bus_mergerMout_data_ram_size2_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_oe_ram3_ (.out1(sig_out_bus_mergerMout_oe_ram3_),
    .in1({sig_in_bus_mergerMout_oe_ram3_0}));
  bus_merger #(.BITSIZE_in1(2),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(2)) bus_mergerMout_we_ram4_ (.out1(sig_out_bus_mergerMout_we_ram4_),
    .in1({sig_in_bus_mergerMout_we_ram4_0}));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b0100000)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b10)) const_6 (.out1(out_const_6));
  UUdata_converter_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(6)) conv_out_const_3_7_6 (.out1(out_conv_out_const_3_7_6),
    .in1(out_const_3));
  IUdata_converter_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_3_32 (.out1(out_conv_out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0_I_3_32),
    .in1(out_i_assign_conn_obj_0_ASSIGN_SIGNED_FU_i_assign_0));
  IUdata_converter_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_4_32 (.out1(out_conv_out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1_I_4_32),
    .in1(out_i_assign_conn_obj_3_ASSIGN_SIGNED_FU_i_assign_1));
  IUdata_converter_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(32)) conv_out_i_assign_conn_obj_6_ASSIGN_SIGNED_FU_i_assign_2_I_1_32 (.out1(out_conv_out_i_assign_conn_obj_6_ASSIGN_SIGNED_FU_i_assign_2_I_1_32),
    .in1(out_i_assign_conn_obj_6_ASSIGN_SIGNED_FU_i_assign_2));
  lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33693 (.out1(out_lshift_expr_FU_32_0_32_63_i0_fu_heapSort_33671_33693),
    .in1(out_reg_0_reg_0),
    .in2(out_const_1));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(1)) fu_heapSort_33671_33694 (.out1(out_bit_ior_concat_expr_FU_58_i0_fu_heapSort_33671_33694),
    .in1(out_lshift_expr_FU_32_0_32_63_i2_fu_heapSort_33671_34099),
    .in2(out_const_1),
    .in3(out_const_1));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33696 (.out1(out_read_cond_FU_13_i0_fu_heapSort_33671_33696),
    .in1(out_le_expr_FU_32_0_32_61_i0_fu_heapSort_33671_34020));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_heapSort_33671_33713 (.out1(out_plus_expr_FU_32_0_32_67_i0_fu_heapSort_33671_33713),
    .in1(out_reg_0_reg_0),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33737 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i0_fu_heapSort_33671_33737),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i0_fu_heapSort_33671_33743));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33743 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i0_fu_heapSort_33671_33743),
    .in1(out_IUdata_converter_FU_12_i0_fu_heapSort_33671_33749),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33749 (.out1(out_IUdata_converter_FU_12_i0_fu_heapSort_33671_33749),
    .in1(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33758 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i1_fu_heapSort_33671_33758),
    .in1(in_port_A),
    .in2(out_reg_5_reg_5));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33761 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i1_fu_heapSort_33671_33761),
    .in1(out_IUdata_converter_FU_8_i0_fu_heapSort_33671_33764),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33764 (.out1(out_IUdata_converter_FU_8_i0_fu_heapSort_33671_33764),
    .in1(out_bit_ior_concat_expr_FU_58_i0_fu_heapSort_33671_33694));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33771 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i2_fu_heapSort_33671_33771),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i2_fu_heapSort_33671_33774));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33774 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i2_fu_heapSort_33671_33774),
    .in1(out_IUdata_converter_FU_10_i0_fu_heapSort_33671_33777),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33777 (.out1(out_IUdata_converter_FU_10_i0_fu_heapSort_33671_33777),
    .in1(out_reg_0_reg_0));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33782 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i3_fu_heapSort_33671_33782),
    .in1(in_port_A),
    .in2(out_reg_7_reg_7));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33785 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i3_fu_heapSort_33671_33785),
    .in1(out_IUdata_converter_FU_11_i0_fu_heapSort_33671_33788),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33788 (.out1(out_IUdata_converter_FU_11_i0_fu_heapSort_33671_33788),
    .in1(out_lshift_expr_FU_32_0_32_63_i3_fu_heapSort_33671_34108));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33806 (.out1(out_IUdata_converter_FU_9_i0_fu_heapSort_33671_33806),
    .in1(out_reg_0_reg_0));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33807 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i4_fu_heapSort_33671_33807),
    .in1(out_IUdata_converter_FU_9_i0_fu_heapSort_33671_33806),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33808 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i4_fu_heapSort_33671_33808),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i4_fu_heapSort_33671_33807));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33810 (.out1(out_read_cond_FU_14_i0_fu_heapSort_33671_33810),
    .in1(out_gt_expr_FU_32_32_32_60_i0_fu_heapSort_33671_34022));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33820 (.out1(out_read_cond_FU_15_i0_fu_heapSort_33671_33820),
    .in1(out_reg_11_reg_11));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33824 (.out1(out_read_cond_FU_22_i0_fu_heapSort_33671_33824),
    .in1(out_ne_expr_FU_32_32_32_66_i0_fu_heapSort_33671_34028));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33826 (.out1(out_read_cond_FU_23_i0_fu_heapSort_33671_33826),
    .in1(out_reg_2_reg_2));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33832 (.out1(out_IUdata_converter_FU_32_i0_fu_heapSort_33671_33832),
    .in1(out_reg_16_reg_16));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(32)) fu_heapSort_33671_33839 (.out1(out_plus_expr_FU_32_0_32_67_i1_fu_heapSort_33671_33839),
    .in1(out_reg_16_reg_16),
    .in2(out_const_5));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33856 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i5_fu_heapSort_33671_33856),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i5_fu_heapSort_33671_33859));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33859 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i5_fu_heapSort_33671_33859),
    .in1(out_IUdata_converter_FU_42_i0_fu_heapSort_33671_33862),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33862 (.out1(out_IUdata_converter_FU_42_i0_fu_heapSort_33671_33862),
    .in1(out_reg_22_reg_22));
  bit_ior_concat_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_in3(2),
    .BITSIZE_out1(32),
    .OFFSET_PARAMETER(1)) fu_heapSort_33671_33872 (.out1(out_bit_ior_concat_expr_FU_58_i1_fu_heapSort_33671_33872),
    .in1(out_lshift_expr_FU_32_0_32_63_i4_fu_heapSort_33671_34120),
    .in2(out_const_1),
    .in3(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33875 (.out1(out_lshift_expr_FU_32_0_32_63_i1_fu_heapSort_33671_33875),
    .in1(out_reg_22_reg_22),
    .in2(out_const_1));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33887 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i6_fu_heapSort_33671_33887),
    .in1(in_port_A),
    .in2(out_reg_25_reg_25));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33890 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i6_fu_heapSort_33671_33890),
    .in1(out_IUdata_converter_FU_38_i0_fu_heapSort_33671_33893),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33893 (.out1(out_IUdata_converter_FU_38_i0_fu_heapSort_33671_33893),
    .in1(out_bit_ior_concat_expr_FU_58_i1_fu_heapSort_33671_33872));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33900 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i7_fu_heapSort_33671_33900),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i7_fu_heapSort_33671_33903));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33903 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i7_fu_heapSort_33671_33903),
    .in1(out_IUdata_converter_FU_40_i0_fu_heapSort_33671_33906),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33906 (.out1(out_IUdata_converter_FU_40_i0_fu_heapSort_33671_33906),
    .in1(out_reg_22_reg_22));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33911 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i8_fu_heapSort_33671_33911),
    .in1(in_port_A),
    .in2(out_reg_27_reg_27));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33914 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i8_fu_heapSort_33671_33914),
    .in1(out_IUdata_converter_FU_41_i0_fu_heapSort_33671_33917),
    .in2(out_const_6));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33917 (.out1(out_IUdata_converter_FU_41_i0_fu_heapSort_33671_33917),
    .in1(out_lshift_expr_FU_32_0_32_63_i5_fu_heapSort_33671_34129));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33941 (.out1(out_read_cond_FU_43_i0_fu_heapSort_33671_33941),
    .in1(out_gt_expr_FU_32_32_32_60_i2_fu_heapSort_33671_34032));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(30)) fu_heapSort_33671_33943 (.out1(out_IUdata_converter_FU_39_i0_fu_heapSort_33671_33943),
    .in1(out_reg_22_reg_22));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33944 (.out1(out_ui_lshift_expr_FU_32_0_32_71_i9_fu_heapSort_33671_33944),
    .in1(out_IUdata_converter_FU_39_i0_fu_heapSort_33671_33943),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_33945 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i9_fu_heapSort_33671_33945),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_71_i9_fu_heapSort_33671_33944));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33947 (.out1(out_read_cond_FU_44_i0_fu_heapSort_33671_33947),
    .in1(out_gt_expr_FU_32_32_32_60_i3_fu_heapSort_33671_34034));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33957 (.out1(out_read_cond_FU_45_i0_fu_heapSort_33671_33957),
    .in1(out_reg_31_reg_31));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33961 (.out1(out_read_cond_FU_52_i0_fu_heapSort_33671_33961),
    .in1(out_ne_expr_FU_32_32_32_66_i1_fu_heapSort_33671_34040));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33963 (.out1(out_read_cond_FU_53_i0_fu_heapSort_33671_33963),
    .in1(out_reg_19_reg_19));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33966 (.out1(out_read_cond_FU_55_i0_fu_heapSort_33671_33966),
    .in1(out_le_expr_FU_32_0_32_62_i0_le_expr_FU_32_0_32_62_i0));
  read_cond_FU #(.BITSIZE_in1(1)) fu_heapSort_33671_33968 (.out1(out_read_cond_FU_56_i0_fu_heapSort_33671_33968),
    .in1(out_gt_expr_FU_32_32_32_60_i5_gt_expr_FU_32_32_32_60_i5));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_33998 (.out1(out_ui_lshift_expr_FU_32_0_32_72_i0_fu_heapSort_33671_33998),
    .in1(out_IUdata_converter_FU_32_i0_fu_heapSort_33671_33832),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_34001 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i10_fu_heapSort_33671_34001),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_72_i0_fu_heapSort_33671_33998));
  ui_lshift_expr_FU #(.BITSIZE_in1(30),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_34005 (.out1(out_ui_lshift_expr_FU_32_0_32_72_i1_fu_heapSort_33671_34005),
    .in1(out_IUdata_converter_FU_32_i0_fu_heapSort_33671_33832),
    .in2(out_const_6));
  ui_pointer_plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .LSB_PARAMETER(0)) fu_heapSort_33671_34008 (.out1(out_ui_pointer_plus_expr_FU_32_32_32_73_i11_fu_heapSort_33671_34008),
    .in1(in_port_A),
    .in2(out_ui_lshift_expr_FU_32_0_32_72_i1_fu_heapSort_33671_34005));
  le_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_heapSort_33671_34020 (.out1(out_le_expr_FU_32_0_32_61_i0_fu_heapSort_33671_34020),
    .in1(out_rshift_expr_FU_32_0_32_69_i2_fu_heapSort_33671_34111),
    .in2(out_const_2));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_heapSort_33671_34022 (.out1(out_gt_expr_FU_32_32_32_60_i0_fu_heapSort_33671_34022),
    .in1(out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0),
    .in2(out_BMEMORY_CTRLN_57_i1_BMEMORY_CTRLN_57_i0));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_heapSort_33671_34026 (.out1(out_gt_expr_FU_32_32_32_60_i1_fu_heapSort_33671_34026),
    .in1(out_BMEMORY_CTRLN_57_i1_BMEMORY_CTRLN_57_i0),
    .in2(out_reg_12_reg_12));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_heapSort_33671_34028 (.out1(out_ne_expr_FU_32_32_32_66_i0_fu_heapSort_33671_34028),
    .in1(out_reg_0_reg_0),
    .in2(out_reg_14_reg_14));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_heapSort_33671_34030 (.out1(out_ne_expr_FU_32_0_32_64_i0_fu_heapSort_33671_34030),
    .in1(out_plus_expr_FU_32_0_32_67_i0_fu_heapSort_33671_33713),
    .in2(out_const_5));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_heapSort_33671_34032 (.out1(out_gt_expr_FU_32_32_32_60_i2_fu_heapSort_33671_34032),
    .in1(out_reg_16_reg_16),
    .in2(out_bit_ior_concat_expr_FU_58_i1_fu_heapSort_33671_33872));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_heapSort_33671_34034 (.out1(out_gt_expr_FU_32_32_32_60_i3_fu_heapSort_33671_34034),
    .in1(out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0),
    .in2(out_BMEMORY_CTRLN_57_i1_BMEMORY_CTRLN_57_i0));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_heapSort_33671_34038 (.out1(out_gt_expr_FU_32_32_32_60_i4_fu_heapSort_33671_34038),
    .in1(out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0),
    .in2(out_reg_32_reg_32));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) fu_heapSort_33671_34040 (.out1(out_ne_expr_FU_32_32_32_66_i1_fu_heapSort_33671_34040),
    .in1(out_reg_22_reg_22),
    .in2(out_reg_35_reg_35));
  ne_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_heapSort_33671_34042 (.out1(out_ne_expr_FU_32_0_32_65_i0_fu_heapSort_33671_34042),
    .in1(out_plus_expr_FU_32_0_32_67_i1_fu_heapSort_33671_33839),
    .in2(out_const_0));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_heapSort_33671_34091 (.out1(out_rshift_expr_FU_32_0_32_69_i0_fu_heapSort_33671_34091),
    .in1(out_lshift_expr_FU_32_0_32_63_i0_fu_heapSort_33671_33693),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_34099 (.out1(out_lshift_expr_FU_32_0_32_63_i2_fu_heapSort_33671_34099),
    .in1(out_rshift_expr_FU_32_0_32_69_i0_fu_heapSort_33671_34091),
    .in2(out_const_1));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_heapSort_33671_34103 (.out1(out_rshift_expr_FU_32_0_32_69_i1_fu_heapSort_33671_34103),
    .in1(out_lshift_expr_FU_32_0_32_63_i0_fu_heapSort_33671_33693),
    .in2(out_const_1));
  plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_heapSort_33671_34105 (.out1(out_plus_expr_FU_32_0_32_68_i0_fu_heapSort_33671_34105),
    .in1(out_rshift_expr_FU_32_0_32_69_i1_fu_heapSort_33671_34103),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_34108 (.out1(out_lshift_expr_FU_32_0_32_63_i3_fu_heapSort_33671_34108),
    .in1(out_plus_expr_FU_32_0_32_68_i0_fu_heapSort_33671_34105),
    .in2(out_const_1));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_heapSort_33671_34111 (.out1(out_rshift_expr_FU_32_0_32_69_i2_fu_heapSort_33671_34111),
    .in1(out_bit_ior_concat_expr_FU_58_i0_fu_heapSort_33671_33694),
    .in2(out_const_1));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_heapSort_33671_34115 (.out1(out_rshift_expr_FU_32_0_32_69_i3_fu_heapSort_33671_34115),
    .in1(out_lshift_expr_FU_32_0_32_63_i1_fu_heapSort_33671_33875),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_34120 (.out1(out_lshift_expr_FU_32_0_32_63_i4_fu_heapSort_33671_34120),
    .in1(out_rshift_expr_FU_32_0_32_69_i3_fu_heapSort_33671_34115),
    .in2(out_const_1));
  rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(31),
    .PRECISION(32)) fu_heapSort_33671_34124 (.out1(out_rshift_expr_FU_32_0_32_69_i4_fu_heapSort_33671_34124),
    .in1(out_lshift_expr_FU_32_0_32_63_i1_fu_heapSort_33671_33875),
    .in2(out_const_1));
  plus_expr_FU #(.BITSIZE_in1(31),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32)) fu_heapSort_33671_34126 (.out1(out_plus_expr_FU_32_0_32_68_i1_fu_heapSort_33671_34126),
    .in1(out_rshift_expr_FU_32_0_32_69_i4_fu_heapSort_33671_34124),
    .in2(out_const_1));
  lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_heapSort_33671_34129 (.out1(out_lshift_expr_FU_32_0_32_63_i5_fu_heapSort_33671_34129),
    .in1(out_plus_expr_FU_32_0_32_68_i1_fu_heapSort_33671_34126),
    .in2(out_const_1));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_heapSort_33671_34132 (.out1(out_cond_expr_FU_32_32_32_32_59_i0_fu_heapSort_33671_34132),
    .in1(out_gt_expr_FU_32_32_32_60_i4_fu_heapSort_33671_34038),
    .in2(out_reg_29_reg_29),
    .in3(out_reg_24_reg_24));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_heapSort_33671_34135 (.out1(out_ui_cond_expr_FU_32_32_32_32_70_i0_fu_heapSort_33671_34135),
    .in1(out_gt_expr_FU_32_32_32_60_i4_fu_heapSort_33671_34038),
    .in2(out_reg_33_reg_33),
    .in3(out_reg_26_reg_26));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_heapSort_33671_34138 (.out1(out_cond_expr_FU_32_32_32_32_59_i1_fu_heapSort_33671_34138),
    .in1(out_gt_expr_FU_32_32_32_60_i4_fu_heapSort_33671_34038),
    .in2(out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0),
    .in3(out_reg_32_reg_32));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_heapSort_33671_34141 (.out1(out_cond_expr_FU_32_32_32_32_59_i2_fu_heapSort_33671_34141),
    .in1(out_gt_expr_FU_32_32_32_60_i1_fu_heapSort_33671_34026),
    .in2(out_reg_9_reg_9),
    .in3(out_reg_3_reg_3));
  ui_cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_heapSort_33671_34144 (.out1(out_ui_cond_expr_FU_32_32_32_32_70_i1_fu_heapSort_33671_34144),
    .in1(out_gt_expr_FU_32_32_32_60_i1_fu_heapSort_33671_34026),
    .in2(out_reg_13_reg_13),
    .in3(out_reg_6_reg_6));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_heapSort_33671_34147 (.out1(out_cond_expr_FU_32_32_32_32_59_i3_fu_heapSort_33671_34147),
    .in1(out_gt_expr_FU_32_32_32_60_i1_fu_heapSort_33671_34026),
    .in2(out_BMEMORY_CTRLN_57_i1_BMEMORY_CTRLN_57_i0),
    .in3(out_reg_12_reg_12));
  gt_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(1)) gt_expr_FU_32_32_32_60_i5 (.out1(out_gt_expr_FU_32_32_32_60_i5_gt_expr_FU_32_32_32_60_i5),
    .in1(out_reg_16_reg_16),
    .in2(out_reg_29_reg_29));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_Wdata_ram0_0 (.out1(sig_in_bus_mergerMout_Wdata_ram0_0),
    .in1(sig_in_vector_bus_mergerMout_Wdata_ram0_0));
  join_signal #(.BITSIZE_in1(32),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(64)) join_signalbus_mergerMout_addr_ram1_0 (.out1(sig_in_bus_mergerMout_addr_ram1_0),
    .in1(sig_in_vector_bus_mergerMout_addr_ram1_0));
  join_signal #(.BITSIZE_in1(6),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(12)) join_signalbus_mergerMout_data_ram_size2_0 (.out1(sig_in_bus_mergerMout_data_ram_size2_0),
    .in1(sig_in_vector_bus_mergerMout_data_ram_size2_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_oe_ram3_0 (.out1(sig_in_bus_mergerMout_oe_ram3_0),
    .in1(sig_in_vector_bus_mergerMout_oe_ram3_0));
  join_signal #(.BITSIZE_in1(1),
    .PORTSIZE_in1(2),
    .BITSIZE_out1(2)) join_signalbus_mergerMout_we_ram4_0 (.out1(sig_in_bus_mergerMout_we_ram4_0),
    .in1(sig_in_vector_bus_mergerMout_we_ram4_0));
  le_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) le_expr_FU_32_0_32_62_i0 (.out1(out_le_expr_FU_32_0_32_62_i0_le_expr_FU_32_0_32_62_i0),
    .in1(out_reg_9_reg_9),
    .in2(out_const_4));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_114_reg_0_0_0_1),
    .wenable(wrenable_reg_0));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_1 (.out1(out_reg_1_reg_1),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_67_i0_fu_heapSort_33671_33713),
    .wenable(wrenable_reg_1));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_10 (.out1(out_reg_10_reg_10),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_116_reg_10_0_0_0),
    .wenable(wrenable_reg_10));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_11 (.out1(out_reg_11_reg_11),
    .clock(clock),
    .reset(reset),
    .in1(out_le_expr_FU_32_0_32_62_i0_le_expr_FU_32_0_32_62_i0),
    .wenable(wrenable_reg_11));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_12 (.out1(out_reg_12_reg_12),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_118_reg_12_0_0_0),
    .wenable(wrenable_reg_12));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_13 (.out1(out_reg_13_reg_13),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i3_fu_heapSort_33671_33782),
    .wenable(wrenable_reg_13));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_14 (.out1(out_reg_14_reg_14),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_120_reg_14_0_0_0),
    .wenable(wrenable_reg_14));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_15 (.out1(out_reg_15_reg_15),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_121_reg_15_0_0_0),
    .wenable(wrenable_reg_15));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_16 (.out1(out_reg_16_reg_16),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_122_reg_16_0_0_0),
    .wenable(wrenable_reg_16));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_17 (.out1(out_reg_17_reg_17),
    .clock(clock),
    .reset(reset),
    .in1(out_plus_expr_FU_32_0_32_67_i1_fu_heapSort_33671_33839),
    .wenable(wrenable_reg_17));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_18 (.out1(out_reg_18_reg_18),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i11_fu_heapSort_33671_34008),
    .wenable(wrenable_reg_18));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_19 (.out1(out_reg_19_reg_19),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_65_i0_fu_heapSort_33671_34042),
    .wenable(wrenable_reg_19));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_2 (.out1(out_reg_2_reg_2),
    .clock(clock),
    .reset(reset),
    .in1(out_ne_expr_FU_32_0_32_64_i0_fu_heapSort_33671_34030),
    .wenable(wrenable_reg_2));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_20 (.out1(out_reg_20_reg_20),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_57_i0_BMEMORY_CTRLN_57_i0),
    .wenable(wrenable_reg_20));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_21 (.out1(out_reg_21_reg_21),
    .clock(clock),
    .reset(reset),
    .in1(out_BMEMORY_CTRLN_57_i1_BMEMORY_CTRLN_57_i0),
    .wenable(wrenable_reg_21));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_22 (.out1(out_reg_22_reg_22),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_129_reg_22_0_0_0),
    .wenable(wrenable_reg_22));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_23 (.out1(out_reg_23_reg_23),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i5_fu_heapSort_33671_33856),
    .wenable(wrenable_reg_23));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_24 (.out1(out_reg_24_reg_24),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_131_reg_24_0_0_0),
    .wenable(wrenable_reg_24));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_25 (.out1(out_reg_25_reg_25),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i6_fu_heapSort_33671_33890),
    .wenable(wrenable_reg_25));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_26 (.out1(out_reg_26_reg_26),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_133_reg_26_0_0_0),
    .wenable(wrenable_reg_26));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_27 (.out1(out_reg_27_reg_27),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i8_fu_heapSort_33671_33914),
    .wenable(wrenable_reg_27));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_28 (.out1(out_reg_28_reg_28),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i9_fu_heapSort_33671_33945),
    .wenable(wrenable_reg_28));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_29 (.out1(out_reg_29_reg_29),
    .clock(clock),
    .reset(reset),
    .in1(out_lshift_expr_FU_32_0_32_63_i5_fu_heapSort_33671_34129),
    .wenable(wrenable_reg_29));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_3 (.out1(out_reg_3_reg_3),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_137_reg_3_0_0_0),
    .wenable(wrenable_reg_3));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_30 (.out1(out_reg_30_reg_30),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_138_reg_30_0_0_0),
    .wenable(wrenable_reg_30));
  register_SE #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) reg_31 (.out1(out_reg_31_reg_31),
    .clock(clock),
    .reset(reset),
    .in1(out_gt_expr_FU_32_32_32_60_i5_gt_expr_FU_32_32_32_60_i5),
    .wenable(wrenable_reg_31));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_32 (.out1(out_reg_32_reg_32),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_140_reg_32_0_0_0),
    .wenable(wrenable_reg_32));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_33 (.out1(out_reg_33_reg_33),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i8_fu_heapSort_33671_33911),
    .wenable(wrenable_reg_33));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_34 (.out1(out_reg_34_reg_34),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_142_reg_34_0_0_0),
    .wenable(wrenable_reg_34));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_35 (.out1(out_reg_35_reg_35),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_143_reg_35_0_0_0),
    .wenable(wrenable_reg_35));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_4 (.out1(out_reg_4_reg_4),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i0_fu_heapSort_33671_33737),
    .wenable(wrenable_reg_4));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_5 (.out1(out_reg_5_reg_5),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i1_fu_heapSort_33671_33761),
    .wenable(wrenable_reg_5));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_6 (.out1(out_reg_6_reg_6),
    .clock(clock),
    .reset(reset),
    .in1(out_MUX_146_reg_6_0_0_0),
    .wenable(wrenable_reg_6));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_7 (.out1(out_reg_7_reg_7),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_lshift_expr_FU_32_0_32_71_i3_fu_heapSort_33671_33785),
    .wenable(wrenable_reg_7));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_8 (.out1(out_reg_8_reg_8),
    .clock(clock),
    .reset(reset),
    .in1(out_ui_pointer_plus_expr_FU_32_32_32_73_i4_fu_heapSort_33671_33808),
    .wenable(wrenable_reg_8));
  register_SE #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_9 (.out1(out_reg_9_reg_9),
    .clock(clock),
    .reset(reset),
    .in1(out_lshift_expr_FU_32_0_32_63_i3_fu_heapSort_33671_34108),
    .wenable(wrenable_reg_9));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_Wdata_ram0_ (.out1(Mout_Wdata_ram),
    .in1(sig_out_bus_mergerMout_Wdata_ram0_));
  split_signal #(.BITSIZE_in1(64),
    .BITSIZE_out1(32),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_addr_ram1_ (.out1(Mout_addr_ram),
    .in1(sig_out_bus_mergerMout_addr_ram1_));
  split_signal #(.BITSIZE_in1(12),
    .BITSIZE_out1(6),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_data_ram_size2_ (.out1(Mout_data_ram_size),
    .in1(sig_out_bus_mergerMout_data_ram_size2_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_oe_ram3_ (.out1(Mout_oe_ram),
    .in1(sig_out_bus_mergerMout_oe_ram3_));
  split_signal #(.BITSIZE_in1(2),
    .BITSIZE_out1(1),
    .PORTSIZE_out1(2)) split_signalbus_mergerMout_we_ram4_ (.out1(Mout_we_ram),
    .in1(sig_out_bus_mergerMout_we_ram4_));
  // io-signal post fix
  assign OUT_CONDITION_heapSort_33671_33696 = out_read_cond_FU_13_i0_fu_heapSort_33671_33696;
  assign OUT_CONDITION_heapSort_33671_33810 = out_read_cond_FU_14_i0_fu_heapSort_33671_33810;
  assign OUT_CONDITION_heapSort_33671_33820 = out_read_cond_FU_15_i0_fu_heapSort_33671_33820;
  assign OUT_CONDITION_heapSort_33671_33824 = out_read_cond_FU_22_i0_fu_heapSort_33671_33824;
  assign OUT_CONDITION_heapSort_33671_33826 = out_read_cond_FU_23_i0_fu_heapSort_33671_33826;
  assign OUT_CONDITION_heapSort_33671_33941 = out_read_cond_FU_43_i0_fu_heapSort_33671_33941;
  assign OUT_CONDITION_heapSort_33671_33947 = out_read_cond_FU_44_i0_fu_heapSort_33671_33947;
  assign OUT_CONDITION_heapSort_33671_33957 = out_read_cond_FU_45_i0_fu_heapSort_33671_33957;
  assign OUT_CONDITION_heapSort_33671_33961 = out_read_cond_FU_52_i0_fu_heapSort_33671_33961;
  assign OUT_CONDITION_heapSort_33671_33963 = out_read_cond_FU_53_i0_fu_heapSort_33671_33963;
  assign OUT_CONDITION_heapSort_33671_33966 = out_read_cond_FU_55_i0_fu_heapSort_33671_33966;
  assign OUT_CONDITION_heapSort_33671_33968 = out_read_cond_FU_56_i0_fu_heapSort_33671_33968;

endmodule

// FSM based controller description for heapSort
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_heapSort(done_port,
  fuselector_BMEMORY_CTRLN_57_i0_LOAD,
  fuselector_BMEMORY_CTRLN_57_i0_STORE,
  fuselector_BMEMORY_CTRLN_57_i1_LOAD,
  fuselector_BMEMORY_CTRLN_57_i1_STORE,
  selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0,
  selector_MUX_114_reg_0_0_0_0,
  selector_MUX_114_reg_0_0_0_1,
  selector_MUX_116_reg_10_0_0_0,
  selector_MUX_118_reg_12_0_0_0,
  selector_MUX_120_reg_14_0_0_0,
  selector_MUX_121_reg_15_0_0_0,
  selector_MUX_122_reg_16_0_0_0,
  selector_MUX_129_reg_22_0_0_0,
  selector_MUX_131_reg_24_0_0_0,
  selector_MUX_133_reg_26_0_0_0,
  selector_MUX_137_reg_3_0_0_0,
  selector_MUX_138_reg_30_0_0_0,
  selector_MUX_140_reg_32_0_0_0,
  selector_MUX_142_reg_34_0_0_0,
  selector_MUX_143_reg_35_0_0_0,
  selector_MUX_146_reg_6_0_0_0,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1,
  selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0,
  selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0,
  selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1,
  selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1,
  selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0,
  wrenable_reg_0,
  wrenable_reg_1,
  wrenable_reg_10,
  wrenable_reg_11,
  wrenable_reg_12,
  wrenable_reg_13,
  wrenable_reg_14,
  wrenable_reg_15,
  wrenable_reg_16,
  wrenable_reg_17,
  wrenable_reg_18,
  wrenable_reg_19,
  wrenable_reg_2,
  wrenable_reg_20,
  wrenable_reg_21,
  wrenable_reg_22,
  wrenable_reg_23,
  wrenable_reg_24,
  wrenable_reg_25,
  wrenable_reg_26,
  wrenable_reg_27,
  wrenable_reg_28,
  wrenable_reg_29,
  wrenable_reg_3,
  wrenable_reg_30,
  wrenable_reg_31,
  wrenable_reg_32,
  wrenable_reg_33,
  wrenable_reg_34,
  wrenable_reg_35,
  wrenable_reg_4,
  wrenable_reg_5,
  wrenable_reg_6,
  wrenable_reg_7,
  wrenable_reg_8,
  wrenable_reg_9,
  OUT_CONDITION_heapSort_33671_33696,
  OUT_CONDITION_heapSort_33671_33810,
  OUT_CONDITION_heapSort_33671_33820,
  OUT_CONDITION_heapSort_33671_33824,
  OUT_CONDITION_heapSort_33671_33826,
  OUT_CONDITION_heapSort_33671_33941,
  OUT_CONDITION_heapSort_33671_33947,
  OUT_CONDITION_heapSort_33671_33957,
  OUT_CONDITION_heapSort_33671_33961,
  OUT_CONDITION_heapSort_33671_33963,
  OUT_CONDITION_heapSort_33671_33966,
  OUT_CONDITION_heapSort_33671_33968,
  clock,
  reset,
  start_port);
  // IN
  input OUT_CONDITION_heapSort_33671_33696;
  input OUT_CONDITION_heapSort_33671_33810;
  input OUT_CONDITION_heapSort_33671_33820;
  input OUT_CONDITION_heapSort_33671_33824;
  input OUT_CONDITION_heapSort_33671_33826;
  input OUT_CONDITION_heapSort_33671_33941;
  input OUT_CONDITION_heapSort_33671_33947;
  input OUT_CONDITION_heapSort_33671_33957;
  input OUT_CONDITION_heapSort_33671_33961;
  input OUT_CONDITION_heapSort_33671_33963;
  input OUT_CONDITION_heapSort_33671_33966;
  input OUT_CONDITION_heapSort_33671_33968;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output fuselector_BMEMORY_CTRLN_57_i0_LOAD;
  output fuselector_BMEMORY_CTRLN_57_i0_STORE;
  output fuselector_BMEMORY_CTRLN_57_i1_LOAD;
  output fuselector_BMEMORY_CTRLN_57_i1_STORE;
  output selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0;
  output selector_MUX_114_reg_0_0_0_0;
  output selector_MUX_114_reg_0_0_0_1;
  output selector_MUX_116_reg_10_0_0_0;
  output selector_MUX_118_reg_12_0_0_0;
  output selector_MUX_120_reg_14_0_0_0;
  output selector_MUX_121_reg_15_0_0_0;
  output selector_MUX_122_reg_16_0_0_0;
  output selector_MUX_129_reg_22_0_0_0;
  output selector_MUX_131_reg_24_0_0_0;
  output selector_MUX_133_reg_26_0_0_0;
  output selector_MUX_137_reg_3_0_0_0;
  output selector_MUX_138_reg_30_0_0_0;
  output selector_MUX_140_reg_32_0_0_0;
  output selector_MUX_142_reg_34_0_0_0;
  output selector_MUX_143_reg_35_0_0_0;
  output selector_MUX_146_reg_6_0_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0;
  output selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1;
  output selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2;
  output selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3;
  output selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0;
  output selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1;
  output selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0;
  output selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0;
  output selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1;
  output selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0;
  output selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0;
  output selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1;
  output selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2;
  output selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3;
  output selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0;
  output selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1;
  output selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0;
  output wrenable_reg_0;
  output wrenable_reg_1;
  output wrenable_reg_10;
  output wrenable_reg_11;
  output wrenable_reg_12;
  output wrenable_reg_13;
  output wrenable_reg_14;
  output wrenable_reg_15;
  output wrenable_reg_16;
  output wrenable_reg_17;
  output wrenable_reg_18;
  output wrenable_reg_19;
  output wrenable_reg_2;
  output wrenable_reg_20;
  output wrenable_reg_21;
  output wrenable_reg_22;
  output wrenable_reg_23;
  output wrenable_reg_24;
  output wrenable_reg_25;
  output wrenable_reg_26;
  output wrenable_reg_27;
  output wrenable_reg_28;
  output wrenable_reg_29;
  output wrenable_reg_3;
  output wrenable_reg_30;
  output wrenable_reg_31;
  output wrenable_reg_32;
  output wrenable_reg_33;
  output wrenable_reg_34;
  output wrenable_reg_35;
  output wrenable_reg_4;
  output wrenable_reg_5;
  output wrenable_reg_6;
  output wrenable_reg_7;
  output wrenable_reg_8;
  output wrenable_reg_9;
  parameter [36:0] S_0 = 37'b0000000000000000000000000000000000001,
    S_13 = 37'b0000000000000000000000010000000000000,
    S_1 = 37'b0000000000000000000000000000000000010,
    S_2 = 37'b0000000000000000000000000000000000100,
    S_3 = 37'b0000000000000000000000000000000001000,
    S_31 = 37'b0000010000000000000000000000000000000,
    S_32 = 37'b0000100000000000000000000000000000000,
    S_33 = 37'b0001000000000000000000000000000000000,
    S_4 = 37'b0000000000000000000000000000000010000,
    S_5 = 37'b0000000000000000000000000000000100000,
    S_6 = 37'b0000000000000000000000000000001000000,
    S_7 = 37'b0000000000000000000000000000010000000,
    S_12 = 37'b0000000000000000000000001000000000000,
    S_14 = 37'b0000000000000000000000100000000000000,
    S_15 = 37'b0000000000000000000001000000000000000,
    S_16 = 37'b0000000000000000000010000000000000000,
    S_17 = 37'b0000000000000000000100000000000000000,
    S_18 = 37'b0000000000000000001000000000000000000,
    S_19 = 37'b0000000000000000010000000000000000000,
    S_20 = 37'b0000000000000000100000000000000000000,
    S_34 = 37'b0010000000000000000000000000000000000,
    S_35 = 37'b0100000000000000000000000000000000000,
    S_36 = 37'b1000000000000000000000000000000000000,
    S_21 = 37'b0000000000000001000000000000000000000,
    S_22 = 37'b0000000000000010000000000000000000000,
    S_23 = 37'b0000000000000100000000000000000000000,
    S_24 = 37'b0000000000001000000000000000000000000,
    S_29 = 37'b0000000100000000000000000000000000000,
    S_30 = 37'b0000001000000000000000000000000000000,
    S_25 = 37'b0000000000010000000000000000000000000,
    S_26 = 37'b0000000000100000000000000000000000000,
    S_27 = 37'b0000000001000000000000000000000000000,
    S_28 = 37'b0000000010000000000000000000000000000,
    S_8 = 37'b0000000000000000000000000000100000000,
    S_9 = 37'b0000000000000000000000000001000000000,
    S_10 = 37'b0000000000000000000000000010000000000,
    S_11 = 37'b0000000000000000000000000100000000000;
  reg [36:0] _present_state=S_0, _next_state;
  reg done_port;
  reg fuselector_BMEMORY_CTRLN_57_i0_LOAD;
  reg fuselector_BMEMORY_CTRLN_57_i0_STORE;
  reg fuselector_BMEMORY_CTRLN_57_i1_LOAD;
  reg fuselector_BMEMORY_CTRLN_57_i1_STORE;
  reg selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0;
  reg selector_MUX_114_reg_0_0_0_0;
  reg selector_MUX_114_reg_0_0_0_1;
  reg selector_MUX_116_reg_10_0_0_0;
  reg selector_MUX_118_reg_12_0_0_0;
  reg selector_MUX_120_reg_14_0_0_0;
  reg selector_MUX_121_reg_15_0_0_0;
  reg selector_MUX_122_reg_16_0_0_0;
  reg selector_MUX_129_reg_22_0_0_0;
  reg selector_MUX_131_reg_24_0_0_0;
  reg selector_MUX_133_reg_26_0_0_0;
  reg selector_MUX_137_reg_3_0_0_0;
  reg selector_MUX_138_reg_30_0_0_0;
  reg selector_MUX_140_reg_32_0_0_0;
  reg selector_MUX_142_reg_34_0_0_0;
  reg selector_MUX_143_reg_35_0_0_0;
  reg selector_MUX_146_reg_6_0_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0;
  reg selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1;
  reg selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2;
  reg selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3;
  reg selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0;
  reg selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1;
  reg selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0;
  reg selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0;
  reg selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1;
  reg selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0;
  reg selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0;
  reg selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1;
  reg selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2;
  reg selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3;
  reg selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0;
  reg selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1;
  reg selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0;
  reg wrenable_reg_0;
  reg wrenable_reg_1;
  reg wrenable_reg_10;
  reg wrenable_reg_11;
  reg wrenable_reg_12;
  reg wrenable_reg_13;
  reg wrenable_reg_14;
  reg wrenable_reg_15;
  reg wrenable_reg_16;
  reg wrenable_reg_17;
  reg wrenable_reg_18;
  reg wrenable_reg_19;
  reg wrenable_reg_2;
  reg wrenable_reg_20;
  reg wrenable_reg_21;
  reg wrenable_reg_22;
  reg wrenable_reg_23;
  reg wrenable_reg_24;
  reg wrenable_reg_25;
  reg wrenable_reg_26;
  reg wrenable_reg_27;
  reg wrenable_reg_28;
  reg wrenable_reg_29;
  reg wrenable_reg_3;
  reg wrenable_reg_30;
  reg wrenable_reg_31;
  reg wrenable_reg_32;
  reg wrenable_reg_33;
  reg wrenable_reg_34;
  reg wrenable_reg_35;
  reg wrenable_reg_4;
  reg wrenable_reg_5;
  reg wrenable_reg_6;
  reg wrenable_reg_7;
  reg wrenable_reg_8;
  reg wrenable_reg_9;

  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;

  always @(*)
  begin
    done_port = 1'b0;
    fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_57_i0_STORE = 1'b0;
    fuselector_BMEMORY_CTRLN_57_i1_LOAD = 1'b0;
    fuselector_BMEMORY_CTRLN_57_i1_STORE = 1'b0;
    selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0 = 1'b0;
    selector_MUX_114_reg_0_0_0_0 = 1'b0;
    selector_MUX_114_reg_0_0_0_1 = 1'b0;
    selector_MUX_116_reg_10_0_0_0 = 1'b0;
    selector_MUX_118_reg_12_0_0_0 = 1'b0;
    selector_MUX_120_reg_14_0_0_0 = 1'b0;
    selector_MUX_121_reg_15_0_0_0 = 1'b0;
    selector_MUX_122_reg_16_0_0_0 = 1'b0;
    selector_MUX_129_reg_22_0_0_0 = 1'b0;
    selector_MUX_131_reg_24_0_0_0 = 1'b0;
    selector_MUX_133_reg_26_0_0_0 = 1'b0;
    selector_MUX_137_reg_3_0_0_0 = 1'b0;
    selector_MUX_138_reg_30_0_0_0 = 1'b0;
    selector_MUX_140_reg_32_0_0_0 = 1'b0;
    selector_MUX_142_reg_34_0_0_0 = 1'b0;
    selector_MUX_143_reg_35_0_0_0 = 1'b0;
    selector_MUX_146_reg_6_0_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1 = 1'b0;
    selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1 = 1'b0;
    selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1 = 1'b0;
    selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    wrenable_reg_1 = 1'b0;
    wrenable_reg_10 = 1'b0;
    wrenable_reg_11 = 1'b0;
    wrenable_reg_12 = 1'b0;
    wrenable_reg_13 = 1'b0;
    wrenable_reg_14 = 1'b0;
    wrenable_reg_15 = 1'b0;
    wrenable_reg_16 = 1'b0;
    wrenable_reg_17 = 1'b0;
    wrenable_reg_18 = 1'b0;
    wrenable_reg_19 = 1'b0;
    wrenable_reg_2 = 1'b0;
    wrenable_reg_20 = 1'b0;
    wrenable_reg_21 = 1'b0;
    wrenable_reg_22 = 1'b0;
    wrenable_reg_23 = 1'b0;
    wrenable_reg_24 = 1'b0;
    wrenable_reg_25 = 1'b0;
    wrenable_reg_26 = 1'b0;
    wrenable_reg_27 = 1'b0;
    wrenable_reg_28 = 1'b0;
    wrenable_reg_29 = 1'b0;
    wrenable_reg_3 = 1'b0;
    wrenable_reg_30 = 1'b0;
    wrenable_reg_31 = 1'b0;
    wrenable_reg_32 = 1'b0;
    wrenable_reg_33 = 1'b0;
    wrenable_reg_34 = 1'b0;
    wrenable_reg_35 = 1'b0;
    wrenable_reg_4 = 1'b0;
    wrenable_reg_5 = 1'b0;
    wrenable_reg_6 = 1'b0;
    wrenable_reg_7 = 1'b0;
    wrenable_reg_8 = 1'b0;
    wrenable_reg_9 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          selector_MUX_114_reg_0_0_0_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          _next_state = S_13;
        end
        else
        begin
          _next_state = S_0;
        end
      S_13 :
        begin
          wrenable_reg_1 = 1'b1;
          wrenable_reg_2 = 1'b1;
          _next_state = S_1;
        end
      S_1 :
        begin
          wrenable_reg_3 = 1'b1;
          wrenable_reg_4 = 1'b1;
          wrenable_reg_5 = 1'b1;
          wrenable_reg_6 = 1'b1;
          wrenable_reg_7 = 1'b1;
          wrenable_reg_8 = 1'b1;
          wrenable_reg_9 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33696 == 1'b1)
            begin
              _next_state = S_2;
            end
          else
            begin
              _next_state = S_31;
              wrenable_reg_3 = 1'b0;
              wrenable_reg_5 = 1'b0;
              wrenable_reg_8 = 1'b0;
            end
        end
      S_2 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_57_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_11 = 1'b1;
          _next_state = S_3;
        end
      S_3 :
        begin
          wrenable_reg_20 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33810 == 1'b1)
            begin
              _next_state = S_4;
            end
          else
            begin
              _next_state = S_31;
              wrenable_reg_20 = 1'b0;
            end
        end
      S_31 :
        begin
          if (OUT_CONDITION_heapSort_33671_33966 == 1'b1)
            begin
              _next_state = S_32;
            end
          else
            begin
              _next_state = S_12;
            end
        end
      S_32 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0 = 1'b1;
          _next_state = S_33;
        end
      S_33 :
        begin
          selector_MUX_137_reg_3_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_3 = 1'b1;
          _next_state = S_5;
        end
      S_4 :
        begin
          selector_MUX_118_reg_12_0_0_0 = 1'b1;
          selector_MUX_120_reg_14_0_0_0 = 1'b1;
          selector_MUX_121_reg_15_0_0_0 = 1'b1;
          selector_MUX_146_reg_6_0_0_0 = 1'b1;
          wrenable_reg_12 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          wrenable_reg_6 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33820 == 1'b1)
            begin
              _next_state = S_5;
              selector_MUX_120_reg_14_0_0_0 = 1'b0;
              selector_MUX_121_reg_15_0_0_0 = 1'b0;
              wrenable_reg_14 = 1'b0;
              wrenable_reg_15 = 1'b0;
            end
          else
            begin
              _next_state = S_7;
              selector_MUX_118_reg_12_0_0_0 = 1'b0;
              selector_MUX_146_reg_6_0_0_0 = 1'b0;
              wrenable_reg_12 = 1'b0;
              wrenable_reg_6 = 1'b0;
            end
        end
      S_5 :
        begin
          fuselector_BMEMORY_CTRLN_57_i1_LOAD = 1'b1;
          wrenable_reg_13 = 1'b1;
          _next_state = S_6;
        end
      S_6 :
        begin
          selector_MUX_116_reg_10_0_0_0 = 1'b1;
          wrenable_reg_10 = 1'b1;
          wrenable_reg_14 = 1'b1;
          wrenable_reg_15 = 1'b1;
          _next_state = S_7;
        end
      S_7 :
        begin
          if (OUT_CONDITION_heapSort_33671_33824 == 1'b1)
            begin
              _next_state = S_8;
            end
          else
            begin
              _next_state = S_12;
            end
        end
      S_12 :
        begin
          wrenable_reg_0 = 1'b1;
          wrenable_reg_16 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33826 == 1'b1)
            begin
              _next_state = S_13;
              wrenable_reg_16 = 1'b0;
            end
          else
            begin
              _next_state = S_14;
              wrenable_reg_0 = 1'b0;
            end
        end
      S_14 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_57_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3 = 1'b1;
          wrenable_reg_17 = 1'b1;
          wrenable_reg_18 = 1'b1;
          wrenable_reg_19 = 1'b1;
          _next_state = S_15;
        end
      S_15 :
        begin
          wrenable_reg_20 = 1'b1;
          wrenable_reg_21 = 1'b1;
          _next_state = S_16;
        end
      S_16 :
        begin
          fuselector_BMEMORY_CTRLN_57_i1_STORE = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1 = 1'b1;
          _next_state = S_17;
        end
      S_17 :
        begin
          fuselector_BMEMORY_CTRLN_57_i1_STORE = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0 = 1'b1;
          wrenable_reg_22 = 1'b1;
          _next_state = S_18;
        end
      S_18 :
        begin
          wrenable_reg_23 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_25 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_27 = 1'b1;
          wrenable_reg_28 = 1'b1;
          wrenable_reg_29 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33941 == 1'b1)
            begin
              _next_state = S_19;
            end
          else
            begin
              _next_state = S_34;
              wrenable_reg_24 = 1'b0;
              wrenable_reg_25 = 1'b0;
              wrenable_reg_28 = 1'b0;
            end
        end
      S_19 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b1;
          fuselector_BMEMORY_CTRLN_57_i1_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_31 = 1'b1;
          _next_state = S_20;
        end
      S_20 :
        begin
          wrenable_reg_20 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33947 == 1'b1)
            begin
              _next_state = S_21;
            end
          else
            begin
              _next_state = S_34;
              wrenable_reg_20 = 1'b0;
            end
        end
      S_34 :
        begin
          if (OUT_CONDITION_heapSort_33671_33968 == 1'b1)
            begin
              _next_state = S_35;
            end
          else
            begin
              _next_state = S_29;
            end
        end
      S_35 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0 = 1'b1;
          _next_state = S_36;
        end
      S_36 :
        begin
          selector_MUX_131_reg_24_0_0_0 = 1'b1;
          wrenable_reg_24 = 1'b1;
          wrenable_reg_32 = 1'b1;
          _next_state = S_22;
        end
      S_21 :
        begin
          selector_MUX_133_reg_26_0_0_0 = 1'b1;
          selector_MUX_140_reg_32_0_0_0 = 1'b1;
          selector_MUX_142_reg_34_0_0_0 = 1'b1;
          selector_MUX_143_reg_35_0_0_0 = 1'b1;
          wrenable_reg_26 = 1'b1;
          wrenable_reg_32 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33957 == 1'b1)
            begin
              _next_state = S_22;
              selector_MUX_142_reg_34_0_0_0 = 1'b0;
              selector_MUX_143_reg_35_0_0_0 = 1'b0;
              wrenable_reg_34 = 1'b0;
              wrenable_reg_35 = 1'b0;
            end
          else
            begin
              _next_state = S_24;
              selector_MUX_133_reg_26_0_0_0 = 1'b0;
              selector_MUX_140_reg_32_0_0_0 = 1'b0;
              wrenable_reg_26 = 1'b0;
              wrenable_reg_32 = 1'b0;
            end
        end
      S_22 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b1;
          wrenable_reg_33 = 1'b1;
          _next_state = S_23;
        end
      S_23 :
        begin
          selector_MUX_138_reg_30_0_0_0 = 1'b1;
          wrenable_reg_30 = 1'b1;
          wrenable_reg_34 = 1'b1;
          wrenable_reg_35 = 1'b1;
          _next_state = S_24;
        end
      S_24 :
        begin
          if (OUT_CONDITION_heapSort_33671_33961 == 1'b1)
            begin
              _next_state = S_25;
            end
          else
            begin
              _next_state = S_29;
            end
        end
      S_29 :
        begin
          selector_MUX_122_reg_16_0_0_0 = 1'b1;
          wrenable_reg_16 = 1'b1;
          if (OUT_CONDITION_heapSort_33671_33963 == 1'b1)
            begin
              _next_state = S_14;
            end
          else
            begin
              _next_state = S_30;
              done_port = 1'b1;
              selector_MUX_122_reg_16_0_0_0 = 1'b0;
              wrenable_reg_16 = 1'b0;
            end
        end
      S_30 :
        begin
          _next_state = S_0;
        end
      S_25 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_LOAD = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0 = 1'b1;
          _next_state = S_26;
        end
      S_26 :
        begin
          wrenable_reg_20 = 1'b1;
          _next_state = S_27;
        end
      S_27 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_STORE = 1'b1;
          selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0 = 1'b1;
          _next_state = S_28;
        end
      S_28 :
        begin
          fuselector_BMEMORY_CTRLN_57_i0_STORE = 1'b1;
          selector_MUX_129_reg_22_0_0_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0 = 1'b1;
          selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0 = 1'b1;
          wrenable_reg_22 = 1'b1;
          _next_state = S_18;
        end
      S_8 :
        begin
          fuselector_BMEMORY_CTRLN_57_i1_LOAD = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0 = 1'b1;
          _next_state = S_9;
        end
      S_9 :
        begin
          wrenable_reg_21 = 1'b1;
          _next_state = S_10;
        end
      S_10 :
        begin
          fuselector_BMEMORY_CTRLN_57_i1_STORE = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0 = 1'b1;
          _next_state = S_11;
        end
      S_11 :
        begin
          fuselector_BMEMORY_CTRLN_57_i1_STORE = 1'b1;
          selector_MUX_114_reg_0_0_0_0 = 1'b1;
          selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2 = 1'b1;
          selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1 = 1'b1;
          wrenable_reg_0 = 1'b1;
          _next_state = S_1;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;

  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for heapSort
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _heapSort(clock,
  reset,
  start_port,
  done_port,
  A,
  M_Rdata_ram,
  M_DataRdy,
  Min_oe_ram,
  Min_we_ram,
  Min_addr_ram,
  Min_Wdata_ram,
  Min_data_ram_size,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  input [1:0] Min_oe_ram;
  input [1:0] Min_we_ram;
  input [63:0] Min_addr_ram;
  input [63:0] Min_Wdata_ram;
  input [11:0] Min_data_ram_size;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations
  wire OUT_CONDITION_heapSort_33671_33696;
  wire OUT_CONDITION_heapSort_33671_33810;
  wire OUT_CONDITION_heapSort_33671_33820;
  wire OUT_CONDITION_heapSort_33671_33824;
  wire OUT_CONDITION_heapSort_33671_33826;
  wire OUT_CONDITION_heapSort_33671_33941;
  wire OUT_CONDITION_heapSort_33671_33947;
  wire OUT_CONDITION_heapSort_33671_33957;
  wire OUT_CONDITION_heapSort_33671_33961;
  wire OUT_CONDITION_heapSort_33671_33963;
  wire OUT_CONDITION_heapSort_33671_33966;
  wire OUT_CONDITION_heapSort_33671_33968;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire fuselector_BMEMORY_CTRLN_57_i0_LOAD;
  wire fuselector_BMEMORY_CTRLN_57_i0_STORE;
  wire fuselector_BMEMORY_CTRLN_57_i1_LOAD;
  wire fuselector_BMEMORY_CTRLN_57_i1_STORE;
  wire selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0;
  wire selector_MUX_114_reg_0_0_0_0;
  wire selector_MUX_114_reg_0_0_0_1;
  wire selector_MUX_116_reg_10_0_0_0;
  wire selector_MUX_118_reg_12_0_0_0;
  wire selector_MUX_120_reg_14_0_0_0;
  wire selector_MUX_121_reg_15_0_0_0;
  wire selector_MUX_122_reg_16_0_0_0;
  wire selector_MUX_129_reg_22_0_0_0;
  wire selector_MUX_131_reg_24_0_0_0;
  wire selector_MUX_133_reg_26_0_0_0;
  wire selector_MUX_137_reg_3_0_0_0;
  wire selector_MUX_138_reg_30_0_0_0;
  wire selector_MUX_140_reg_32_0_0_0;
  wire selector_MUX_142_reg_34_0_0_0;
  wire selector_MUX_143_reg_35_0_0_0;
  wire selector_MUX_146_reg_6_0_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0;
  wire selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1;
  wire selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2;
  wire selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3;
  wire selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0;
  wire selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1;
  wire selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0;
  wire selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0;
  wire selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1;
  wire selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0;
  wire selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0;
  wire selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1;
  wire selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2;
  wire selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3;
  wire selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0;
  wire selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1;
  wire selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0;
  wire wrenable_reg_0;
  wire wrenable_reg_1;
  wire wrenable_reg_10;
  wire wrenable_reg_11;
  wire wrenable_reg_12;
  wire wrenable_reg_13;
  wire wrenable_reg_14;
  wire wrenable_reg_15;
  wire wrenable_reg_16;
  wire wrenable_reg_17;
  wire wrenable_reg_18;
  wire wrenable_reg_19;
  wire wrenable_reg_2;
  wire wrenable_reg_20;
  wire wrenable_reg_21;
  wire wrenable_reg_22;
  wire wrenable_reg_23;
  wire wrenable_reg_24;
  wire wrenable_reg_25;
  wire wrenable_reg_26;
  wire wrenable_reg_27;
  wire wrenable_reg_28;
  wire wrenable_reg_29;
  wire wrenable_reg_3;
  wire wrenable_reg_30;
  wire wrenable_reg_31;
  wire wrenable_reg_32;
  wire wrenable_reg_33;
  wire wrenable_reg_34;
  wire wrenable_reg_35;
  wire wrenable_reg_4;
  wire wrenable_reg_5;
  wire wrenable_reg_6;
  wire wrenable_reg_7;
  wire wrenable_reg_8;
  wire wrenable_reg_9;

  controller_heapSort Controller_i (.done_port(done_delayed_REG_signal_in),
    .fuselector_BMEMORY_CTRLN_57_i0_LOAD(fuselector_BMEMORY_CTRLN_57_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_57_i0_STORE(fuselector_BMEMORY_CTRLN_57_i0_STORE),
    .fuselector_BMEMORY_CTRLN_57_i1_LOAD(fuselector_BMEMORY_CTRLN_57_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_57_i1_STORE(fuselector_BMEMORY_CTRLN_57_i1_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0),
    .selector_MUX_114_reg_0_0_0_0(selector_MUX_114_reg_0_0_0_0),
    .selector_MUX_114_reg_0_0_0_1(selector_MUX_114_reg_0_0_0_1),
    .selector_MUX_116_reg_10_0_0_0(selector_MUX_116_reg_10_0_0_0),
    .selector_MUX_118_reg_12_0_0_0(selector_MUX_118_reg_12_0_0_0),
    .selector_MUX_120_reg_14_0_0_0(selector_MUX_120_reg_14_0_0_0),
    .selector_MUX_121_reg_15_0_0_0(selector_MUX_121_reg_15_0_0_0),
    .selector_MUX_122_reg_16_0_0_0(selector_MUX_122_reg_16_0_0_0),
    .selector_MUX_129_reg_22_0_0_0(selector_MUX_129_reg_22_0_0_0),
    .selector_MUX_131_reg_24_0_0_0(selector_MUX_131_reg_24_0_0_0),
    .selector_MUX_133_reg_26_0_0_0(selector_MUX_133_reg_26_0_0_0),
    .selector_MUX_137_reg_3_0_0_0(selector_MUX_137_reg_3_0_0_0),
    .selector_MUX_138_reg_30_0_0_0(selector_MUX_138_reg_30_0_0_0),
    .selector_MUX_140_reg_32_0_0_0(selector_MUX_140_reg_32_0_0_0),
    .selector_MUX_142_reg_34_0_0_0(selector_MUX_142_reg_34_0_0_0),
    .selector_MUX_143_reg_35_0_0_0(selector_MUX_143_reg_35_0_0_0),
    .selector_MUX_146_reg_6_0_0_0(selector_MUX_146_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0),
    .selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9),
    .OUT_CONDITION_heapSort_33671_33696(OUT_CONDITION_heapSort_33671_33696),
    .OUT_CONDITION_heapSort_33671_33810(OUT_CONDITION_heapSort_33671_33810),
    .OUT_CONDITION_heapSort_33671_33820(OUT_CONDITION_heapSort_33671_33820),
    .OUT_CONDITION_heapSort_33671_33824(OUT_CONDITION_heapSort_33671_33824),
    .OUT_CONDITION_heapSort_33671_33826(OUT_CONDITION_heapSort_33671_33826),
    .OUT_CONDITION_heapSort_33671_33941(OUT_CONDITION_heapSort_33671_33941),
    .OUT_CONDITION_heapSort_33671_33947(OUT_CONDITION_heapSort_33671_33947),
    .OUT_CONDITION_heapSort_33671_33957(OUT_CONDITION_heapSort_33671_33957),
    .OUT_CONDITION_heapSort_33671_33961(OUT_CONDITION_heapSort_33671_33961),
    .OUT_CONDITION_heapSort_33671_33963(OUT_CONDITION_heapSort_33671_33963),
    .OUT_CONDITION_heapSort_33671_33966(OUT_CONDITION_heapSort_33671_33966),
    .OUT_CONDITION_heapSort_33671_33968(OUT_CONDITION_heapSort_33671_33968),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_heapSort Datapath_i (.Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .OUT_CONDITION_heapSort_33671_33696(OUT_CONDITION_heapSort_33671_33696),
    .OUT_CONDITION_heapSort_33671_33810(OUT_CONDITION_heapSort_33671_33810),
    .OUT_CONDITION_heapSort_33671_33820(OUT_CONDITION_heapSort_33671_33820),
    .OUT_CONDITION_heapSort_33671_33824(OUT_CONDITION_heapSort_33671_33824),
    .OUT_CONDITION_heapSort_33671_33826(OUT_CONDITION_heapSort_33671_33826),
    .OUT_CONDITION_heapSort_33671_33941(OUT_CONDITION_heapSort_33671_33941),
    .OUT_CONDITION_heapSort_33671_33947(OUT_CONDITION_heapSort_33671_33947),
    .OUT_CONDITION_heapSort_33671_33957(OUT_CONDITION_heapSort_33671_33957),
    .OUT_CONDITION_heapSort_33671_33961(OUT_CONDITION_heapSort_33671_33961),
    .OUT_CONDITION_heapSort_33671_33963(OUT_CONDITION_heapSort_33671_33963),
    .OUT_CONDITION_heapSort_33671_33966(OUT_CONDITION_heapSort_33671_33966),
    .OUT_CONDITION_heapSort_33671_33968(OUT_CONDITION_heapSort_33671_33968),
    .clock(clock),
    .reset(reset),
    .in_port_A(A),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram(Min_oe_ram),
    .Min_we_ram(Min_we_ram),
    .Min_addr_ram(Min_addr_ram),
    .Min_Wdata_ram(Min_Wdata_ram),
    .Min_data_ram_size(Min_data_ram_size),
    .fuselector_BMEMORY_CTRLN_57_i0_LOAD(fuselector_BMEMORY_CTRLN_57_i0_LOAD),
    .fuselector_BMEMORY_CTRLN_57_i0_STORE(fuselector_BMEMORY_CTRLN_57_i0_STORE),
    .fuselector_BMEMORY_CTRLN_57_i1_LOAD(fuselector_BMEMORY_CTRLN_57_i1_LOAD),
    .fuselector_BMEMORY_CTRLN_57_i1_STORE(fuselector_BMEMORY_CTRLN_57_i1_STORE),
    .selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0(selector_MUX_0_BMEMORY_CTRLN_57_i0_0_0_0),
    .selector_MUX_114_reg_0_0_0_0(selector_MUX_114_reg_0_0_0_0),
    .selector_MUX_114_reg_0_0_0_1(selector_MUX_114_reg_0_0_0_1),
    .selector_MUX_116_reg_10_0_0_0(selector_MUX_116_reg_10_0_0_0),
    .selector_MUX_118_reg_12_0_0_0(selector_MUX_118_reg_12_0_0_0),
    .selector_MUX_120_reg_14_0_0_0(selector_MUX_120_reg_14_0_0_0),
    .selector_MUX_121_reg_15_0_0_0(selector_MUX_121_reg_15_0_0_0),
    .selector_MUX_122_reg_16_0_0_0(selector_MUX_122_reg_16_0_0_0),
    .selector_MUX_129_reg_22_0_0_0(selector_MUX_129_reg_22_0_0_0),
    .selector_MUX_131_reg_24_0_0_0(selector_MUX_131_reg_24_0_0_0),
    .selector_MUX_133_reg_26_0_0_0(selector_MUX_133_reg_26_0_0_0),
    .selector_MUX_137_reg_3_0_0_0(selector_MUX_137_reg_3_0_0_0),
    .selector_MUX_138_reg_30_0_0_0(selector_MUX_138_reg_30_0_0_0),
    .selector_MUX_140_reg_32_0_0_0(selector_MUX_140_reg_32_0_0_0),
    .selector_MUX_142_reg_34_0_0_0(selector_MUX_142_reg_34_0_0_0),
    .selector_MUX_143_reg_35_0_0_0(selector_MUX_143_reg_35_0_0_0),
    .selector_MUX_146_reg_6_0_0_0(selector_MUX_146_reg_6_0_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_0),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_1),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_2),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_0_3),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_0),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_1_1),
    .selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0(selector_MUX_1_BMEMORY_CTRLN_57_i0_1_2_0),
    .selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_0),
    .selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_0_1),
    .selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0(selector_MUX_4_BMEMORY_CTRLN_57_i1_0_1_0),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_0),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_1),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_2),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_0_3),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_0),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_1_1),
    .selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0(selector_MUX_5_BMEMORY_CTRLN_57_i1_1_2_0),
    .wrenable_reg_0(wrenable_reg_0),
    .wrenable_reg_1(wrenable_reg_1),
    .wrenable_reg_10(wrenable_reg_10),
    .wrenable_reg_11(wrenable_reg_11),
    .wrenable_reg_12(wrenable_reg_12),
    .wrenable_reg_13(wrenable_reg_13),
    .wrenable_reg_14(wrenable_reg_14),
    .wrenable_reg_15(wrenable_reg_15),
    .wrenable_reg_16(wrenable_reg_16),
    .wrenable_reg_17(wrenable_reg_17),
    .wrenable_reg_18(wrenable_reg_18),
    .wrenable_reg_19(wrenable_reg_19),
    .wrenable_reg_2(wrenable_reg_2),
    .wrenable_reg_20(wrenable_reg_20),
    .wrenable_reg_21(wrenable_reg_21),
    .wrenable_reg_22(wrenable_reg_22),
    .wrenable_reg_23(wrenable_reg_23),
    .wrenable_reg_24(wrenable_reg_24),
    .wrenable_reg_25(wrenable_reg_25),
    .wrenable_reg_26(wrenable_reg_26),
    .wrenable_reg_27(wrenable_reg_27),
    .wrenable_reg_28(wrenable_reg_28),
    .wrenable_reg_29(wrenable_reg_29),
    .wrenable_reg_3(wrenable_reg_3),
    .wrenable_reg_30(wrenable_reg_30),
    .wrenable_reg_31(wrenable_reg_31),
    .wrenable_reg_32(wrenable_reg_32),
    .wrenable_reg_33(wrenable_reg_33),
    .wrenable_reg_34(wrenable_reg_34),
    .wrenable_reg_35(wrenable_reg_35),
    .wrenable_reg_4(wrenable_reg_4),
    .wrenable_reg_5(wrenable_reg_5),
    .wrenable_reg_6(wrenable_reg_6),
    .wrenable_reg_7(wrenable_reg_7),
    .wrenable_reg_8(wrenable_reg_8),
    .wrenable_reg_9(wrenable_reg_9));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// Minimal interface for function: heapSort
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module heapSort(clock,
  reset,
  start_port,
  A,
  M_Rdata_ram,
  M_DataRdy,
  done_port,
  Mout_oe_ram,
  Mout_we_ram,
  Mout_addr_ram,
  Mout_Wdata_ram,
  Mout_data_ram_size);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] A;
  input [63:0] M_Rdata_ram;
  input [1:0] M_DataRdy;
  // OUT
  output done_port;
  output [1:0] Mout_oe_ram;
  output [1:0] Mout_we_ram;
  output [63:0] Mout_addr_ram;
  output [63:0] Mout_Wdata_ram;
  output [11:0] Mout_data_ram_size;
  // Component and signal declarations

  _heapSort _heapSort_i0 (.done_port(done_port),
    .Mout_oe_ram(Mout_oe_ram),
    .Mout_we_ram(Mout_we_ram),
    .Mout_addr_ram(Mout_addr_ram),
    .Mout_Wdata_ram(Mout_Wdata_ram),
    .Mout_data_ram_size(Mout_data_ram_size),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .A(A),
    .M_Rdata_ram(M_Rdata_ram),
    .M_DataRdy(M_DataRdy),
    .Min_oe_ram({1'b0,
      1'b0}),
    .Min_we_ram({1'b0,
      1'b0}),
    .Min_addr_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_Wdata_ram({32'b00000000000000000000000000000000,
      32'b00000000000000000000000000000000}),
    .Min_data_ram_size({6'b000000,
      6'b000000}));

endmodule
