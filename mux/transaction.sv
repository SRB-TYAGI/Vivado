
class transaction;
  
  //declaring the transaction items
  rand bit  a;
  rand bit  b;
  rand bit  c;
  rand bit  d;
  rand bit  [1:0] sel;
       bit  out;
  function void display(string name);
    $display("-------------------------");
    $display("- %s ",name);
    $display("-------------------------");
    $display("- a = %0d, b = %0d, c = %0d, d = %0d , sel = %0b",a,b,c,d,sel);
    $display("- out = %0d",out);
    $display("-------------------------");
  endfunction
endclass