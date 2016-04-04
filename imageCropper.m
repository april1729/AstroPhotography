function [ newMovie ] = imageCropper( rawMovie, newSize )

    videoSize=size(rawMovie);
    numFrames=videoSize(4);
    
    newMovie=uint8(zeros(newSize,newSize,3, numFrames));
    
    for frameNum=1:numFrames
        frame=rawMovie(:,:,:,frameNum);
        center=findObjectCenter(frame,20);
        frame=cropImage(frame,center,newSize);
        newMovie(:,:,:,frameNum)=frame;
    end
    
    function [center]=findObjectCenter(rawImage, threshold)
        kernel=makeSaturnKernel();
        g=rgb2gray(rawImage);
        c=conv2(double(g),double(kernel));
        m=max(max(c));
        if m<threshold
            center=0;
        else
            col=find(max(c)==max(max(c)));
            row=find(c(:,col)==max(max(c)));
            ksize=size(kernel);
            center=[row-round(ksize(1)/2),col-round(ksize(2)/2)];
        end
    end

    function [newImage]=cropImage(rawImage,center,newSize)
       
        newImage=rawImage(center(1)-round(newSize/2):center(1)+round(newSize/2),center(2)-round(newSize/2):center(2)+round(newSize/2));
        
    end



end