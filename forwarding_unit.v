module forwarding_unit(clk,reg_rs,reg_rt,ex_mem_reg_rd,mem_wb_reg_rd,ex_mem_reg_write,mem_wb_reg_write,forward_a,forward_b);
    input[4:0]reg_rs,reg_rt,ex_mem_reg_rd,mem_wb_reg_rd;
    input  ex_mem_reg_write,mem_wb_reg_write,clk;
    output reg[1:0]forward_a,forward_b;
    always@(clk)
    begin
        if(ex_mem_reg_write && (ex_mem_reg_rd != 0) && (ex_mem_reg_rd == reg_rs))
        begin
            forward_a = 2'b10;
        end
        else if((mem_wb_reg_write) && (mem_wb_reg_rd != 0) && !(ex_mem_reg_write && (ex_mem_reg_rd != 0) && (ex_mem_reg_rd != reg_rs)) && (mem_wb_reg_rd == reg_rs))
        begin
            forward_a = 2'b01;
        end
        if(ex_mem_reg_write && (ex_mem_reg_rd != 0) && (ex_mem_reg_rd == reg_rt))
        begin
            forward_b = 2'b10;
        end        
        else if((mem_wb_reg_write) && (mem_wb_reg_rd != 0) && !(ex_mem_reg_write && (ex_mem_reg_rd != 0) && (ex_mem_reg_rd != reg_rt)) && (mem_wb_reg_rd == reg_rt))
        begin
            forward_b = 2'b01;
        end
    end
endmodule
