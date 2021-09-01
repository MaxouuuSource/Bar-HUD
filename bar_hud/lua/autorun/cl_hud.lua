
local HideElementsTable = {
	
	["DarkRP_HUD"]				= true,
	["DarkRP_ArrestedHUD"]		= false,
	["DarkRP_EntityDisplay"] 	= false,
	["DarkRP_ZombieInfo"] 		= true,
	["DarkRP_LocalPlayerHUD"] 	= true,
	["DarkRP_Hungermod"] 		= true,
	["DarkRP_Agenda"] 			= true,
	-- Sandbox
	["CHudHealth"]				= true,
	["CHudBattery"]				= true,
	["CHudSuitPower"]			= true,

}

surface.CreateFont( "CarteDit",
{
	font = "TargetID", 
	size = 25,
	weight = 250,
	antialias = true,
	strikeout = true,
	additive = true,
} )

hook.Add("HUDPaint","Hudliferpsimple",function()
local health = LocalPlayer():Health()
if health < 0 then health = 0 elseif health > 100 then health = 100 end
local food = LocalPlayer():getDarkRPVar("Energy")
draw.RoundedBox(0, 23, ScrH() - 83, 177, 22, Color(0, 0, 0, 150))
draw.RoundedBox(0, 27.7, ScrH() - 80, health * 1.7, 15, Color(255, 100, 62, 255))
draw.RoundedBox(0, 23, ScrH() - 59, 177, 22, Color(0, 0, 0, 150))
draw.RoundedBox(0, 27.7, ScrH() - 56, food * 1.7, 15, Color(1, 142, 8, 255))
end)


local function HideElements( element )
	if HideElementsTable[ element ] then
		return false
	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )
