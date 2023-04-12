function result = neg_bin_to_pos_bin(bin_int, frac_bin, m)

     bin_int = inverse(bin_int);
     frac_bin = inverse(frac_bin);
            
            % Then add 1:
    frac_bin = (dec2bin(bin2dec(frac_bin) + 1));
            
    new_taille = length(frac_bin);
            
            % If the new length exceeds the defined length
    if new_taille > m
        bin_int = (dec2bin(bin2dec(bin_int) + 1));
        frac_bin = msb_delete(frac_bin);                    % Remove the most significant bit using bitwise AND
    end
result = [bin_int, '.', frac_bin];