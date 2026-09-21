clear all;
clc;
leafs=imread('leaf.jpg');
J = imresize(leafs, 0.2);
E=rot90(J,-1);
figure, imshow(J), figure, imshow(E)