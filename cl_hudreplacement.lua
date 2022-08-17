surface.CreateFont( "healtharmor", {
	font = "BebasNeue", 
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

surface.CreateFont( "healthsmall", {
	font = "BebasNeue", 
	size = 18,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,

})

surface.CreateFont( "moneys", {
	font = "BebasNeue", 
	size = 24,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

surface.CreateFont( "moneyss", {
	font = "BebasNeue", 
	size = 18,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

surface.CreateFont( "salaryn", {
	font = "BebasNeue", 
	size = 24,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

surface.CreateFont( "name", {
	font = "BebasNeue", 
	size = 50,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

surface.CreateFont( "namesmall", {
	font = "BebasNeue", 
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

surface.CreateFont( "energys", {
	font = "BebasNeue", 
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
})

surface.CreateFont( "jobfont", {
	font = "BebasNeue", 
	size = 30,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

-- UPTO HERE, THIS ARE FONTS

local hideHUDElements = {
	-- if you DarkRP_HUD this to true, ALL of DarkRP's HUD will be disabled. That is the health bar and stuff,
	-- but also the agenda, the voice chat icons, lockdown text, player arrested text and the names above players' heads
	["DarkRP_HUD"] = false,

	-- DarkRP_EntityDisplay is the text that is drawn above a player when you look at them.
	-- This also draws the information on doors and vehicles
	["DarkRP_EntityDisplay"] = false,

	-- DarkRP_ZombieInfo draws information about zombies for admins who use /showzombie.
	["DarkRP_ZombieInfo"] = false,

	-- This is the one you're most likely to replace first
	-- DarkRP_LocalPlayerHUD is the default HUD you see on the bottom left of the screen
	-- It shows your health, job, salary and wallet
	["DarkRP_LocalPlayerHUD"] = true,

	-- Drawing the DarkRP agenda
	["DarkRP_Agenda"] = false
}

hook.Add("HUDPaint","myhud", function()

-- PRINCIPAL BOX, TEXT, LINE

draw.RoundedBox(5,5,840,520,230,Color(45,45,45,255)) -- MAIN BOX
draw.SimpleText( "Health", "healtharmor", 9, 1015, Color(255,255,255),0,0) -- TEXT
draw.SimpleText( "Armor", "healtharmor", 9, 1040, Color(255,255,255),0,0) -- TEXT


-- HEALTH AND ARMOR BARS

local health = LocalPlayer():Health()

	draw.RoundedBox(4, 56, 1013, 300, 15, Color(125, 115, 115))
	draw.RoundedBox(4, 56, 1013, math.Clamp(health * 3, 0, 300), 15, Color(195, 5, 5))
	draw.SimpleText(health, "healthsmall", 56+150, 1021, Color(255, 255, 255), 1, 1)

local armor = LocalPlayer():Armor()

	draw.RoundedBox(4, 58, 1042, 300, 15, Color(125, 115, 115))
	draw.RoundedBox(4, 58, 1042, math.Clamp(armor * 3, 0, 300), 15, Color(0, 0, 255))
	draw.SimpleText(armor, "healthsmall", 56+150, 1050, Color(255, 255, 255), 1, 1)


	moneyfs = "moneys"
	local Money = LocalPlayer():getDarkRPVar( "money" )
	draw.SimpleText( "$"..Money, "moneys", 445, 1013, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
	local size = surface.GetTextSize(Money)
	salary = LocalPlayer():getDarkRPVar( "salary" )
	draw.SimpleText( "Salary:", "salaryn", 400, 1040, Color(255,255,255),0,0)
	draw.SimpleText( "$"..salary, "salaryn", 470, 1040, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
	draw.RoundedBox( 0, 5, 993, 520, 10, Color(125,115,115))
	local Avatar = vgui.Create( "AvatarImage", Panel )
	Avatar:SetSize( 84, 84 )
	Avatar:SetPos( 18, 900 )
	Avatar:SetPlayer( LocalPlayer(), 64 )

		local sfont

		username = LocalPlayer():GetName()
	surface.SetFont("name")
	local size = surface.GetTextSize(username)

	if size > 200 then
		sfont = "namesmall"
	else
		sfont = "name"
	end

	local username = LocalPlayer():GetName()
	draw.SimpleText(username , sfont , 14 , 850)

	humod = {}
	humod.UsingHungerMod = true

	surface.SetFont("energys")

	if humod.UsingHungerMod then

	draw.SimpleText("Energy: "..math.Round(LocalPlayer():getDarkRPVar("Energy") or 0).."%", "energys", 110 , 960, Color(255,255,255))
end

draw.RoundedBox(0, 220 , 840, 10, 153, Color(125,115,115)) -- GRAY VERTICAL BAR



draw.SimpleText("Job: "..LocalPlayer():getDarkRPVar("job"), "jobfont", 250, 845, Color(255,255,255))




end)


