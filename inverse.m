function val = inverse(input)
     bin_length = length(input);   
     for i = 1:bin_length           % A loop to go through the entire array and set '0' where there is '1' and '1' where there is '0'
         if(input(i) == '1')
             input(i) = '0';
         else
             input(i) = '1';
         end
     end
     val = input;
