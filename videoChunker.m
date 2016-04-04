classdef videoChunker
    %VIDEOCHUNKER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        video
        chunkSize
    end
    methods            
        function array=getChunck(obj)
            array=uint8(zeros(obj.video.Height,obj.video.Width,3,obj.chunkSize));
            n=1;
            while (hasFrame(obj.video) && n<obj.chunkSize)
                frame=readFrame(obj.video);
                array(:,:,:,n)=frame;
                n=n+1;
            end
        end
    end
end

