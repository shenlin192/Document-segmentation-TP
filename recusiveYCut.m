function result = recusiveYCut( img )

%binarisation 
BW = im2bw(img, 0.5);

%calculate the sum of pixels
sumLine=sum(BW,2);

%filte
afterFilteLine = smooth( 1:length(sumLine),sumLine);

%normalies the peaks
afterFilteLine(afterFilteLine> mean(afterFilteLine))=1;
afterFilteLine(afterFilteLine~=1)=0;


%determinate the largest vallays of lines and Columns
[pksLine,locsLine,wLine,pLine] = findpeaks(afterFilteLine);
[maxValLine,indexLine]=max(wLine);
 
    if(maxValLine>15)
        cutPoint=(locsLine(indexLine)+locsLine(indexLine+1))/2;
        I1=img(1:cutPoint-1,:,:);
        I2=img(cutPoint:end,:,:);
        figure;
        imshow(I1)
        figure;
        imshow(I2)
        %recusiveCut(I1);
        %recusiveCut(I2);
        result=[recusiveYCut(I1);recusiveYCut(I2)];
    else
        result=img;
    end
end

