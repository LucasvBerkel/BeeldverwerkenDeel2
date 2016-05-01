clear all;
im1 = single(rgb2gray(im2double(imread('nachtwacht1.jpg'))));
im2 = single(rgb2gray(im2double(imread('nachtwacht2.jpg'))));
[F1, D1] = vl_sift(im1);
[F2, D2] = vl_sift(im2);
[matches, scores] = vl_ubcmatch(D1, D2);
[~, length] = size(matches);
selF1 = zeros(4, length);
selF2 = zeros(4, length);
for i=1:length
    selF1(:,i)=F1(:,matches(1,i));
    selF2(:,i)=F2(:,matches(2,i));
end

figure;
imshow(im1);
perm = randperm(size(F1,2)) ;
sel = perm(1:50) ;
h1 = vl_plotframe(F1(:,sel)) ;
h2 = vl_plotframe(F1(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;

figure;
imshow(im2);
perm = randperm(size(F2,2)) ;
sel = perm(1:50) ;
h1 = vl_plotframe(F2(:,sel)) ;
h2 = vl_plotframe(F2(:,sel)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;