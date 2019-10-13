identity = [0 0 0;
            0 1 0;
            0 0 0];
        
emboss = [-2, -1, 0; 
          -1, 1, 1;
          0 1 2];

sharpen = [0 -1 0;
           -1 5 -1;
           0 -1 0];
  
blur = [0.0625 0.125 0.0625;
        0.125 0.25 0.125;
        0.0625 0.125 0.0625];

outline = [0 -1 0;
           -1 4 -1;
           0 -1 0];

file_path = 'cat.jpg'
input_img_gray = rgb2gray(imread(file_path));

img_padded = rot90(padarray(rot90(padarray(input_img_gray, 1, 'both')), 1, 'both'), 3);
length = size(img_padded, 1);
height = size(img_padded, 2);

img_kernel = sharpen;

for i=2:(height - 1)
    for j=2:(length - 1)
        part = img_padded(i -1 : i + 1, j - 1 : j + 1);
        resulted_matrix = double(part) .* img_kernel;
        res(i - 1, j - 1) = sum(resulted_matrix(:));
    end
end

imshow(uint8(res));
clear;