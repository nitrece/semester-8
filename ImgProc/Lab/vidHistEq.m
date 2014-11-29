clc;
clear all;
close all;

% prepare
vid = videoinput('winvideo',1);
set(vid, 'FramesPerTrigger', 300);
start(vid);
fig = figure;

% run until figure is closed
while(ishandle(fig))
    % wait for frame time
    pause(0.01);
    avail = get(vid,'FramesAvailable');
    if(avail > 0)
        % get frame
        [frame, time] = getdata(vid, avail);
        img = frame(:,:,:,1);
        
        % calculate equalized image
        imgEq = img;
        % display output
        figure(fig);
        subplot(2,1,1);
        
        imshow(img);
        imgEq = img_HistEq(img);
        subplot(2,1,2);
        imshow(imgEq);
    end
end

delete(vid);
clear vid;
