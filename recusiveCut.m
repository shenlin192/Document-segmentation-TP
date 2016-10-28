function result = recusiveCut( img )

%binarisation 
BW = im2bw(img, 0.5);
sumLine=sum(BW,2);

%filte
afterFilte = smooth( 1:length(sumLine),sumLine);

%normales the peaks
afterFilte(afterFilte> mean(afterFilte))=1;
afterFilte(afterFilte~=1)=0;

%determinate the largest vallays
[pks,locs,w,p] = findpeaks(afterFilte);
[maxVal,index]=max(w);

    if(maxVal)<15
        result=img;
    else
        cutPoint=(locs(index)+locs(index+1))/2;
        I1=img(1:cutPoint-1,:,:);
        I2=img(cutPoint:end,:,:);
        figure;
        imshow(I1)
        figure;
        imshow(I2)
       % recusiveCut(I1);
       % recusiveCut(I2);
        
        result=[recusiveCut(I1);recusiveCut(I2)];
    end

end

