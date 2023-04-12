function val = msb_delete(input)
    val_new = input(2);             % Store the value of the 2nd index of the input
    for i = 3:length(input)         % Extract the remaining values
        val_new = [val_new, input(i)];
    end
    val = val_new;                  % Return the modified input with the MSB removed
end
