clear;clc;
I=imread('old-doc.jpg');
BW=im2bw(I);

%%
[lineNum,colNum]=size(BW);

for i=1:lineNum
    
    disp('-----------------');
    
    d = diff(BW(i,:));
    
    i
    
    start = find(d==1);
    stop = find(d==-1);  
    
    if(~isempty(start)&&~isempty(stop))
        
        start=circshift(start',1)'
        start(1)=1;
        
        %resize of start and stop so that they can "-"
        if(size(start,2)<size(stop,2))
           stop=stop(:,1:size(start,2));
        else
           start=start(:,1:size(stop,2));
        end
        
        lgt = stop-start;
        indexs=find(lgt<=100);
        
        disp('start')
        disp(start)
        disp('stop')
        disp(stop)
        disp('lgt')
        disp(lgt)
        disp('indexs')
        disp(indexs)
      
        if(size(indexs,2)>=1)
            for k=1:size(indexs,2)
                BW(i,start(indexs(k)):stop(indexs(k)))=0;
            end
        end
    end
end

imshow(BW)

%{
for i=1:a
    c=1;
     
    for j=1:b
      if u(i,j)==1
        if (j-c)<=0
            u(i,c:j)=1;
        end
        c=j;
      end
     end

if (b-c)<=5
    u(i,c:b)=1;
end
end
imshow(u,[]); 
%}