local image = require('image')
local imagePaint = {}
function imagePaint.paint(setImage,colorFrom,colorTo)
  if type(colorFrom) == 'number' then
    colorFrom = {colorFrom}
  end
  for x = 1, image.getWidth(setImage) do
    for y = 1, image.getHeight(setImage) do
      bg,fg,trans,symbol = image.get(setImage,x,y)
      for i = 1, #colorFrom do
        if bg == colorFrom[i] then
          bg = colorTo
        end
        if colorFrom[i] == fg then
          fg = colorTo
        end
      end
      image.set(setImage,x,y,bg,fg,trans,symbol)
    end
  end
  return setImage
end
return imagePaint
