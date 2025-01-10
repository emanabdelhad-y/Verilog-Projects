`timescale 1ns / 1ps

module hadd_tb;
    // Inputs
    reg x;
    reg y;
    
    // Outputs
    wire s;
    wire c;
    
    // File handle
    integer file;
    
    // Instantiate the half adder
    hadd uut (
        .x(x),
        .y(y),
        .s(s),
        .c(c)
    );
    
    initial begin
        // Open file for writing
        file = $fopen("half_adder_simulation.sim", "w");
        
        // Initialize Inputs
        x = 0;
        y = 0;
        
        // Test vector generation with both outputs recorded
        // Initial state
        #0  begin
            x = 0; y = 0;
            #1 $fwrite(file, "%0t, x, %b\n%0t, y, %b\n%0t, s, %b\n%0t, c, %b\n", 
                      $time, x, $time, y, $time, s, $time, c);
        end
        
        // x=0, y=1
        #9  begin
            x = 0; y = 1;
            #1 $fwrite(file, "%0t, x, %b\n%0t, y, %b\n%0t, s, %b\n%0t, c, %b\n", 
                      $time, x, $time, y, $time, s, $time, c);
        end
        
        // x=1, y=0
        #9  begin
            x = 1; y = 0;
            #1 $fwrite(file, "%0t, x, %b\n%0t, y, %b\n%0t, s, %b\n%0t, c, %b\n", 
                      $time, x, $time, y, $time, s, $time, c);
        end
        
        // x=1, y=1
        #9  begin
            x = 1; y = 1;
            #1 $fwrite(file, "%0t, x, %b\n%0t, y, %b\n%0t, s, %b\n%0t, c, %b\n", 
                      $time, x, $time, y, $time, s, $time, c);
        end
        
        // Close file and end simulation
        #10 $fclose(file);
        $finish;
    end
    
    // Monitor output values (optional, for console display)
    initial begin
        $monitor("Time: %0dns | x: %b | y: %b | Sum: %b | Carry: %b", $time, x, y, s, c);
    end
endmodule