function [ images ] = load_images( path )
%LOAD_IMAGES Summary of this function goes here
%   Detailed explanation goes here
    
    images.c1a0 = imread(strcat(path,'Cam1_0.jpg'));
    images.c1a1 = imread(strcat(path,'Cam1_1.jpg'));
    images.c1a2 = imread(strcat(path,'Cam1_2.jpg'));
    images.c1a3 = imread(strcat(path,'Cam1_3.jpg'));
    images.c2a0 = imread(strcat(path,'Cam2_0.jpg'));
    images.c2a1 = imread(strcat(path,'Cam2_1.jpg'));
    images.c2a2 = imread(strcat(path,'Cam2_2.jpg'));
    images.c2a3 = imread(strcat(path,'Cam2_3.jpg'));

end