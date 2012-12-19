function scores = darts ( )
%DARTS Summary of this function goes here
%   Detailed explanation goes here

    % Read images
    c1a0 = imread('Cam1_0.jpg');
    c1a1 = imread('Cam1_1.jpg');
    c1a2 = imread('Cam1_2.jpg');
    c1a3 = imread('Cam1_3.jpg');
    c2a0 = imread('Cam2_0.jpg');
    c2a1 = imread('Cam2_1.jpg');
    c2a2 = imread('Cam2_2.jpg');
    c2a3 = imread('Cam2_3.jpg');
    % calculate score of Arrow #1
    c1_01 = img_dif(c1a0,c1a1);
    c2_01 = img_dif(c2a0,c2a1);
    [~,col_c1_01] = spitzpkt(c1_01);
    [~,col_c2_01] = spitzpkt(c2_01);
    [x1,y1] = arrow_position (col_c1_01 , col_c2_01);
    scores(1) = score (x1 , y1);
    % calculate score of Arrow #2
    c1_12 = img_dif(c1a1,c1a2);
    c2_12 = img_dif(c2a1,c2a2);
    [~,col_c1_12] = spitzpkt(c1_12);
    [~,col_c2_12] = spitzpkt(c2_12);
    [x2,y2] = arrow_position (col_c1_12 , col_c2_12);
    scores(2) = score (x2 , y2);
    % calculate score of Arrow #3
    c1_23 = img_dif(c1a2,c1a3);
    c2_23 = img_dif(c2a2,c2a3);
    [~,col_c1_23] = spitzpkt(c1_23);
    [~,col_c2_23] = spitzpkt(c2_23);
    [x3,y3] = arrow_position (col_c1_23 , col_c2_23);
    scores(3) = score (x3 , y3);
end