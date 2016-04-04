function [ array ] = video2array( videoFileName )
%VIDEO2ARRAY Summary of this function goes here
%   Detailed explanation goes here

video=VideoReader(videoFileName);
array=zeros(video.Width,video.Height,3,video.Duration*video.FrameRate);
disp('done allocating space')
n=1;
while hasFrame(video)
    if mod(n,1000)==0
        disp(n)
    end
    frame=readFrame(video);
    array(:,:,:,n)=frame;
    n=n+1;
end