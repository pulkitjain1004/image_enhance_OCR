% this one uses loop to divide picture in sectors

[filename, pathname]= uigetfile('*.*','pick an image'); 
aaa = [pathname, filename];
A = imread(aaa);
imshow(A)
A2 = imresize(A, [600, 800]);
% figure,imshow(A2)
B = rgb2gray(A2);
% figure, imshow(B)

for i = 0:11
    for j = 0:15
        
        D = imcrop (B, [50*j+1 50*i+1 50 50]);       
        E=im2bw( D, graythresh(D) );
        
        if j == 0
            F1= E;
        else
            F1 = [F1 E];
        end;
        j = j+1;
    end
        if i == 0
            F2 = F1;
        else
            F2 = [F2 ; F1];
        end;
    i = i+1;
end

figure,imshow(F2)
se1 = strel ('square',2);
se2 = [0 0 ; 0 1];
% G = imdilate(F2,se2);
% H = medfilt2(F2,0.2);
I = imclose(F2, se1);
figure,imshow(I)
J = edge(B);
J1 = double(I);
J2 = edge(J1);
figure,imshow(J2)
figure,imshow(J)