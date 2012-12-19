function [ x , y ] = arrow_position ( col_cam1 , col_cam2 )
%ARROW_POSITION berechnet die x- und y-Koordinaten der Pfeilspitze.
%   Eingabe: x-Pixel-Koordinaten von Kamera 1 und 2 (aus arrow_head.m)
%   Ausgabe: Vektor mit x- und y-Koordinaten des Pfeils auf der
%            Dartscheibe im Koordinatensystem mit Ursprung im BullsEye

    load('init.mat');                                                                                       % load structure
    
    y0 = (col_cam1 - init.origin_cam1) / (init.right_ref_cam1 - init.origin_cam1) * 17;                     % (t-q)/(v-q)*17
    x0 = (col_cam2 - init.origin_cam2) / (init.right_ref_cam2 - init.origin_cam2) * 17;                     % (s-p)/(u-p)*17
    
    x = ( (init.pos_y_cam2 - y0) * x0 * init.pos_x_cam1 ) / (init.pos_y_cam2 * init.pos_x_cam1 - y0 *x0);   % f1(x)=f2(x) nach x umgeformt --> (y1-y0)*xo*x1)/(y1x1-y0x0)
    y = - (y0 / init.pos_x_cam1) * x + y0;                                                                  % x in f1(y) eingesetzt --> -y0/x1*x+y0 = -(y0/x1)*((y1-y0)*x0*x1)/(y1*x1-y0*x0))+y0  y=mx+n
end