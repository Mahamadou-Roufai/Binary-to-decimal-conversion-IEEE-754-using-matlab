function result = bin_float_to_dec(Exponent, Mantissa, val)
    
    Shift = 2^(Exponent - 1) - 1;
    Mantissa_val = 0;
    Exponent_bin = val(2);                         % Get the exponent value
    Mantissa_bin = val(2+Exponent);
    for i = 3:(Exponent + Mantissa + 1)             % Get the two values
        if (i < Exponent + 2)
            Exponent_bin = [Exponent_bin, val(i)];  % For the exponent part
        elseif (i > Exponent + 2)
            Mantissa_bin = [Mantissa_bin, val(i)];  % For the mantissa part
        end
    end
    
    Exponent_val = bin2dec(Exponent_bin) - Shift; % Get the decimal value of the exponent
    
    val_int = '1';                                    % For the default '1'
   
    for i = 1: abs(Exponent_val)                      % Convert the mantissa to decimal based on the exponent
       if(Exponent_val > 0 )
            val_int = [val_int, Mantissa_bin(i)];     % Get the integer part value
       else
            val_int = '0';
           
       end
    end  
   
    for i = 1: abs(Exponent_val)                       % Convert the mantissa to decimal based on the exponent
        
        if(Exponent_val > 0 )
            
            Mantissa_bin = msb_delete(Mantissa_bin); % Delete msb to get the mantissa
        else
            if(i == 1)                                   %If the Exponent_val is negative, We add the '1' at default first and then we continue with '0'
                 Mantissa_bin = ['1', Mantissa_bin];
            else
                Mantissa_bin = ['0', Mantissa_bin];      % Add msb in case of negative exponent
            end
          
        end
    end
    
    val_int = bin2dec(val_int);                     % Convert the integer part value
    
    for i = 1:length(Mantissa_bin)                  % Get the mantissa value             
        Mantissa_val = Mantissa_val + (str2double(Mantissa_bin(i)) * 2^((-1)* i)) ;
    end
    Mantissa_val = Mantissa_val + val_int;
    
    if(val(1) == '1')                               % Determine the sign
        Mantissa_val = Mantissa_val * (-1); 
    end
    
    result = Mantissa_val ;
