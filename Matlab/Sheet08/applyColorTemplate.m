function similarityImage = applyColorTemplate( image, template, similarityFun )
%APPLYTEMPLATE Apples a template to an image with a given similarity
%   function.
%   The similarity function should take an image patch and a template.
    [rImage, cImage, ~] = size(image);
    [rTemplate, cTemplate, ~] = size(template);
    
    similarityImage = zeros([rImage, cImage, 3]);
    
    yLim = max(rImage - rTemplate, 1);
    xLim = max(cImage - cTemplate, 1);
    for y = 1 : yLim
        for x = 1 : xLim
            patch = image(y : y + rTemplate - 1, ...
                          x : x + cTemplate - 1, :); 
            similarityImage(y, x, :) = [similarityFun(patch(:,:,1), template(:,:,1)), ... 
                                        similarityFun(patch(:,:,2), template(:,:,2)), ...
                                        similarityFun(patch(:,:,3), template(:,:,3))];
        end
    end
end
