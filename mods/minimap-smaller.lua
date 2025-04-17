local _G = tDFUI.GetGlobalEnv()
local T = tDFUI.T

local module = tDFUI:register({
    title = T["Minimap Smaller"],
    description = T["Makes the Minimap Smaller."],
    expansions = { ["vanilla"] = true, ["tbc"] = true },
    category = T["World & MiniMap"],
    enabled = nil,
})

tDFUI_config = tDFUI_config or {}

module.enable = function(self)
    local tMinimap = Minimap
    local scaletMiniMap = 0.95  -- Scale down factor for minimap size
    local scaletMinimapZoomInOut = 0.85  -- Scale down factor for zoom in/out buttons

    MyCustomMinimap:SetWidth(150 * scaletMiniMap)
    MyCustomMinimap:SetHeight(150 * scaletMiniMap)

    tMinimap:SetWidth(131 * scaletMiniMap)
    tMinimap:SetHeight(131 * scaletMiniMap)

    BorderFrameForZoneText:SetWidth(151 * scaletMiniMap)
    BorderFrameForZoneText:SetHeight(34)
    BorderFrameForZoneText:SetPoint("CENTER", MyCustomMinimap, 0, 80)

    MinimapZoneText:SetPoint("LEFT", BorderFrameForZoneText, "LEFT", 7, 7)
    MinimapZoneText:SetFont(STANDARD_TEXT_FONT, 8, "None")

    MiniMapMailFrame:SetPoint("TOPRIGHT", tMinimap, "TOPRIGHT", -200, -200)

    if tDFUI_config["MiniMap Square"] == 0 then
        tMinimapZoomIn:SetPoint("TOPRIGHT", MinimapZoneText, "TOPLEFT", 165 * scaletMinimapZoomInOut, -170 * scaletMinimapZoomInOut)
        tMinimapZoomOut:SetPoint("TOPRIGHT", MinimapZoneText, "TOPLEFT", 150 * scaletMinimapZoomInOut, -182 * scaletMinimapZoomInOut)
    else
        tMinimapZoomIn:SetPoint("TOPRIGHT", MinimapZoneText, "TOPLEFT", 175 * scaletMinimapZoomInOut, -210 * scaletMinimapZoomInOut)
        tMinimapZoomOut:SetPoint("TOPRIGHT", MinimapZoneText, "TOPLEFT", 160 * scaletMinimapZoomInOut, -210 * scaletMinimapZoomInOut)
    end

    MinimapClock:SetPoint("TOPRIGHT", Minimap, 24, 40)

end
