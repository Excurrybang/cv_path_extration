img = imread("camera snapshot.png");
img2 = undistortImage(img,cameraParams);
[img1] = image_process(img, cameraParams);
[sorted_pos,pos] = extract_pos(img1);

%montage({img,bw,dilate, erode});

% subplot(311);
% scatter(pos(:,1), pos(:,2));
% subplot(312);
% scatter(pos_copy(:,1), pos_copy(:,2));
subplot(311);
imshow(img);
subplot(312);
imshow(img1);
subplot(313);
plot(sorted_pos(:,1),sorted_pos(:,2));

% interpolation_size = 2;
% for i =1:length(pos)/2
%     pos_interpolate(i,1) = pos(i*interpolation_size,1);
%     pos_interpolate(i,2) = pos(i*interpolation_size,2);
% end
