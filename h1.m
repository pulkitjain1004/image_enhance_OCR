% manually divide image in sectors
%
[filename, pathname]= uigetfile('*.*','pick an image') 
A = [filename, pathname];                                                                % A = imread('C:\Users\Pulkit Jain\Desktop\hand\b1.jpg');
A2 = imresize(A, [ 600,801 ]);
% figure,imshow(A2)
B = rgb2gray(A2);
% figure, imshow(B)
% make this in loop
F=ones(800,600);
for i=0:5
    for j=0:7
        
        D = imcrop (B, [100*j 100*i 100 100]);
        level=graythresh(D);
        E=im2bw(D,level);
        F([1 100],:) = [E];
        j=j+1;
    end
    i=i+1;
end
B1 = imcrop(B, [0 0  50 50]);
B2 = imcrop(B, [51 0 50 50]);
B3 = imcrop(B, [535 0 801 300]);
B4 = imcrop(B, [0 301 267 300]);
B5 = imcrop(B, [268 301 267 300]);
B6 = imcrop(B, [535 301 267 300]);
% figure, imshow(B1)
% figure, imshow(B2)
% figure, imshow(B3)
% figure, imshow(B4)
% figure, imshow(B5)
% figure, imshow(B6)
level1=graythresh(B1);
level2=graythresh(B2);
level3=graythresh(B3);
level4=graythresh(B4);
level5=graythresh(B5);
level6=graythresh(B6);
C1= im2bw(B1,level1);
C2= im2bw(B2,level2);
C3= im2bw(B3,level3);
C4= im2bw(B4,level4);
C5= im2bw(B5,level5);
C6= im2bw(B6,level6);
figure, imshow(C1)
figure, imshow(C2)
figure, imshow(C3)
figure, imshow(C4)
figure, imshow(C5)
figure, imshow(C6)
C = [C1 C2 C3;
     C4 C5 C6];
figure, imshow(C)