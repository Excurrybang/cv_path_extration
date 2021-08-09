% a function to find the position of red ball

function [ball_pos, ball_rad] = find_ball(img)
    % Subtract red channel from image
    diff_im = imsubtract(img(:,:,1), rgb2gray(img));
    
    % Convert the resulting grayscale image into a binary image.
    bw = imbinarize(diff_im,0.27); % This boundary value differs depending on environment

    % erode and dilate the binary image to reduce the noise
    se1 = strel('square', 3);
    dilate = imdilate(bw, se1);
    se2 = strel('square', 3);
    erode = imerode(dilate, se2);

    % Select only areas bigger than 2000 pxs
    erode = bwareaopen(erode,200);
    % Find areas
    st = regionprops('table',erode, 'Area', 'Centroid','MajorAxisLength','MinorAxisLength');
    diameters = mean([st.MajorAxisLength st.MinorAxisLength],2);
    rad = diameters/2;
    % Ensure that selected area is a circular object
    sel = ([st.Area] > 0.9*(pi*rad.^2)) & ([st.Area] < 1.1*(pi*rad.^2));
    st = st(sel,:);
    ball_rad = rad(sel);
    ball_pos = st.Centroid;
end