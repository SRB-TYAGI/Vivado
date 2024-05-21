`include "transaction.sv"
class generator;
transaction tr; 
mailbox mbox;
function new(mailbox mbox);
this.mbox = mbox;
endfunction
task run();
begin
tr = new();
//tr.randomize();
tr.in1 = 1;
tr.in2 = 0; 
tr.cin = 0;
  $display("in1 = %0d, in2 = %0d, cin = %0d", tr.in1, tr.in2, tr.cin);
mbox.put(tr);
end
endtask
endclass
