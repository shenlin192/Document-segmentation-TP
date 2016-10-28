%import the image
I = imread('old-doc.jpg');
 
%binarisation 
BW = im2bw(I, 0.5);
sumLine=sum(BW,2);

%filte
figure
plot(1:length(sumLine),sumLine)
afterFilte = smooth( 1:length(sumLine),sumLine);
%afterFilte2 = smooth( 1:length(afterFilte1),afterFilte1);
figure;
plot(afterFilte)

%normales the peaks
afterFilte(afterFilte> mean(afterFilte))=1;
afterFilte(afterFilte~=1)=0;
figure;
plot(afterFilte)

%determinate the largest vallays
[pks,locs,w,p] = findpeaks(afterFilte);
[maxVal,index]=max(w);
cutPoint=(locs(index)+locs(index+1))/2;

%divide an image into two image
I1=I(1:cutPoint-1,:,:);
I2=I(cutPoint:end,:,:);
figure;
imshow(I1)
figure;
imshow(I2)




