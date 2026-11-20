-- Example Test
local SugengLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SugengLibrary/main/SugengLib.lua"))()

-- Window Init
local win = SugengLib:CreateWindow({
	Title = "Sugeng Hub",
	KeySystem = true,
	Key = "sugeng2026",
	DefaultTab = "About",
	ToggleKey = Enum.KeyCode.RightControl,

	-- About Info
	About = {
		Description = "Script ini dibuat pribadi dilarang keras untuk membagikan tanpa seizin developer"
	}
})

-- Welcome notify
win:Notify({
	Content = "Welcome Sugeng",
	Duration = 1
})

-- Tab Player
local tab1 = win:CreateTab({
	Name = "Player Tab"
})

-- Speed toggle
tab1:AddToggle({
	Name = "Speed Hack",
	Default = false,
	Keybind = Enum.KeyCode.X,
	Callback = function(state)
		local char = game.Players.LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = state and 50 or 16
		end
	end
})

-- Jump toggle
tab1:AddToggle({
	Name = "Infinite Jump",
	Default = false,
	Keybind = Enum.KeyCode.J,
	Callback = function(state)
		print("Infinite Jump", state)
	end
})

-- WalkSpeed slider
tab1:AddSlider({
	Name = "Custom WalkSpeed",
	Min = 16,
	Max = 250,
	Default = 16,
	ToggleDefault = false,
	Callback = function(val, state)
		local char = game.Players.LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum and state then
			hum.WalkSpeed = val
		elseif hum and not state then
			hum.WalkSpeed = 16
		end
	end,
	ToggleCallback = function(state, val)
		local char = game.Players.LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = state and val or 16
		end
	end
})

-- Teleport button
tab1:AddButton({
	Name = "Teleport Spawn",
	Keybind = Enum.KeyCode.T,
	Callback = function()
		local char = game.Players.LocalPlayer.Character
		local root = char and char:FindFirstChild("HumanoidRootPart")
		if root then
			root.CFrame = CFrame.new(0, 50, 0)
		end
	end
})

-- WalkSpeed input
tab1:AddInputBox({
	Name = "WalkSpeed Value",
	Placeholder = "Jumlah",
	Default = "50",
	ToggleDefault = false,
	Keybind = Enum.KeyCode.V,
	Callback = function(val, state)
		local speed = tonumber(val) or 16
		local char = game.Players.LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum and state then
			hum.WalkSpeed = speed
		elseif hum and not state then
			hum.WalkSpeed = 16
		end
	end,
	ToggleCallback = function(state, val)
		local speed = tonumber(val) or 16
		local char = game.Players.LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.WalkSpeed = state and speed or 16
		end
	end
})

-- Tab Visuals
local tabVisual = win:CreateTab({
	Name = "Visuals Tab"
})

-- ESP toggle
tabVisual:AddToggle({
	Name = "Player ESP",
	Default = false,
	Keybind = Enum.KeyCode.H,
	Callback = function(state)
		print("Player ESP", state)
	end
})

-- Freecam input
tabVisual:AddInputBox({
	Name = "Freecam Speed",
	Placeholder = "Speed",
	Default = "64",
	ToggleDefault = false,
	Keybind = Enum.KeyCode.P,
	Callback = function(val, state)
		print("Freecam", val, state)
	end
})

-- Goto button
tabVisual:AddButton({
	Name = "Goto Player",
	Keybind = Enum.KeyCode.G,
	CardDrop = {
		Title = "Select Target",
		Options = {"Player1", "Player2", "Player3", "Player4"},
		Default = "Select Target",
		Callback = function(target)
			print("Goto target", target)
		end
	},
	Callback = function()
		print("Goto executed")
	end
})

-- Spectate dropdown
tabVisual:AddDropdown({
	Name = "Spectate Player",
	Options = {"LocalPlayer", "Enemy_Target", "VIP_Player", "Boss_Entity", "Spectator_Cam"},
	Default = "LocalPlayer",
	Callback = function(selected)
		print("Spectating", selected)
	end
})

-- Tab Other
local tab2 = win:CreateTab({
	Name = "Other Tab"
})

-- Server hop
tab2:AddButton({
	Name = "Server Hop",
	Callback = function()
		win:Notify({ Content = "Finding server", Duration = 1 })
	end
})

-- Rejoin button
tab2:AddButton({
	Name = "Rejoin Game",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
	end
})

-- Anti AFK
tab2:AddToggle({
	Name = "Anti AFK",
	Default = true,
	Keybind = Enum.KeyCode.K,
	Callback = function(state)
		print("Anti AFK", state)
	end
})

-- Zoom slider
tab2:AddSlider({
	Name = "Camera Zoom",
	Min = 70,
	Max = 120,
	Default = 70,
	ToggleDefault = false,
	Callback = function(val, state)
		local cam = workspace.CurrentCamera
		if cam and state then
			cam.FieldOfView = val
		elseif cam and not state then
			cam.FieldOfView = 70
		end
	end,
	ToggleCallback = function(state, val)
		local cam = workspace.CurrentCamera
		if cam then
			cam.FieldOfView = state and val or 70
		end
	end
})

-- Jump value
tab2:AddInputBox({
	Name = "JumpPower Value",
	Placeholder = "Jumlah",
	Default = "100",
	ToggleDefault = false,
	Keybind = Enum.KeyCode.B,
	Callback = function(val, state)
		local jump = tonumber(val) or 50
		local char = game.Players.LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum and state then
			hum.JumpPower = jump
		elseif hum and not state then
			hum.JumpPower = 50
		end
	end,
	ToggleCallback = function(state, val)
		local jump = tonumber(val) or 50
		local char = game.Players.LocalPlayer.Character
		local hum = char and char:FindFirstChildOfClass("Humanoid")
		if hum then
			hum.JumpPower = state and jump or 50
		end
	end
})

-- Region dropdown
tab2:AddDropdown({
	Name = "Server Region",
	Options = {"Auto Region", "Singapore", "Tokyo", "Germany", "United States"},
	Default = "Auto Region",
	Callback = function(selected)
		print("Region selected", selected)
	end
})
