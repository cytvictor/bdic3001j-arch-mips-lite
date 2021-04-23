/**
 * im - Instruction memory. 1KB size.
 * @module_name im
 * @author Yongting Chen <yongting.chen@ucdconnect.ie>
 */

module im (
  input wire [7:0] addr,  // there are 2^8 memory addresses
  output wire [31:0] out // data at the given address
);
  reg [31:0] im_data[256:0]; // (32/8) * 256 = 4 Bytes * 256 = 1024 KB

  reg [7:0] n;
  // read the instructions from hexadecimal text file;
  // run once only.
  initial begin
    $readmemh("C:/Users/Victor/Desktop/Projects/2020-2021-2/Labs/arch/mips-processor/code.txt", im_data);
    // Test if the instructions memory has been successfully read
    // for (n = 0; n < 4; n = n + 1) begin
    //     $display("%h", im_data[n]);
    // end
  end

  // give the data
  assign out = im_data[addr[7:0]][31:0];
endmodule