color = 0xE1E1E1
prevPrevColor = 0
local paint = require('imagePaint')
local gui = require('gui')
local wk = gui.workspace()
local image = require('image').load('/MineOS/Icons/HDD.pic')
turn = 0
function hts(...)
  return ("0x%06X"):format(...)
end
local BG = wk:addChild(gui.panel(1,1,160,50,0xAAAAAA))
local colorNextText = wk:addChild(gui.text(60,20,color,hts(color)))
local colorText = wk:addChild(gui.text(60,21,color,hts(color)))
local colorPrevText = wk:addChild(gui.text(60,22,color,hts(color)))
local colorChoose = wk:addChild(gui.colorSelector(59, 15, 20, 3, color, "Choose color"))
colorChoose.onColorSelected = function()
  turn = turn - 1
  nextColor = colorChoose.color
  update()
end
wk:addChild(gui.image(72,20,image))
function turnNext()
  turn = turn + 1
  if turn > 10 then
    turn = 1
  end
  prevColor = color
  color = nextColor
  if turn == 1 then
    nextColor = 0xFF00FF
  elseif turn == 2 then
    nextColor = 0xFF0000
  elseif turn == 3 then
    nextColor = 0x00FF00
  elseif turn == 4 then
    nextColor = 0x0000FF
  elseif turn == 5 then
    nextColor = 0x00FFFF
  elseif turn == 6 then
    nextColor = 0x000000
  elseif turn == 7 then
    nextColor = 0xFFAAFF
  elseif turn == 8 then
    nextColor = 0xBBBBBB
  elseif turn == 9 then
    nextColor = 0xFFFFFF
  elseif turn == 10 then
    nextColor = 0xAAFFAA
  end
end
function update()
  turnNext()
  colorText.text = hts(color)
  colorText.color = color
  colorPrevText.text = hts(prevColor)
  colorPrevText.color = prevColor
  colorNextText.color = nextColor
  colorNextText.text = hts(nextColor)
  image.image = paint.paint(image,prevColor,color)
  wk:draw()
end
wk.eventHandler = function(_,_,e1,_,_,key)
  if e1 == 'key_up' then
    if key == 57 then
      update()
    elseif key == 31 then
      wk:stop()
    end
  end
end
wk:draw()
wk:start()
