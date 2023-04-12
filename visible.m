 function visible(handles, etat)
     switch etat
         case 1             % Corresponds to the interface of bin_to_reel
            bin = 'off';
            reel = 'on';
         case 2             %Corresponds to the interface of reel_to_bin
            
            bin = 'on';
            reel = 'off';
       
     end

set(handles.bin_to_reel, 'Visible', 'on');
set(handles.reel_to_bin, 'Visible', 'on');

set(handles.titre, 'Visible', bin);
set(handles.reel, 'Visible', bin);
set(handles.binaire, 'Visible', bin);
set(handles.virgule, 'Visible', bin);
set(handles.precision, 'Visible', 'off');
set(handles.precision_1, 'Visible', bin);
set(handles.entrer, 'Visible', bin);
set(handles.bin_titre, 'Visible', bin);
set(handles.reel_titre, 'Visible', bin);
set(handles.fermer, 'Visible', bin);


set(handles.titre_2, 'Visible', reel);
set(handles.reel_2, 'Visible', reel);
set(handles.binaire_2, 'Visible', reel);
set(handles.entrer_2, 'Visible', reel);
set(handles.bin_titre_2, 'Visible', reel);
set(handles.reel_titre_2, 'Visible', reel);
set(handles.fermer_2, 'Visible', reel);
 