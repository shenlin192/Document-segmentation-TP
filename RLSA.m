%%
clear;
clc;
close all;
I=imread('document.jpg');
BW=im2bw(I);
[lineNum,colNum]=size(BW);

horizentalSeuil=500;
verticalSeuil=200;

%% horizontally RLSA 

for i=1:lineNum
    
    d = diff(BW(i,:));
    
    start = find(d==1);
    stop = find(d==-1);  
    
    if(~isempty(start)&&~isempty(stop))
        
        %shift one position to the right of the matrice start 
        start=circshift(start',1)';
        
        if(size(start,2)~=1)
            start(1)=start(2);
        else 
             start(1)=1;
        end
        
        %resize of start and stop so that they can "-"
        if(size(start,2)<size(stop,2))
           stop=stop(:,1:size(start,2));
        else
           start=start(:,1:size(stop,2));
        end
        
        lgt = stop-start;
        indexs=find(lgt<=horizentalSeuil);
      
        if(size(indexs,2)>=1)
            for k=1:size(indexs,2)
                BW(i,start(indexs(k)):stop(indexs(k)),:)=0;
            end
        end
    end
end
result1=BW;
figure
imshow(result1)

%% vertical RSA

BW=im2bw(I);

for i=1:colNum
 
    d = diff(BW(:,i));
    
    start = find(d==1);
    stop = find(d==-1);  
    
    start=start';
    stop=stop';
    
    if(~isempty(start)&&~isempty(stop))
        
        start=circshift(start',1)';
        start(1)=1;
        
        %resize of start and stop so that they can "-"
        if(size(start,2)<size(stop,2))
           stop=stop(:,1:size(start,2));
        else
           start=start(:,1:size(stop,2));
        end
        
        lgt = stop-start;
        indexs=find(lgt<=verticalSeuil);      
     
        if(size(indexs,2)>=1)
            for k=1:size(indexs,2)
                BW(start(indexs(k)):stop(indexs(k)),i)=0;
            end
        end
    end
end
result2=BW;
figure
imshow(result2)

size(result1)
size(result2)
resultFinal=result1|result2;
figure
imshow(resultFinal)
