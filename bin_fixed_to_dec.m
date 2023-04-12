function result = bin_fixed_to_dec(bin_val, precision)
        virgule = 0;                                                   % To detect the position of the decimal point
        bin_val_length = length(bin_val);
        bin_val_int = bin_val(1);                                       % The integer part
        
        if(bin_val_length == precision)
                            % Extract the fractional part after the '.' of the decimal point
            for i = 1:(bin_val_length - 1)
                if (bin_val(i) == '.')
                    virgule = 1;
                    bin_val_frac = bin_val(i+1);                            % The fractional part
                    continue;
                end
            
                if(virgule == 0)
                    bin_val_int = [bin_val_int, bin_val(i)];                % To put the rest of the part
                else
                    bin_val_frac = [bin_val_frac, bin_val(i+1)];
                end
            
            end
        else
            bin_val_int = bin_val;
            bin_val_frac = '0';
        end
                         % Check the sign
        if(bin_val_int(1) == '1')                                       % If it is 1, it means that it is negative
            signe = -1;
            bin_val_int = inverse(bin_val_int);                         % Invert to get the one's complement
            bin_val_frac = inverse(bin_val_frac);
            
            help = bin2dec(bin_val_frac) + 1;                           % Add 1 for two's complement
            bin_val_frac_cmp = dec2bin(help, length(bin_val_frac));  
               
                   % Compare if the length has changed, if so we must delete the msb of the mantissa and put back the 1 in the integer part.
            if length(bin_val_frac_cmp) > length(bin_val_frac)          
                bin_val_int = (dec2bin(bin2dec(bin_val_int) + 1));
                bin_val_frac_cmp = msb_delete(bin_val_frac_cmp);        % Delete the most significant bit (See the detail in msb_delete function)
                bin_val_frac =  bin_val_frac_cmp;
            end
        else 
            signe = 1;
        end
        
        dec_val_int = bin2dec(bin_val_int) ;
        dec_val_frac = 0;
        
                            % Get the fractional value in decimal by multiplying each bit of the mantissa by 2^(-i)
        for i = 1:length(bin_val_frac)
              
            dec_val_frac = dec_val_frac + (str2double(bin_val_frac(i)) * 2^((-1)* i));
        end
        %result = ([signe, (num2str(dec_val_int + dec_val_frac))]);
        result = signe * (dec_val_int + dec_val_frac);