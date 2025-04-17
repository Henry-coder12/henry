-- Configuración para MultiBarBottomLeft con 2 filas y 24 columnas
local frameBotLeft = CreateFrame("Frame")
frameBotLeft:SetScript("OnUpdate", function()
    for i = 1, 24 do
        local button = getglobal("MultiBarBottomLeftButton" .. i)
        if button then
            button:SetWidth(36)
            button:SetHeight(36)
            button:SetNormalTexture("Interface\\Addons\\Turtle-Dragonflight\\img\\uiactionbariconframe.tga")
            button:SetHighlightTexture("Interface\\Addons\\Turtle-Dragonflight\\img\\uiactionbariconframehighlight.tga")
            local texture = button:GetNormalTexture()
            texture:SetWidth(36)
            texture:SetHeight(36)

            -- Posiciona los botones en 2 filas y 24 columnas
            button:ClearAllPoints()
            if i == 1 then
                button:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", 10, 200) -- Ajusta la posición inicial
            elseif (i - 1) % 12 == 0 then
                button:SetPoint("TOPLEFT", getglobal("MultiBarBottomLeftButton" .. (i - 12)), "BOTTOMLEFT", 0, -5)
            else
                button:SetPoint("LEFT", getglobal("MultiBarBottomLeftButton" .. (i - 1)), "RIGHT", 5, 0)
            end
        end
    end
end)

-- Configuración para otras barras (puedes replicar el patrón si es necesario)
-- Por ejemplo, MultiBarBottomRight, MultiBarRight, etc.

-- Reposiciona la barra derecha si es necesario
local rightActionBar = MultiBarRight
local point, relativeTo, relativePoint, xOfs, yOfs = rightActionBar:GetPoint()
rightActionBar:ClearAllPoints()
rightActionBar:SetPoint(point, relativeTo, relativePoint, xOfs, yOfs + 10)