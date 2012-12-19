function [ score , factor ] = score( x , y )
%SCORE berechnet die geworfene Punktzahl aus den Koordinaten der
%Pfeilspitze.
%   Eingabe: Koordinaten der Pfeilspitze (aus arrow_position.m)
%   Ausgabe: Vektor mit Punktzahl und Faktor, der angibt, ob Einfach-,
%            Doppel-, oder Triple-Feld getroffen wurde
    
    dist_origin = sqrt(x*x + y*y);  % Berechnung des Abstandes zum Koordinatenursprung im Polarkoordinatensystem
    angle = acos(x / dist_origin);  % Berechnung des Winkels im Polarkoordinatensystem mit Ursprung O(0|0) im BullsEye
    if y < 0                        
        angle = 2*pi - angle;
    end
    
    dist_circles = [ 0.635 ; 1.59 ; 9.9 ; 10.7 ; 16.6 ; 17 ];   % bis x cm ist BullsEye; Bull; Einfach; Triple; Einfach; Doppel
    factors = [ -2 ; -1 ; 1 ; 3 ; 1 ; 2 ];                      % -2 = BullsEye ; -1 = Bull ; 1 = Einfach"Ring" ; 3 = Triple"Ring" ; 1 = Einfach"Ring ; 2 = Doppel"Ring"
    segments = [ 6 ; 13 ; 4 ; 18 ; 1 ; 20 ; 5 ; 12 ; 9 ; 14 ; 11 ; 8 ; 16 ; 7 ; 19 ; 3 ; 17 ; 2 ; 15 ; 10 ]; % Reihenfolge der Segmente auf der Dartscheibe
    
    factor = 0;                             % standardmaessig Faktor 0 (=ausserhalb)
    for i = length(dist_circles):-1:1       % dist_circles-Vektor von hinten durchlaufen
        if dist_origin < dist_circles(i)    % zur Berechnung des Faktors,
            factor = factors(i);            % also ob Double- oder Triple-Ring oder Bull/BullsEye getroffen wurde
        end
    end
    
    segment = segments(round((angle/pi*180+9)/18)); % Wunderformel zur Berechnung des getroffenen Segments aus dem Winkel
    
    if factor >= 0                  % Berechnung der endgueltigen Punktzahl und des Faktors
        score = factor * segment;
    else
        factor = - factor;
        score = factor * 25;
    end
end