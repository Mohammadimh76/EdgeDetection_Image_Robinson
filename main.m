clc; clear; close all; warning off;

f=imread('siahosefid.bmp');
f=imnoise(f, 'gaussian', 0, 0.001);

imshow(f)
[width,height]=size(f);
g=zeros(width,height);
df=im2double(f);

wx=[1 1 1;1 -2 1;-1 -1 -1]
wy=[-1 1 1;-1 -2 1;-1 1 1]
for i=2:width-1
    for j=2:height-1
        gw=[df(i-1,j-1) df(i-1,j) df(i-1,j+1); df(i,j-1) df(i,j) df(i,j+1);df(i+1,j-1) df(i+1,j) df(i+1,j+1)];
        g(i,j)=sqrt((sum(sum(wx.*gw)))^2+(sum(sum(wy.*gw)))^2)/10;
    end
end

t=0.25*max(g(:));
h=g>=t;
figure,imshow(h)