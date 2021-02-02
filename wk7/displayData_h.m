%% Display images from dataset
function displayData_h(X,m)
     
  % Gray Image
  colormap(gray);
  
  image_width = sqrt(size(X,2));  % 32 pixels in a row
  image_height = image_width;  % 32 pixels in a column
  
  display_width = floor(sqrt(m));  % 10 images in a row
  display_height = display_width;  % 10 images in a column
  display_extra = m - display_height*display_height;  % extra images
  
  display_array = ones(1+display_width*(image_width+1),1+display_height*(1+image_height));
  
  for i=1:display_width
    for j=1:display_height
      
      display_array((i-1)*image_width+i+1:i*image_width+i,...
      (j-1)*image_height+j+1:j*image_height+j)=...
      reshape(X((i-1)*10+j,:),image_width,image_height);
      
    end
  end
  
  h = imagesc(display_array);
  
  % Do not show axis
  axis image off

  drawnow;
  
end