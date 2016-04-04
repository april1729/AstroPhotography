function kernel=makeSaturnKernel()
clear;
kernel=imread('saturnKernel.png');
kernel=rgb2gray(kernel);
kernel=(1/255)*(255-kernel);
kernel=imrotate(kernel,-45);
kernel=double(kernel);

for x=2:43
    for y=2:43
        if(kernel(x,y)==0)
            if (kernel(x+1,y)==1 || kernel(x-1,y)==1 || kernel(x,y-1)==1 || kernel(x,y+1)==1)
               % fprintf('%d, %d \n', x,y)
                kernel(x,y)=-(531/372);
            end
        end
    end
end

