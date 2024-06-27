--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety

    self.shinyFlag = math.random(8) == 1 and true or false
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34/355, 32/255, 52/255, 1)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
    
    -- shiny tile
    if self.shinyFlag then
        love.graphics.setBlendMode('add')

        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.setLineWidth(3)
        --love.graphics.rectangle('fill', self.x + x, self.y + y, 32, 32, 4)
        love.graphics.line(self.x + x + 16, self.y + y, self.x + x + 32, self.y + y + 16)

        love.graphics.setBlendMode('alpha')
    end
end