
% %Camear Init
% cam = ipcam('http://192.168.0.8/mjpg/video.mjpg','admin','1234');
% 
% % Capture one frame to get its size.
% videoFrame = snapshot(cam);
% frameSize = size(videoFrame);
% 
% % Create the video player object.
% videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% this part will receive the photo from camera and process it

function [erode]=image_process(img, cameraParams)
% calibrate the photo
img = undistortImage(img,cameraParams); %if you want to test with your photo, annotate this row
%image process,turn the rgb image to binary image
bw = im2bw(img,0.35);
% erode = bw;
% erode and dilate the binary image to reduce the noise
se1 = strel('square', 3);
dilate = imdilate(bw, se1);
se2 = strel('square', 3);
erode = imerode(dilate, se2);

end



