function resultat = frac_to_bin(frac, taille)
  
 %Initialize the array with the first bit
   frac = frac * 2 ;                           
               
   if frac >= 1 
       frac_bin = '1';
       frac = frac - 1;
   else
       frac_bin = '0';
   end
                        %********************************%
                         %For the rest of the bits, at each iteration, 
                         %multiply by 2 and compare to add either '0' or '1' to the array
   for i = 1:(taille - 1)
       frac = frac * 2 ; 
       if frac >= 1 
            frac_bin = [frac_bin, '1'];
            frac = frac - 1;
       else
            frac_bin = [frac_bin, '0'];
       end
   end
   
    resultat = frac_bin;
