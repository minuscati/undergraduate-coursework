clear all;
clc;
% RGB=imread('peppers.png');
% [X,map]=rgb2ind(RGB,128);
% G=rgb2gray(RGB);
% % size(RGB)
% % size(map)
% % size(X)
% % size(G)
% figure(1),imshow(RGB);
% figure(2),imshow(X,map);
% figure(3),imshow(X);
% figure(4),imshow(G);
X1=imread('1_proc.jpg');
X3=rgb2gray(X1);
X2=imread('1_procr.jpg');
X4=rgb2gray(X2);
X_F=wfusimg(X3, X4, 'haar', 1, 'max', 'max');
imshow(X_F,[]);

