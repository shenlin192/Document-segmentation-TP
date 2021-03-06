function result = recusiveCut( img )

%binarisation 
BW = im2bw(img, 0.5);

%calculate the sum of pixels
sumLine=sum(BW,2);
sumCol=sum(BW,1);

disp('Length of sumLine')
disp(length(sumLine));

disp('Length of sumCol')
disp(length(sumCol));

%filte
afterFilteLine = smooth( sumLine);
afterFilteCol = smooth( sumCol);

%normalies the peaks
afterFilteLine(afterFilteLine> mean(afterFilteLine))=1;
afterFilteLine(afterFilteLine~=1)=0;

afterFilteCol(afterFilteCol> mean(afterFilteCol))=1;
afterFilteCol(afterFilteCol~=1)=0;

if(isempty(afterFilteCol))
    afterFilteCol=[0,0,0];
end

if(isempty(afterFilteLine))
    afterFilteLine=[0,0,0];
end


%determinate the largest vallays of lines and Columns
[pksLine,locsLine,wLine,pLine] = findpeaks(afterFilteLine);
[maxValLine,indexLine]=max(wLine);

[pksCol,locsCol,wCol,pCol] = findpeaks(afterFilteCol);
[maxValCol,indexCol]=max(wCol);
    
%avoid empty matrix
if(isempty(maxValLine))
    maxValLine=0;
end

if(isempty(maxValCol))
    maxValCol=0;
end

disp(maxValLine)
disp(maxValCol)
   
    %determinate the threshold
    if(maxValLine<20 && maxValCol<20) 
        result=img;     
        disp('end of a recusion');
        disp('--------------------');
    else
        %determinate X cut or Y cut
        if(maxValLine>maxValCol) 
            cutPoint=(locsLine(indexLine)+locsLine(indexLine+1))/2;
            disp('Ycut');
            disp(cutPoint);
            disp('--------------------');
            I1=img(1:cutPoint-1,:,:);
            I2=img(cutPoint:end,:,:);
            figure;
            imshow(I1)
            figure;
            imshow(I2)
            %call the function recusively
            result=[recusiveCut(I1);recusiveCut(I2)];
        else       
            cutPoint=int8((locsCol(indexCol)+locsCol(indexCol+1))/2);      
            disp('Xcut');
            disp(cutPoint); 
            disp('--------------------');
            I1=img(:,1:cutPoint-1,:);
            
            size(I1)
            size(img)
            cutPoint
            %Here is the problem, I2 is always empty.I don't konw why.
            %Except for I2, everything is fine. CutPoint, size(img) and
            %size(I1) are all fine.
            
            %no matter what I've tried, it just does't work. so sad
            %I2=img(:,cutPoint:size(img,2),:);
            %I2=img(:,cutPoint:end,:);
            endPoint=size(img,2);
            I2=img(:,cutPoint:endPoint,:);
            size(I2)
            I2
            figure;
            imshow(I1)
            figure;
            imshow(I2)
            %call the function recusively
            result=[recusiveCut(I1),recusiveCut(I2)];
        end     
    end
end

