function [ diff_images ] = load_diff_images( images )
%LOAD_DIFF_IMAGES Summary of this function goes here
%   Detailed explanation goes here
    
    diff_images.c1_01 = img_diff(images.c1a0,images.c1a1);
    diff_images.c1_12 = img_diff(images.c1a1,images.c1a2);
    diff_images.c1_23 = img_diff(images.c1a2,images.c1a3);
    diff_images.c2_01 = img_diff(images.c2a0,images.c2a1);
    diff_images.c2_12 = img_diff(images.c2a1,images.c2a2);
    diff_images.c2_23 = img_diff(images.c2a2,images.c2a3);

end