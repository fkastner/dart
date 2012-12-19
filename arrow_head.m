function [ row , col ] = arrow_head( bw )
%ARROW_HEAD berechnet 
%   Eingabe: optimiertes binaeres Differenzbild (aus img_diff.m)
%   Ausgabe: Zeilen- und Spalten-Nummern des einen Pixels, 
%            der die Pfeilspitze am besten repraesentiert

    [rows,cols,~] = find(bw>0);                         % Zeilen- und Spalten-Nummern aller 1-Werte im binaeren Differenzbild (3. Wert nicht genutzt)
    spitz = find(rows==max(rows));                      % Indizes, an denen die Zeilen-Nummer maximal ist
    row = rows(spitz);                                  % Zeilen-Nummern, die maximal sind
    col = cols(spitz);                                  % Spalten-Nummern an den Stellen, wo die Zeilen-Nummern maximal sind
    row = row(1);                                       % aus Vektor (mit vielen gleichen [maximalen] Werten) mach Skalar-Wert
    col = round(min(col)+(max(col)-min(col))/2-0.5);    % Mittelwert der Spalten-Nummern
    
end