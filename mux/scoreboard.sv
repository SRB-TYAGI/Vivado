
//gets the packet from monitor, Generated the expected result and compares with the //actual result recived from Monitor

class scoreboard;
   
  //creating mailbox handle
  mailbox mon2scb;
  
  //used to count the number of transactions
  int no_transactions;
  
  //constructor
  function new(mailbox mon2scb);
    //getting the mailbox handles from  environment 
    this.mon2scb = mon2scb;
  endfunction
  
  //Compares the Actual result with the expected result
  task main;
    transaction trans;
    forever begin
      mon2scb.get(trans);
      if((~trans.sel[0]&~trans.sel[1]&trans.a)|(trans.sel[0]&~trans.sel[1]&trans.b)|(~trans.sel[0]&trans.sel[1]&trans.c)|(trans.sel[0]&trans.sel[1]&trans.d) == trans.out)
          $display("Result is as Expected");
        else
          $error("Wrong Result.\n\tExpeced: %0d Actual: %0d",(~trans.sel[0]&~trans.sel[1]&trans.a)|(trans.sel[0]&~trans.sel[1]&trans.b)|(~trans.sel[0]&trans.sel[1]&trans.c)|(trans.sel[0]&trans.sel[1]&trans.d),trans.out);
        no_transactions++;
      trans.display("[ Scoreboard ]");
    end
  endtask
  
endclass