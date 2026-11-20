-- Sugeng Library
-- UI Framework

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local ContentProvider = game:GetService("ContentProvider")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer and LocalPlayer:FindFirstChildOfClass("PlayerGui")

local SugengLib = {}
SugengLib.__index = SugengLib

local toggleOnColor = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))
})
local toggleOffColor = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(68, 68, 68))
})

-- Executor storage
local isExecutor = (typeof(writefile) == "function" and typeof(readfile) == "function")
local studioKeybindStore = {}

-- Utility tween
local function tween(inst, duration, props, style, dir)
	local s = style or Enum.EasingStyle.Quad
	local d = dir or Enum.EasingDirection.Out
	local t = TweenService:Create(inst, TweenInfo.new(duration, s, d), props)
	t:Play()
	return t
end

-- Fast builder
local function buildUI()
	local objects = {}
	local function c(id: number, className: string, parentId: number, props: {[string]: any})
		local o = Instance.new(className)
		if id == 2 or id == 64 or id == 73 or id == 86 or id == 359 or id == 385 or id == 406 or id == 428 or id == 472 or id == 490 then
			o.Visible = false
		end
		for k, v in pairs(props) do
			pcall(function() (o :: any)[k] = v end)
		end
		if id == 2 or id == 64 or id == 73 or id == 86 or id == 359 or id == 385 or id == 406 or id == 428 or id == 472 or id == 490 then
			o.Visible = false
		end
		objects[id] = o
		if parentId ~= 0 then
			pcall(function() o.Parent = objects[parentId] end)
		end
		return o
	end

c(1, "ScreenGui", 0, { Name = "sugengcihuy", ZIndexBehavior = Enum.ZIndexBehavior.Sibling })
c(2, "Frame", 1, { Name = "SideBg", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.31466394662857, 0, 0.13513512909412, 0), Size = UDim2.new(0, 364, 0, 47) })
c(3, "UIListLayout", 2, { Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center, Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder, VerticalAlignment = Enum.VerticalAlignment.Center })
c(4, "ImageButton", 2, { Name = "AboutButton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.4745417535305, 0, 0.012474012561142, 0), Size = UDim2.new(0, 50, 0, 50) })
c(5, "UICorner", 4, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(6, "UIStroke", 4, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(7, "UIGradient", 4, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(8, "ImageLabel", 4, { Name = "SideIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://96296512150129", Position = UDim2.new(0.10000000149012, 0, 0.10000000149012, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(9, "Frame", 4, { Name = "SideButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.17736327648163, 0, 1.171489238739, 0), Size = UDim2.new(0, 66, 0, 18), Visible = false })
c(10, "UIStroke", 9, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(11, "UICorner", 9, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(12, "UIGradient", 9, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(13, "TextLabel", 9, { Name = "ButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 66, 0, 17), Text = "setting", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(14, "ImageButton", 2, { Name = "MicButton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.4745417535305, 0, 0.012474012561142, 0), Size = UDim2.new(0, 50, 0, 50) })
c(15, "UICorner", 14, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(16, "UIStroke", 14, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(17, "UIGradient", 14, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(18, "ImageLabel", 14, { Name = "SideIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://137237091545295", Position = UDim2.new(0.10000000149012, 0, 0.10000000149012, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(19, "Frame", 14, { Name = "SideButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.17736327648163, 0, 1.171489238739, 0), Size = UDim2.new(0, 66, 0, 18), Visible = false })
c(20, "UIStroke", 19, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(21, "UICorner", 19, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(22, "UIGradient", 19, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(23, "TextLabel", 19, { Name = "ButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 66, 0, 17), Text = "setting", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(24, "ImageButton", 2, { Name = "PlayerButton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.4745417535305, 0, 0.012474012561142, 0), Size = UDim2.new(0, 50, 0, 50) })
c(25, "UICorner", 24, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(26, "UIStroke", 24, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(27, "UIGradient", 24, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(28, "ImageLabel", 24, { Name = "SideIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://117854237557010", Position = UDim2.new(0.10000000149012, 0, 0.10000000149012, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(29, "Frame", 24, { Name = "SideButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.17736327648163, 0, 1.171489238739, 0), Size = UDim2.new(0, 66, 0, 18), Visible = false })
c(30, "UIStroke", 29, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(31, "UICorner", 29, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(32, "UIGradient", 29, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(33, "TextLabel", 29, { Name = "ButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 66, 0, 17), Text = "setting", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(34, "ImageButton", 2, { Name = "EyeButton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.4745417535305, 0, 0.012474012561142, 0), Size = UDim2.new(0, 50, 0, 50) })
c(35, "UICorner", 34, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(36, "UIStroke", 34, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(37, "UIGradient", 34, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(38, "ImageLabel", 34, { Name = "SideIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://106865999691846", Position = UDim2.new(0.10000000149012, 0, 0.10000000149012, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(39, "Frame", 34, { Name = "SideButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.17736327648163, 0, 1.171489238739, 0), Size = UDim2.new(0, 66, 0, 18), Visible = false })
c(40, "UIStroke", 39, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(41, "UICorner", 39, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(42, "UIGradient", 39, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(43, "TextLabel", 39, { Name = "ButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 66, 0, 17), Text = "setting", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(44, "ImageButton", 2, { Name = "OtherButton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.4745417535305, 0, 0.012474012561142, 0), Size = UDim2.new(0, 50, 0, 50) })
c(45, "UICorner", 44, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(46, "UIStroke", 44, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(47, "UIGradient", 44, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(48, "ImageLabel", 44, { Name = "SideIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://86646064489131", Position = UDim2.new(0.10000000149012, 0, 0.10000000149012, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(49, "Frame", 44, { Name = "SideButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.17736327648163, 0, 1.171489238739, 0), Size = UDim2.new(0, 66, 0, 18), Visible = false })
c(50, "UIStroke", 49, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(51, "UICorner", 49, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(52, "UIGradient", 49, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(53, "TextLabel", 49, { Name = "ButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 66, 0, 17), Text = "setting", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(54, "ImageButton", 2, { Name = "SettingButton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.4745417535305, 0, 0.012474012561142, 0), Size = UDim2.new(0, 50, 0, 50) })
c(55, "UICorner", 54, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(56, "UIStroke", 54, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(57, "UIGradient", 54, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(58, "ImageLabel", 54, { Name = "SideIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104670214139271", Position = UDim2.new(0.10000000149012, 0, 0.10000000149012, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(59, "Frame", 54, { Name = "SideButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.17736327648163, 0, 1.171489238739, 0), Size = UDim2.new(0, 66, 0, 18), Visible = false })
c(60, "UIStroke", 59, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(61, "UICorner", 59, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(62, "UIGradient", 59, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(63, "TextLabel", 59, { Name = "ButtonTip", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 66, 0, 17), Text = "setting", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(64, "ImageButton", 1, { Name = "Sugengbutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.4745417535305, 0, 0.012474012561142, 0), Size = UDim2.new(0, 50, 0, 50) })
c(65, "UIGradient", 64, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(66, "ImageLabel", 64, { Name = "SugengIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104819520545814", Position = UDim2.new(0.10000000149012, 0, 0.10000000149012, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40), ZIndex = 2 })
c(67, "CanvasGroup", 64, { Name = "CanvasGroup", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 50, 0, 50) })
c(68, "UICorner", 67, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(69, "Frame", 67, { Name = "Frame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 0.69999998807907, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.41999998688698, 0, -0.11556346714497, 0), Rotation = 45, Size = UDim2.new(0, 8, 0, 59) })
c(70, "UIGradient", 69, { Name = "UIGradient", Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.29333332180977, 0.23497271537781), NumberSequenceKeypoint.new(0.49523809552193, 0), NumberSequenceKeypoint.new(0.69904762506485, 0.25136613845825), NumberSequenceKeypoint.new(1, 1)}) })
c(71, "UIStroke", 64, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(72, "UICorner", 64, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(73, "Frame", 1, { Name = "MicFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.40325865149498, 0, 0.45322245359421, 0), Size = UDim2.new(0, 191, 0, 44), Visible = false })
c(74, "UICorner", 73, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(75, "UIStroke", 73, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(76, "UIGradient", 73, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(77, "ImageLabel", 73, { Name = "MicIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://137237091545295", Position = UDim2.new(0.026178009808064, 0, 0.15909090638161, 0), Size = UDim2.new(0, 30, 0, 30) })
c(78, "TextLabel", 73, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.18324607610703, 0, 0.29545453190804, 0), Size = UDim2.new(0, 94, 0, 17), Text = "Sugeng Anti VCB", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextWrapped = true })
c(79, "ImageButton", 73, { Name = "ToggleButton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.71727746725082, 0, 0.27272728085518, 0), Size = UDim2.new(0, 42, 0, 20) })
c(80, "UICorner", 79, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(81, "UIStroke", 79, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(82, "Frame", 79, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.19047619402409, 16, 0.03999999910593, 2), Size = UDim2.new(0, 15, 0, 15) })
c(83, "UICorner", 82, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(84, "UIStroke", 82, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(85, "UIGradient", 82, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(54, 54, 54))}) })
c(86, "Frame", 1, { Name = "LoaderFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.2749490737915, 0, 0.27858626842499, 0), Size = UDim2.new(0, 441, 0, 289), Visible = false })
c(87, "UICorner", 86, { Name = "UICorner" })
c(88, "UIGradient", 86, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(89, "UIStroke", 86, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(90, "UIShadow", 86, { Name = "UIShadow", BlurRadius = UDim.new(0, 20), Color = Color3.fromRGB(0, 0, 0), Enabled = true, Inset = false, Mode = Enum.ApplyShadowMode.Shape, Offset = UDim2.new(0, 0, 0, 0), ShowBehindParent = true, Spread = UDim2.new(0, 0, 0, 0), Transparency = 0.5, ZIndex = -1 })
c(91, "Frame", 86, { Name = "MainMenuTemplate", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 441, 0, 289), Visible = false })
c(92, "ScrollingFrame", 91, { Name = "ScrollingFrame", Active = true, AutomaticCanvasSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0, 0, 0.16955018043518, 0), ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0), ScrollBarImageTransparency = 1, ScrollBarThickness = 1, ScrollingDirection = Enum.ScrollingDirection.Y, Size = UDim2.new(0, 441, 0, 240) })
c(93, "CanvasGroup", 92, { Name = "Template1", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(94, "UICorner", 93, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(95, "Frame", 93, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(96, "UICorner", 95, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(97, "UIGradient", 95, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(98, "UIStroke", 93, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(99, "TextLabel", 93, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(100, "UIGradient", 99, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(101, "UIStroke", 99, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(102, "ImageButton", 93, { Name = "Toggle", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.83687943220139, 0, 0.21999999880791, 0), Size = UDim2.new(0, 53, 0, 27) })
c(103, "UICorner", 102, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(104, "UIStroke", 102, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(105, "Frame", 102, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.50793653726578, 2, 0.11111111193895, 0), Size = UDim2.new(0, 21, 0, 21) })
c(106, "UICorner", 105, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(107, "UIStroke", 105, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(80, 80, 80), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(108, "UIGradient", 105, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))}) })
c(109, "TextBox", 93, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "bind", Position = UDim2.new(0.68794327974319, 0, 0.20000000298023, 1), Size = UDim2.new(0, 53, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(110, "UICorner", 109, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(111, "UIStroke", 109, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(112, "UIListLayout", 92, { Name = "UIListLayout", Padding = UDim.new(0, 30), SortOrder = Enum.SortOrder.LayoutOrder })
c(113, "UIPadding", 92, { Name = "UIPadding", PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingTop = UDim.new(0, 8) })
c(114, "CanvasGroup", 92, { Name = "Template2", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(115, "UICorner", 114, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(116, "Frame", 114, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(117, "UICorner", 116, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(118, "UIGradient", 116, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(119, "UIStroke", 114, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(120, "TextLabel", 114, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(121, "UIGradient", 120, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(122, "UIStroke", 120, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(123, "ImageButton", 114, { Name = "Toggle", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.83687943220139, 0, 0.21999999880791, 0), Size = UDim2.new(0, 53, 0, 27) })
c(124, "UICorner", 123, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(125, "UIStroke", 123, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(126, "Frame", 123, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.50793653726578, 2, 0.11111111193895, 0), Size = UDim2.new(0, 21, 0, 21) })
c(127, "UICorner", 126, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(128, "UIStroke", 126, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(80, 80, 80), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(129, "UIGradient", 126, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))}) })
c(130, "Frame", 114, { Name = "SliderHolder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1.1358025074005, -356, -0.043478261679411, 14), Size = UDim2.new(0, 223, 0, 27) })
c(131, "CanvasGroup", 130, { Name = "BarBg", BackgroundColor3 = Color3.fromRGB(58, 58, 58), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.0030638005118817, 0, 0.1348153501749, 0), Size = UDim2.new(0, 223, 0, 18) })
c(132, "UICorner", 131, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(133, "UIStroke", 131, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(134, "Frame", 131, { Name = "Bar", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 196, 0, 18) })
c(135, "UICorner", 134, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(136, "UIGradient", 134, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.55440413951874, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.81692570447922, Color3.fromRGB(66, 66, 66)), ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 93, 93))}), Rotation = 90 })
c(137, "UIStroke", 134, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize, Thickness = 0.059614915400743, Transparency = 0, ZIndex = 1 })
c(138, "TextLabel", 130, { Name = "IndicatorText", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.41621351242065, 0, 0.097779452800751, 0), Size = UDim2.new(0, 36, 0, 18), Text = "1", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(139, "UIStroke", 138, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(140, "CanvasGroup", 92, { Name = "Template3", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(141, "UICorner", 140, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(142, "Frame", 140, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(143, "UICorner", 142, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(144, "UIGradient", 142, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(145, "UIStroke", 140, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(146, "TextLabel", 140, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(147, "UIGradient", 146, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(148, "UIStroke", 146, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(149, "ImageButton", 140, { Name = "Toggle", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.83687943220139, 0, 0.21999999880791, 0), Size = UDim2.new(0, 53, 0, 27) })
c(150, "UICorner", 149, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(151, "UIStroke", 149, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(152, "Frame", 149, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.50793653726578, 2, 0.11111111193895, 0), Size = UDim2.new(0, 21, 0, 21) })
c(153, "UICorner", 152, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(154, "UIStroke", 152, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(80, 80, 80), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(155, "UIGradient", 152, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))}) })
c(156, "TextBox", 140, { Name = "InputBox", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "Jumlah", Position = UDim2.new(0.60756498575211, -94, 0.20000000298023, 1), Size = UDim2.new(0, 87, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(157, "UICorner", 156, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(158, "UIStroke", 156, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(159, "TextBox", 140, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "bind", Position = UDim2.new(0.68794327974319, 0, 0.20000000298023, 1), Size = UDim2.new(0, 53, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(160, "UICorner", 159, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(161, "UIStroke", 159, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(162, "CanvasGroup", 92, { Name = "Template4", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(163, "UICorner", 162, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(164, "Frame", 162, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(165, "UICorner", 164, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(166, "UIGradient", 164, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(167, "UIStroke", 162, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(168, "TextLabel", 162, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(169, "UIGradient", 168, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(170, "UIStroke", 168, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(171, "ImageButton", 162, { Name = "Gobutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://115911786914037", Position = UDim2.new(0.88179671764374, 0, 0.21999999880791, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 27, 0, 27) })
c(172, "TextBox", 162, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "bind", Position = UDim2.new(0.68794327974319, 0, 0.20000000298023, 1), Size = UDim2.new(0, 53, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(173, "UICorner", 172, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(174, "UIStroke", 172, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(175, "Frame", 91, { Name = "HeaderFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.018140589818358, 0, 0.02076124586165, 0), Size = UDim2.new(0, 423, 0, 41) })
c(176, "ImageLabel", 175, { Name = "MenuIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://117854237557010", Position = UDim2.new(0.01725765503943, -10, 0.0024391731712967, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(177, "TextLabel", 175, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.087470449507236, 0, 0.0024391731712967, 0), Size = UDim2.new(0, 156, 0, 39), Text = "Player & Troll", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(178, "TextBox", 175, { Name = "Searchbox", BackgroundColor3 = Color3.fromRGB(35, 35, 35), BackgroundTransparency = 0.30000001192093, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "Search....", Position = UDim2.new(0.51300233602524, 0, 0.19121941924095, 0), Size = UDim2.new(0, 201, 0, 25), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextDirection = Enum.TextDirection.LeftToRight, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(179, "UICorner", 178, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(180, "ImageLabel", 178, { Name = "ImageLabel", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://2804603863", Position = UDim2.new(0.88293826580048, 45, 0.54000002145767, 0), Rotation = 90, Size = UDim2.new(0, 15, 0, 15) })
c(181, "UIStroke", 178, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Inner, Color = Color3.fromRGB(94, 94, 94), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0.60000002384186, ZIndex = 1 })
c(182, "UIPadding", 178, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 40), PaddingTop = UDim.new(0, 5) })
c(183, "UIStroke", 178, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(184, "Frame", 86, { Name = "AboutMenuFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 441, 0, 289) })
c(185, "Frame", 184, { Name = "HeaderFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.018140589818358, 0, 0.02076124586165, 0), Size = UDim2.new(0, 423, 0, 41) })
c(186, "ImageLabel", 185, { Name = "MenuIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://96296512150129", Position = UDim2.new(0.01725765503943, -10, 0.0024391731712967, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(187, "TextLabel", 185, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.087470449507236, 0, 0.0024391731712967, 0), Size = UDim2.new(0, 156, 0, 39), Text = "About Script", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(188, "Frame", 184, { Name = "DescriptionBg", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.018140589818358, 0, 0.19377163052559, 0), Size = UDim2.new(0, 423, 0, 227) })
c(189, "TextLabel", 188, { Name = "DescText", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 423, 0, 164), Text = "Script ini dibuat pribadi dilarang keras untuk membagikan tanpa seizin developer", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 20, TextStrokeTransparency = 0, TextWrapped = true, TextYAlignment = Enum.TextYAlignment.Top })
c(190, "Frame", 188, { Name = "Profil", BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.203309699893, 0, 0.62114536762238, 0), Size = UDim2.new(0, 253, 0, 62) })
c(191, "ImageLabel", 190, { Name = "AvatarImage", BackgroundColor3 = Color3.fromRGB(90, 90, 90), BackgroundTransparency = 0, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104819520545814", Position = UDim2.new(0.026041666045785, 0, 0.096774190664291, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 50, 0, 50) })
c(192, "UICorner", 191, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(193, "TextLabel", 190, { Name = "Name", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.25860488414764, 0, 0, 0), Size = UDim2.new(0, 187, 0, 25), Text = "Sugeng_StangSeher", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(194, "TextLabel", 190, { Name = "Age", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.25860476493835, 0, 0.5, 0), Size = UDim2.new(0, 187, 0, 25), Text = "Age : 15/12/2024 (123d)", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(195, "TextLabel", 184, { Name = "Copyright", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.048921685665846, 0, 0.93323504924774, 0), Size = UDim2.new(0, 394, 0, 13), Text = "© Copyright Developed by Sugeng 2026", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(196, "Frame", 86, { Name = "OtherMenuTemplate", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 441, 0, 289), Visible = false })
c(197, "Frame", 196, { Name = "HeaderFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.018140589818358, 0, 0.02076124586165, 0), Size = UDim2.new(0, 423, 0, 41) })
c(198, "ImageLabel", 197, { Name = "MenuIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://86646064489131", Position = UDim2.new(0.01725765503943, -10, 0.0024391731712967, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(199, "TextBox", 197, { Name = "Searchbox", BackgroundColor3 = Color3.fromRGB(35, 35, 35), BackgroundTransparency = 0.30000001192093, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "Search....", Position = UDim2.new(0.51300233602524, 0, 0.19121941924095, 0), Size = UDim2.new(0, 201, 0, 25), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextDirection = Enum.TextDirection.LeftToRight, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(200, "UICorner", 199, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(201, "ImageLabel", 199, { Name = "ImageLabel", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://2804603863", Position = UDim2.new(0.88293826580048, 45, 0.54000002145767, 0), Rotation = 90, Size = UDim2.new(0, 15, 0, 15) })
c(202, "UIStroke", 199, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Inner, Color = Color3.fromRGB(94, 94, 94), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0.60000002384186, ZIndex = 1 })
c(203, "UIPadding", 199, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 40), PaddingTop = UDim.new(0, 5) })
c(204, "UIStroke", 199, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(205, "TextLabel", 197, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.087470449507236, 0, 0.0024391731712967, 0), Size = UDim2.new(0, 156, 0, 39), Text = "Other feature", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(206, "ScrollingFrame", 196, { Name = "ScrollingFrame", Active = true, AutomaticCanvasSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0, 0, 0.16955018043518, 0), ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0), ScrollBarImageTransparency = 1, ScrollBarThickness = 1, ScrollingDirection = Enum.ScrollingDirection.Y, Size = UDim2.new(0, 441, 0, 240) })
c(207, "UIListLayout", 206, { Name = "UIListLayout", Padding = UDim.new(0, 30), SortOrder = Enum.SortOrder.LayoutOrder })
c(208, "UIPadding", 206, { Name = "UIPadding", PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingTop = UDim.new(0, 8) })
c(209, "CanvasGroup", 206, { Name = "Template1", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(210, "UICorner", 209, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(211, "Frame", 209, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(212, "UICorner", 211, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(213, "UIGradient", 211, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(214, "UIStroke", 209, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(215, "TextLabel", 209, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(216, "UIGradient", 215, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(217, "UIStroke", 215, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(218, "ImageButton", 209, { Name = "Gobutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://115911786914037", Position = UDim2.new(0.88179671764374, 0, 0.21999999880791, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 27, 0, 27) })
c(219, "TextBox", 209, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "bind", Position = UDim2.new(0.68794327974319, 0, 0.20000000298023, 1), Size = UDim2.new(0, 53, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(220, "UICorner", 219, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(221, "UIStroke", 219, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(222, "Frame", 86, { Name = "SettingMenuTemplate", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 441, 0, 289), Visible = false })
c(223, "Frame", 222, { Name = "HeaderFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.018140589818358, 0, 0.02076124586165, 0), Size = UDim2.new(0, 423, 0, 41) })
c(224, "ImageLabel", 223, { Name = "SettingIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104670214139271", Position = UDim2.new(0.01725765503943, -10, 0.0024391731712967, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 40, 0, 40) })
c(225, "TextLabel", 223, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.087470449507236, 0, 0.0024391731712967, 0), Size = UDim2.new(0, 156, 0, 39), Text = "Setting Menu", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(226, "ScrollingFrame", 222, { Name = "ScrollingFrame", Active = true, AutomaticCanvasSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0, 0, 0.16955018043518, 0), ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0), ScrollBarImageTransparency = 1, ScrollBarThickness = 1, ScrollingDirection = Enum.ScrollingDirection.Y, Size = UDim2.new(0, 441, 0, 240) })
c(227, "UIListLayout", 226, { Name = "UIListLayout", Padding = UDim.new(0, 30), SortOrder = Enum.SortOrder.LayoutOrder })
c(228, "UIPadding", 226, { Name = "UIPadding", PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingTop = UDim.new(0, 8) })
c(229, "CanvasGroup", 226, { Name = "Template1", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(230, "UICorner", 229, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(231, "Frame", 229, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(232, "UICorner", 231, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(233, "UIGradient", 231, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(234, "UIStroke", 229, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(235, "TextLabel", 229, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(236, "UIGradient", 235, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(237, "UIStroke", 235, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(238, "ImageButton", 229, { Name = "Toggle", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.83687943220139, 0, 0.21999999880791, 0), Size = UDim2.new(0, 53, 0, 27) })
c(239, "UICorner", 238, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(240, "UIStroke", 238, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(241, "Frame", 238, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.50793653726578, 2, 0.11111111193895, 0), Size = UDim2.new(0, 21, 0, 21) })
c(242, "UICorner", 241, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(243, "UIStroke", 241, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(80, 80, 80), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(244, "UIGradient", 241, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))}) })
c(245, "TextBox", 229, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "bind", Position = UDim2.new(0.68794327974319, 0, 0.20000000298023, 1), Size = UDim2.new(0, 53, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(246, "UICorner", 245, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(247, "UIStroke", 245, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(248, "CanvasGroup", 226, { Name = "TemplateConfig", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.35714286565781, 0), Size = UDim2.new(0, 423, 0, 143) })
c(249, "UICorner", 248, { Name = "UICorner" })
c(250, "UIStroke", 248, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(251, "Frame", 248, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 137) })
c(252, "UICorner", 251, { Name = "UICorner" })
c(253, "UIGradient", 251, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(254, "TextLabel", 248, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.51300233602524, -1, 0.11412592232227, 0), Size = UDim2.new(0, 114, 0, 23), Text = "Load Cofig", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(255, "UIGradient", 254, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(256, "UIStroke", 254, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(257, "ImageButton", 248, { Name = "Savebutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.31442078948021, -1, 0.083916082978249, 0), Size = UDim2.new(0, 76, 0, 30) })
c(258, "UIStroke", 257, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(259, "UICorner", 257, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(260, "UIGradient", 257, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(261, "ImageLabel", 257, { Name = "SaveIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://83720049245314", Position = UDim2.new(0, 0, 0.066666670143604, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 25, 0, 25) })
c(262, "TextLabel", 257, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.32154443860054, 0, 0.11412557214499, 0), Size = UDim2.new(0, 45, 0, 23), Text = "Save", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(263, "UIGradient", 262, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(264, "UIStroke", 262, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(265, "TextLabel", 248, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.018912529572845, -1, 0.11412592232227, 0), Size = UDim2.new(0, 114, 0, 23), Text = "Save Cofig", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(266, "UIGradient", 265, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(267, "UIStroke", 265, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(268, "ImageButton", 248, { Name = "Loadbutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.80851066112518, -1, 0.083916082978249, 0), Size = UDim2.new(0, 76, 0, 30) })
c(269, "UIStroke", 268, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(270, "UICorner", 268, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(271, "UIGradient", 268, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(272, "ImageLabel", 268, { Name = "LoadIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://139528802110206", Position = UDim2.new(0, 0, 0.066666670143604, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 25, 0, 25) })
c(273, "TextLabel", 268, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.32154443860054, 0, 0.11412557214499, 0), Size = UDim2.new(0, 45, 0, 23), Text = "Load", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(274, "UIGradient", 273, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(275, "UIStroke", 273, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(276, "ScrollingFrame", 248, { Name = "ScrollingConfig", Active = true, AutomaticCanvasSize = Enum.AutomaticSize.X, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.016548464074731, 0, 0.37762236595154, -4), ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0), ScrollBarThickness = 1, ScrollingDirection = Enum.ScrollingDirection.X, Size = UDim2.new(0, 410, 0, 83) })
c(277, "UIListLayout", 276, { Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder })
c(278, "UIPadding", 276, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) })
c(279, "UICorner", 276, { Name = "UICorner" })
c(280, "UIStroke", 276, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(281, "Frame", 276, { Name = "CardTemplate", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 99, 0, 72) })
c(282, "UICorner", 281, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(283, "UIStroke", 281, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(284, "ImageLabel", 281, { Name = "SugengIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104819520545814", ImageTransparency = 0.5, Position = UDim2.new(0.12121181190014, 3, 0.055555555969477, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 72, 0, 64) })
c(285, "TextLabel", 281, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.088759914040565, -1, 0.19745932519436, -4), Size = UDim2.new(0, 88, 0, 36), Text = "Sugeng Config", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(286, "UIGradient", 285, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(287, "UIStroke", 285, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(288, "ImageButton", 281, { Name = "DeleteBtn", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://11768918600", ImageColor3 = Color3.fromRGB(255, 0, 0), Position = UDim2.new(0.75366151332855, 0, 0.65555572509766, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 20, 0, 20) })
c(289, "CanvasGroup", 226, { Name = "Template4", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(290, "UICorner", 289, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(291, "Frame", 289, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(292, "UICorner", 291, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(293, "UIGradient", 291, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(294, "UIStroke", 289, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(295, "TextLabel", 289, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(296, "UIGradient", 295, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(297, "UIStroke", 295, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(298, "ImageButton", 289, { Name = "Gobutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://115911786914037", Position = UDim2.new(0.88179671764374, 0, 0.21999999880791, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 27, 0, 27) })
c(299, "TextBox", 289, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "bind", Position = UDim2.new(0.68794327974319, 0, 0.20000000298023, 1), Size = UDim2.new(0, 53, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(300, "UICorner", 299, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(301, "UIStroke", 299, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(302, "CanvasGroup", 226, { Name = "Template3", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(303, "UICorner", 302, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(304, "Frame", 302, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(305, "UICorner", 304, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(306, "UIGradient", 304, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(307, "UIStroke", 302, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(308, "TextLabel", 302, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(309, "UIGradient", 308, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(310, "UIStroke", 308, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(311, "ImageButton", 302, { Name = "Toggle", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.83687943220139, 0, 0.21999999880791, 0), Size = UDim2.new(0, 53, 0, 27) })
c(312, "UICorner", 311, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(313, "UIStroke", 311, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(314, "Frame", 311, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.50793653726578, 2, 0.11111111193895, 0), Size = UDim2.new(0, 21, 0, 21) })
c(315, "UICorner", 314, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(316, "UIStroke", 314, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(80, 80, 80), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(317, "UIGradient", 314, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))}) })
c(318, "TextBox", 302, { Name = "InputBox", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "Jumlah", Position = UDim2.new(0.60756498575211, -94, 0.20000000298023, 1), Size = UDim2.new(0, 87, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(319, "UICorner", 318, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(320, "UIStroke", 318, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(321, "TextBox", 302, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "bind", Position = UDim2.new(0.68794327974319, 0, 0.20000000298023, 1), Size = UDim2.new(0, 53, 0, 27), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(322, "UICorner", 321, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(323, "UIStroke", 321, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(324, "CanvasGroup", 226, { Name = "Template2", BackgroundColor3 = Color3.fromRGB(30, 30, 30), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 50) })
c(325, "UICorner", 324, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(326, "Frame", 324, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 423, 0, 48) })
c(327, "UICorner", 326, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(328, "UIGradient", 326, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(329, "UIStroke", 324, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(330, "TextLabel", 324, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.070921987295151, 0, 0.23999999463558, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Sugeng", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(331, "UIGradient", 330, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(332, "UIStroke", 330, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(333, "ImageButton", 324, { Name = "Toggle", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.83687943220139, 0, 0.21999999880791, 0), Size = UDim2.new(0, 53, 0, 27) })
c(334, "UICorner", 333, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(335, "UIStroke", 333, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(336, "Frame", 333, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.50793653726578, 2, 0.11111111193895, 0), Size = UDim2.new(0, 21, 0, 21) })
c(337, "UICorner", 336, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(338, "UIStroke", 336, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(80, 80, 80), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(339, "UIGradient", 336, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))}) })
c(340, "Frame", 324, { Name = "SliderHolder", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(1.1358025074005, -356, -0.043478261679411, 14), Size = UDim2.new(0, 223, 0, 27) })
c(341, "CanvasGroup", 340, { Name = "BarBg", BackgroundColor3 = Color3.fromRGB(58, 58, 58), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(-0.0030638005118817, 0, 0.1348153501749, 0), Size = UDim2.new(0, 223, 0, 18) })
c(342, "UICorner", 341, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(343, "UIStroke", 341, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(344, "Frame", 341, { Name = "Bar", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 196, 0, 18) })
c(345, "UICorner", 344, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(346, "UIGradient", 344, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.55440413951874, Color3.fromRGB(75, 75, 75)), ColorSequenceKeypoint.new(0.81692570447922, Color3.fromRGB(66, 66, 66)), ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 93, 93))}), Rotation = 90 })
c(347, "UIStroke", 344, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize, Thickness = 0.059614915400743, Transparency = 0, ZIndex = 1 })
c(348, "TextLabel", 340, { Name = "IndicatorText", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.41621351242065, 0, 0.097779452800751, 0), Size = UDim2.new(0, 36, 0, 18), Text = "1", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(349, "UIStroke", 348, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(350, "ImageLabel", 86, { Name = "SugengIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104819520545814", ImageTransparency = 0.69999998807907, ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 441, 0, 289) })
c(351, "Frame", 1, { Name = "NotficationBgFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.79633402824402, 0, 0.01111111138016, 0), Size = UDim2.new(0, 193, 0, 129), Visible = false })
c(352, "UIListLayout", 351, { Name = "UIListLayout", Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder })
c(353, "Frame", 351, { Name = "NotifTemplate", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 193, 0, 28) })
c(354, "UICorner", 353, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(355, "UIGradient", 353, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(356, "UIShadow", 353, { Name = "UIShadow", BlurRadius = UDim.new(0, 20), Color = Color3.fromRGB(0, 0, 0), Enabled = true, Inset = false, Mode = Enum.ApplyShadowMode.Shape, Offset = UDim2.new(0, 0, 0, 0), ShowBehindParent = true, Spread = UDim2.new(0, 0, 0, 0), Transparency = 0.5, ZIndex = -1 })
c(357, "UIStroke", 353, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(358, "TextLabel", 353, { Name = "NotifDesc", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.036269430071115, 0, 0.10907336324453, 0), Size = UDim2.new(0, 179, 0, 21), Text = "Bypass Actived", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(359, "Frame", 1, { Name = "CardDropFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.77596741914749, 0, 0.40185186266899, -45), Size = UDim2.new(0, 174, 0, 103), Visible = false })
c(360, "UICorner", 359, { Name = "UICorner" })
c(361, "UIGradient", 359, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(362, "UIStroke", 359, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(363, "TextLabel", 359, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.05942789837718, 0, 0.14291262626648, 0), Size = UDim2.new(0, 81, 0, 23), Text = "Spectate", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(364, "UIGradient", 363, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(365, "UIStroke", 363, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(366, "ImageButton", 359, { Name = "Closebutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.79885059595108, 0, -0.34951457381248, 0), Size = UDim2.new(0, 35, 0, 36) })
c(367, "TextLabel", 366, { Name = "X", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.2136143296957, 0, 0.10111236572266, 0), Size = UDim2.new(0, 27, 0, 27), Text = "X", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(368, "UIGradient", 367, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.34948098659515, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(97, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(93, 0, 0))}), Rotation = 90 })
c(369, "UIStroke", 367, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(370, "UIShadow", 359, { Name = "UIShadow", BlurRadius = UDim.new(0, 20), Color = Color3.fromRGB(0, 0, 0), Enabled = true, Inset = false, Mode = Enum.ApplyShadowMode.Shape, Offset = UDim2.new(0, 0, 0, 0), ShowBehindParent = true, Spread = UDim2.new(0, 0, 0, 0), Transparency = 0.5, ZIndex = -1 })
c(371, "ImageButton", 359, { Name = "Toggle", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.64722418785095, 0, 0.12291266024113, 0), Size = UDim2.new(0, 53, 0, 27) })
c(372, "UICorner", 371, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(373, "UIStroke", 371, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(374, "Frame", 371, { Name = "Indicator", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.50793653726578, 2, 0.11111111193895, 0), Size = UDim2.new(0, 21, 0, 21) })
c(375, "UICorner", 374, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(376, "UIStroke", 374, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(80, 80, 80), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(377, "UIGradient", 374, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 0))}) })
c(378, "ImageButton", 359, { Name = "DropHitbox", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.057471264153719, 0, 0.60194176435471, 0), Size = UDim2.new(0, 152, 0, 31) })
c(379, "UICorner", 378, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(380, "UIStroke", 378, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(381, "TextLabel", 378, { Name = "SelectedName", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.059427764266729, 0, 0.14291283488274, 0), Size = UDim2.new(0, 109, 0, 23), Text = "Select", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(382, "UIGradient", 381, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(383, "UIStroke", 381, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(384, "ImageLabel", 378, { Name = "ImageLabel", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://139156519138704", Position = UDim2.new(0.875, 3, 0.48387095332146, 0), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 30, 0, 30) })
c(385, "Frame", 359, { Name = "DropDownFrame", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0, 0, 1, 4), Size = UDim2.new(0, 173, 0, 155), Visible = false })
c(386, "TextBox", 385, { Name = "Searchbox", BackgroundColor3 = Color3.fromRGB(35, 35, 35), BackgroundTransparency = 0.30000001192093, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "Search....", Size = UDim2.new(0, 173, 0, 25), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextDirection = Enum.TextDirection.LeftToRight, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(387, "UICorner", 386, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(388, "ImageLabel", 386, { Name = "ImageLabel", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://2804603863", Position = UDim2.new(0.81563037633896, 45, 0.47333374619484, 0), Rotation = 90, Size = UDim2.new(0, 15, 0, 15) })
c(389, "UIStroke", 386, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Inner, Color = Color3.fromRGB(58, 58, 58), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0.60000002384186, ZIndex = 1 })
c(390, "UIPadding", 386, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 40), PaddingTop = UDim.new(0, 5) })
c(391, "UIStroke", 386, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(118, 118, 118), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(392, "ScrollingFrame", 385, { Name = "ScrollingFrame", Active = true, AutomaticCanvasSize = Enum.AutomaticSize.Y, BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0, 0, 0.18709677457809, 0), ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0), ScrollBarImageTransparency = 1, ScrollBarThickness = 1, ScrollingDirection = Enum.ScrollingDirection.Y, Size = UDim2.new(0, 173, 0, 126) })
c(393, "UICorner", 392, { Name = "UICorner" })
c(394, "UIGradient", 392, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(395, "UIShadow", 392, { Name = "UIShadow", BlurRadius = UDim.new(0, 20), Color = Color3.fromRGB(0, 0, 0), Enabled = true, Inset = false, Mode = Enum.ApplyShadowMode.Shape, Offset = UDim2.new(0, 0, 0, 0), ShowBehindParent = true, Spread = UDim2.new(0, 0, 0, 0), Transparency = 0.5, ZIndex = -1 })
c(396, "UIStroke", 392, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(397, "ImageButton", 392, { Name = "TemplateOption", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 163, 0, 31) })
c(398, "UICorner", 397, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(399, "UIStroke", 397, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(400, "TextLabel", 397, { Name = "Name", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.05942877009511, 0, 0.1751708984375, -2), Size = UDim2.new(0, 146, 0, 23), Text = "Select", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(401, "UIGradient", 400, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(402, "UIStroke", 400, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(403, "UIListLayout", 392, { Name = "UIListLayout", Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder })
c(404, "UIPadding", 392, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) })
c(405, "UIListLayout", 385, { Name = "UIListLayout", Padding = UDim.new(0, 4), SortOrder = Enum.SortOrder.LayoutOrder })
c(406, "Frame", 1, { Name = "ConfirmationConfig", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.41038697957993, 0, 0.39501038193703, 0), Size = UDim2.new(0, 175, 0, 100), Visible = false })
c(407, "UIStroke", 406, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(408, "UIShadow", 406, { Name = "UIShadow", BlurRadius = UDim.new(0, 20), Color = Color3.fromRGB(0, 0, 0), Enabled = true, Inset = false, Mode = Enum.ApplyShadowMode.Shape, Offset = UDim2.new(0, 0, 0, 0), ShowBehindParent = true, Spread = UDim2.new(0, 0, 0, 0), Transparency = 0.5, ZIndex = -1 })
c(409, "UIGradient", 406, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(410, "UICorner", 406, { Name = "UICorner", CornerRadius = UDim.new(0, 6) })
c(411, "TextBox", 406, { Name = "InputBox", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderColor3 = Color3.fromRGB(76, 76, 76), PlaceholderText = "Type Config Name..", Position = UDim2.new(0.028571428731084, 0, 0.059999998658895, 2), Size = UDim2.new(0, 166, 0, 34), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0.5, TextTruncate = Enum.TextTruncate.AtEnd, TextWrapped = true })
c(412, "UICorner", 411, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(413, "UIStroke", 411, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(414, "ImageButton", 406, { Name = "Cancelbutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.051428571343422, 0, 0.61000001430511, 0), Size = UDim2.new(0, 75, 0, 29) })
c(415, "UICorner", 414, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(416, "UIStroke", 414, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(417, "UIGradient", 414, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(95, 0, 0))}), Rotation = 90 })
c(418, "TextLabel", 414, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.086094565689564, 0, 0.073947250843048, 0), Size = UDim2.new(0, 62, 0, 23), Text = "Cancel", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(419, "UIGradient", 418, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(420, "UIStroke", 418, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(421, "ImageButton", 406, { Name = "Confirmbutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.51999998092651, 0, 0.61000001430511, 0), Size = UDim2.new(0, 75, 0, 29) })
c(422, "UICorner", 421, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(423, "UIStroke", 421, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(424, "UIGradient", 421, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 76, 0))}), Rotation = 90 })
c(425, "TextLabel", 421, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.086094565689564, 0, 0.073947250843048, 0), Size = UDim2.new(0, 62, 0, 23), Text = "Confirm", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(426, "UIGradient", 425, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(427, "UIStroke", 425, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(428, "Frame", 1, { Name = "ConfirmationClose", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.41038697957993, 0, 0.39501038193703, 0), Size = UDim2.new(0, 175, 0, 100), Visible = false })
c(429, "UIStroke", 428, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(430, "UIShadow", 428, { Name = "UIShadow", BlurRadius = UDim.new(0, 20), Color = Color3.fromRGB(0, 0, 0), Enabled = true, Inset = false, Mode = Enum.ApplyShadowMode.Shape, Offset = UDim2.new(0, 0, 0, 0), ShowBehindParent = true, Spread = UDim2.new(0, 0, 0, 0), Transparency = 0.5, ZIndex = -1 })
c(431, "UIGradient", 428, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))}), Rotation = 90 })
c(432, "UICorner", 428, { Name = "UICorner", CornerRadius = UDim.new(0, 6) })
c(433, "ImageButton", 428, { Name = "Cancelbutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.051428571343422, 0, 0.61000001430511, 0), Size = UDim2.new(0, 75, 0, 29) })
c(434, "UICorner", 433, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(435, "UIStroke", 433, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(436, "UIGradient", 433, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(95, 0, 0))}), Rotation = 90 })
c(437, "TextLabel", 433, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.086094565689564, 0, 0.073947250843048, 0), Size = UDim2.new(0, 62, 0, 23), Text = "Cancel", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(438, "UIGradient", 437, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(439, "UIStroke", 437, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(440, "ImageButton", 428, { Name = "Confirmbutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.51999998092651, 0, 0.61000001430511, 0), Size = UDim2.new(0, 75, 0, 29) })
c(441, "UICorner", 440, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(442, "UIStroke", 440, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(141, 141, 141), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(443, "UIGradient", 440, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 76, 0))}), Rotation = 90 })
c(444, "TextLabel", 440, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.086094565689564, 0, 0.073947250843048, 0), Size = UDim2.new(0, 62, 0, 23), Text = "Confirm", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = Enum.TextXAlignment.Left })
c(445, "UIGradient", 444, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(446, "UIStroke", 444, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(447, "TextLabel", 428, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.022857142612338, 0, 0.073947295546532, -4), Size = UDim2.new(0, 166, 0, 19), Text = "Warning!", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(448, "UIGradient", 447, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 85, 0)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(84, 28, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(52, 35, 0))}), Rotation = 90 })
c(449, "UIStroke", 447, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(450, "TextLabel", 428, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.022857142612338, 0, 0.26394730806351, -1), Size = UDim2.new(0, 166, 0, 28), Text = "Are you sure want close this script?", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(451, "UIStroke", 450, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(452, "Frame", 1, { Name = "IntroBg", BackgroundColor3 = Color3.fromRGB(24, 24, 24), BackgroundTransparency = 0.5, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 982, 0, 481), Visible = false })
c(453, "ImageLabel", 452, { Name = "SugengIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104819520545814", Position = UDim2.new(0.33299389481544, 0, 0.2245322316885, 1), ScaleType = Enum.ScaleType.Fit, Size = UDim2.new(0, 269, 0, 251), ZIndex = 5 })
c(454, "TextLabel", 452, { Name = "S", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.32892057299614, -7, 0.69022870063782, -21), Size = UDim2.new(0, 60, 0, 60), Text = "S", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextWrapped = true })
c(455, "UIStroke", 454, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(75, 75, 75), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(456, "UIGradient", 454, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.50346022844315, Color3.fromRGB(83, 83, 83)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}), Rotation = 45 })
c(457, "TextLabel", 452, { Name = "U", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.37678208947182, -7, 0.69022870063782, -21), Size = UDim2.new(0, 60, 0, 60), Text = "U", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextWrapped = true })
c(458, "UIStroke", 457, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(75, 75, 75), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(459, "UIGradient", 457, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.50346022844315, Color3.fromRGB(83, 83, 83)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}), Rotation = 45 })
c(460, "TextLabel", 452, { Name = "G1", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.42566192150116, -7, 0.69022870063782, -21), Size = UDim2.new(0, 60, 0, 60), Text = "G", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextWrapped = true })
c(461, "UIStroke", 460, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(75, 75, 75), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(462, "UIGradient", 460, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.50346022844315, Color3.fromRGB(83, 83, 83)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}), Rotation = 45 })
c(463, "TextLabel", 452, { Name = "E", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.4704684317112, -7, 0.69022870063782, -21), Size = UDim2.new(0, 60, 0, 60), Text = "E", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextWrapped = true })
c(464, "UIStroke", 463, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(75, 75, 75), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(465, "UIGradient", 463, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.50346022844315, Color3.fromRGB(83, 83, 83)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}), Rotation = 45 })
c(466, "TextLabel", 452, { Name = "N", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.51629328727722, -7, 0.69022870063782, -21), Size = UDim2.new(0, 60, 0, 60), Text = "N", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextWrapped = true })
c(467, "UIStroke", 466, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(75, 75, 75), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(468, "UIGradient", 466, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.50346022844315, Color3.fromRGB(83, 83, 83)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}), Rotation = 45 })
c(469, "TextLabel", 452, { Name = "G2", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.5641548037529, -7, 0.69022870063782, -21), Size = UDim2.new(0, 60, 0, 60), Text = "G", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextWrapped = true })
c(470, "UIStroke", 469, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(75, 75, 75), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(471, "UIGradient", 469, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.50346022844315, Color3.fromRGB(83, 83, 83)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}), Rotation = 45 })
c(472, "CanvasGroup", 1, { Name = "LoginPage", BackgroundColor3 = Color3.fromRGB(24, 24, 24), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.38798370957375, 0, 0.39501038193703, 0), Size = UDim2.new(0, 219, 0, 100), Visible = false })
c(473, "Frame", 472, { Name = "Gradient", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Size = UDim2.new(0, 217, 0, 94) })
c(474, "UICorner", 473, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(475, "UIGradient", 473, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 24, 24))}), Rotation = 90 })
c(476, "UIStroke", 472, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(116, 116, 116), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(477, "UICorner", 472, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(478, "UIShadow", 472, { Name = "UIShadow", BlurRadius = UDim.new(0, 20), Color = Color3.fromRGB(0, 0, 0), Enabled = true, Inset = false, Mode = Enum.ApplyShadowMode.Shape, Offset = UDim2.new(0, 0, 0, 0), ShowBehindParent = true, Spread = UDim2.new(0, 0, 0, 0), Transparency = 0.20000000298023, ZIndex = -1 })
c(479, "ImageLabel", 472, { Name = "SugengIcon", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Image = "rbxassetid://104819520545814", ImageTransparency = 0.60000002384186, Size = UDim2.new(0, 217, 0, 100) })
c(480, "TextBox", 472, { Name = "InputBox", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), PlaceholderText = "Type Your Key...", Position = UDim2.new(0.041095890104771, 0, 0.17000000178814, 0), Size = UDim2.new(0, 200, 0, 32), Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextStrokeTransparency = 0.5, TextWrapped = true })
c(481, "UIStroke", 480, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(116, 116, 116), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(482, "UICorner", 480, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(483, "ImageButton", 472, { Name = "Loginbutton", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.27397260069847, 0, 0.61000001430511, 0), Size = UDim2.new(0, 100, 0, 33) })
c(484, "UICorner", 483, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(485, "UIStroke", 483, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Center, Color = Color3.fromRGB(116, 116, 116), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(486, "UIGradient", 483, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(58, 58, 58)), ColorSequenceKeypoint.new(1, Color3.fromRGB(24, 24, 24))}), Rotation = 90 })
c(487, "TextLabel", 483, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/Michroma.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.089427798986435, 0, 0.18181818723679, 0), Size = UDim2.new(0, 81, 0, 21), Text = "Login", TextColor3 = Color3.fromRGB(255, 255, 255), TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(488, "UIGradient", 487, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.35294118523598, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0.782006919384, Color3.fromRGB(106, 106, 106)), ColorSequenceKeypoint.new(1, Color3.fromRGB(152, 152, 152))}), Rotation = 90 })
c(489, "UIStroke", 487, { Name = "UIStroke", ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual, BorderOffset = UDim.new(0, 0), BorderStrokePosition = Enum.BorderStrokePosition.Outer, Color = Color3.fromRGB(0, 0, 0), Enabled = true, LineJoinMode = Enum.LineJoinMode.Round, StrokeSizingMode = Enum.StrokeSizingMode.FixedSize, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(490, "Frame", 1, { Name = "PerformanceMonitoringBg", BackgroundColor3 = Color3.fromRGB(0, 0, 0), BorderColor3 = Color3.fromRGB(0, 0, 0), BorderSizePixel = 0, Position = UDim2.new(0.012514404021204, -13, 0.96465694904327, 0), Size = UDim2.new(0, 149, 0, 17), Visible = false })
c(491, "TextLabel", 490, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Size = UDim2.new(0, 42, 0, 17), Text = "FPS :", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14 })
c(492, "TextLabel", 490, { Name = "FpsIndicatorText", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.26845636963844, 0, 0, 0), Size = UDim2.new(0, 40, 0, 17), Text = "1000", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left })
c(493, "TextLabel", 490, { Name = "Title", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.53691273927689, 0, 0, 0), Size = UDim2.new(0, 42, 0, 17), Text = "Ping:", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14 })
c(494, "TextLabel", 490, { Name = "PingIndicatorText", BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1, BorderColor3 = Color3.fromRGB(255, 255, 255), BorderSizePixel = 0, FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal), Position = UDim2.new(0.80536913871765, 0, 0, 0), Size = UDim2.new(0, 29, 0, 17), Text = "999+", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left })
c(495, "UIListLayout", 490, { Name = "UIListLayout", FillDirection = Enum.FillDirection.Horizontal, Padding = UDim.new(0, -2), SortOrder = Enum.SortOrder.LayoutOrder })
	return objects
end

-- Create Window
function SugengLib:CreateWindow(config)
	config = config or {}
	local winTitle = config.Title or "Sugeng Hub"
	local keySystem = (config.KeySystem == true)
	local expectedKey = config.Key or "sugeng2026"
	local toggleKey = resolveSavedKey("HideUI_Key", config.ToggleKey or Enum.KeyCode.RightControl)
	local keyValidator = config.KeyValidator
	local defaultTab = config.DefaultTab or "About"
	local keybindPath = config.KeybindFile or "Sugeng_Keybinds.json"

	-- Keybind storage
	local savedKeybinds = {}

	local function loadSavedKeybinds()
		if isExecutor and typeof(readfile) == "function" and typeof(isfile) == "function" then
			if isfile(keybindPath) then
				local ok, data = pcall(function()
					return HttpService:JSONDecode(readfile(keybindPath))
				end)
				if ok and typeof(data) == "table" then
					savedKeybinds = data
					return data
				end
			end
		else
			savedKeybinds = studioKeybindStore[keybindPath] or {}
			return savedKeybinds
		end
		return {}
	end

	local function saveKeybindToFile(flagKey, keyName)
		if not flagKey or flagKey == "" then return end
		if savedKeybinds[flagKey] == keyName then return end
		savedKeybinds[flagKey] = keyName
		local ok, jsonStr = pcall(function()
			return HttpService:JSONEncode(savedKeybinds)
		end)
		if ok and jsonStr then
			if isExecutor and typeof(writefile) == "function" then
				pcall(function()
					writefile(keybindPath, jsonStr)
				end)
			else
				studioKeybindStore[keybindPath] = savedKeybinds
			end
		end
	end

	local function resolveSavedKey(flagKey, defaultKey)
		local saved = savedKeybinds[flagKey]
		if saved ~= nil then
			if saved == "" then
				return nil
			else
				local ok, code = pcall(function() return Enum.KeyCode[saved] end)
				if ok and code then return code end
			end
		end
		return defaultKey
	end

	loadSavedKeybinds()


	-- Single instance
	local sharedEnv = (typeof(getgenv) == "function" and getgenv()) or _G
	if sharedEnv and sharedEnv.SugengActiveWindow and typeof(sharedEnv.SugengActiveWindow.Destroy) == "function" then
		pcall(function() sharedEnv.SugengActiveWindow:Destroy() end)
		sharedEnv.SugengActiveWindow = nil
	end

	local objects = buildUI()
	local gui = objects[1]
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false

	local sideBg = objects[2]
	local sugengBtn = objects[64]
	local sugengBtnIcon = objects[66]
	local sugengBtnCanvas = objects[67]
	local sugengBtnStroke = objects[71]
	local micFrame = objects[73]
	local loaderFrame = objects[86]
	local mainTemplate = objects[91]
	local aboutFrame = objects[184]
	local otherTemplate = objects[196]
	local settingTemplate = objects[222]

	-- Visual template
	local visualTemplate = mainTemplate:Clone()
	visualTemplate.Name = "VisualMenuTemplate"
	visualTemplate.Visible = false
	visualTemplate.Parent = loaderFrame

	local visualScroll = visualTemplate:FindFirstChild("ScrollingFrame")
	if visualScroll then
		for _, child in ipairs(visualScroll:GetChildren()) do
			if child:IsA("CanvasGroup") or child:IsA("Frame") then
				child:Destroy()
			end
		end
	end

	local visualHeader = visualTemplate:FindFirstChild("HeaderFrame")
	local visualTitle = visualHeader and visualHeader:FindFirstChild("Title")
	local visualIcon = visualHeader and visualHeader:FindFirstChild("MenuIcon")
	local visualSearch = visualHeader and visualHeader:FindFirstChild("Searchbox")

	if visualTitle then
		visualTitle.Text = "Visuals"
	end
	if visualIcon then
		visualIcon.Image = objects[38].Image
	end

	if visualSearch and visualScroll then
		visualSearch:GetPropertyChangedSignal("Text"):Connect(function()
			local query = visualSearch.Text:lower():gsub("^%s*(.-)%s*$", "%1")
			for _, item in ipairs(visualScroll:GetChildren()) do
				if item:IsA("CanvasGroup") or item:IsA("Frame") then
					local t = item:FindFirstChild("Title")
					if t and t:IsA("TextLabel") then
						local match = query == "" or t.Text:lower():find(query, 1, true) ~= nil
						item.Visible = match
					end
				end
			end
		end)
	end
	local notifBg = objects[351]
	local notifTemplate = objects[353]
	local cardDropFrame = objects[359]
	local dropDownFrame = objects[385]
	local dropArrow = objects[384]
	local selectedNameLabel = objects[381]
	local confirmClose = objects[428]
	local introBg = objects[452]
	local loginPage = objects[472]
	local perfBg = objects[490]

	-- Hide all
	sugengBtn.Visible = false
	sideBg.Visible = false
	loaderFrame.Visible = false
	loginPage.Visible = false
	micFrame.Visible = false
	cardDropFrame.Visible = false
	dropDownFrame.Visible = false
	confirmClose.Visible = false
	perfBg.Visible = false
	introBg.Visible = false

	-- Default select
	selectedNameLabel.Text = "Select"
	if dropArrow then
		dropArrow.Rotation = 0
	end

	-- Protect GUI
	local parentTarget = config.Parent
	if not parentTarget then
		local pcallOk, cg = pcall(function() return CoreGui end)
		if pcallOk and cg then
			if syn and syn.protect_gui then
				syn.protect_gui(gui)
				parentTarget = cg
			elseif gethui then
				parentTarget = gethui()
			else
				parentTarget = cg
			end
		else
			parentTarget = PlayerGui
		end
	end
	gui.Parent = parentTarget

	if sharedEnv then
		sharedEnv.SugengActiveWindow = gui
	end

	-- Responsive layout
	local function checkIsMobile()
		local vp = camera and camera.ViewportSize or Vector2.new(1280, 720)
		return UserInputService.TouchEnabled or vp.Y < 550 or vp.X < 700
	end

	sugengBtn.AnchorPoint = Vector2.new(0.5, 0)
	sideBg.AnchorPoint = Vector2.new(0.5, 0)
	loaderFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	loginPage.AnchorPoint = Vector2.new(0.5, 0.5)
	confirmClose.AnchorPoint = Vector2.new(0.5, 0.5)

	-- Frame layers
	sugengBtn.ZIndex = 50
	sugengBtnIcon.ZIndex = 51
	sugengBtnCanvas.ZIndex = 50
	sideBg.ZIndex = 40
	loaderFrame.ZIndex = 20
	cardDropFrame.ZIndex = 30

	sugengBtnCanvas.Size = UDim2.new(1, 0, 1, 0)
	sugengBtnIcon.Size = UDim2.new(0.8, 0, 0.8, 0)
	sugengBtnIcon.Position = UDim2.new(0.1, 0, 0.1, 0)

	-- Right docks
	micFrame.AnchorPoint = Vector2.new(0, 0.5)
	cardDropFrame.AnchorPoint = Vector2.new(0, 0.5)

	-- Adaptive positions
	local function updateResponsiveLayout()
		local isMobile = checkIsMobile()
		if isMobile then
			sugengBtn.Size = UDim2.new(0, 42, 0, 42)
			sugengBtn.Position = UDim2.new(0.5, 0, 0, 8)
			sideBg.Size = UDim2.new(0, 304, 0, 44)
			sideBg.Position = UDim2.new(0.5, 0, 0, 56)
			loaderFrame.Position = UDim2.new(0.5, 0, 0.63, 0)
			micFrame.Position = UDim2.new(0.5, 140, 0.42, 0)
			cardDropFrame.Position = UDim2.new(0.5, 140, 0.62, 0)
			if objects[3] then
				objects[3].Padding = UDim.new(0, 6)
			end
		else
			sugengBtn.Size = UDim2.new(0, 50, 0, 50)
			sugengBtn.Position = UDim2.new(0.5, 0, 0, 14)
			sideBg.Size = UDim2.new(0, 364, 0, 47)
			sideBg.Position = UDim2.new(0.5, 0, 0, 72)
			loaderFrame.Position = UDim2.new(0.5, 0, 0.58, 0)
			micFrame.Position = UDim2.new(0.5, 235, 0.42, 0)
			cardDropFrame.Position = UDim2.new(0.5, 235, 0.62, 0)
			if objects[3] then
				objects[3].Padding = UDim.new(0, 8)
			end
		end
		if updateSideMenuVisuals then
			updateSideMenuVisuals()
		end
	end

	updateResponsiveLayout()
	if camera then
		camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateResponsiveLayout)
	end

	-- Bottom corner
	perfBg.AnchorPoint = Vector2.new(0, 1)
	perfBg.Position = UDim2.new(0, 0, 1, 0)
	perfBg.Visible = false

	notifBg.AnchorPoint = Vector2.new(1, 0)
	notifBg.Position = UDim2.new(1, -15, 0, 15)

	-- Fullscreen intro
	introBg.Size = UDim2.new(1, 0, 1, 0)
	introBg.Position = UDim2.new(0, 0, 0, 0)
	introBg.ZIndex = 100

	-- Center intro
	local introIcon = objects[453]
	introIcon.AnchorPoint = Vector2.new(0.5, 0.5)
	introIcon.Position = UDim2.new(0.5, 0, 0.38, 0)
	introIcon.Size = UDim2.new(0, 270, 0, 250)
	introIcon.ScaleType = Enum.ScaleType.Fit
	introIcon.ZIndex = 105

	local letters = {
		objects[454],
		objects[457],
		objects[460],
		objects[463],
		objects[466],
		objects[469]
	}

	local letterOffsets = {-135, -81, -27, 27, 81, 135}
	for i, l in ipairs(letters) do
		l.AnchorPoint = Vector2.new(0.5, 0.5)
		l.Size = UDim2.new(0, 54, 0, 54)
		l.Position = UDim2.new(0.5, letterOffsets[i], 1.3, 0)
		l.ZIndex = 106
		l.TextTransparency = 1
	end

	-- Apply title
	if winTitle and objects[177] then
		objects[177].Text = winTitle
	end

	-- Header icon
	if objects[198] and objects[48] then
		objects[198].Image = objects[48].Image
	end

	-- Avatar frame
	if objects[191] then
		objects[191].BackgroundTransparency = 0
		objects[191].BackgroundColor3 = Color3.fromRGB(90, 90, 90)
		local avCorner = objects[191]:FindFirstChildOfClass("UICorner")
		if not avCorner then
			avCorner = Instance.new("UICorner")
			avCorner.CornerRadius = UDim.new(1, 0)
			avCorner.Parent = objects[191]
		end
		local avStroke = objects[191]:FindFirstChild("AvatarStroke")
		if not avStroke then
			avStroke = Instance.new("UIStroke")
			avStroke.Name = "AvatarStroke"
			avStroke.Parent = objects[191]
		end
		avStroke.Color = Color3.fromRGB(255, 255, 255)
		avStroke.Thickness = 1.5
		avStroke.Transparency = 0
		avStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	end

	-- Auto player
	if LocalPlayer then
		if objects[193] then
			objects[193].Text = LocalPlayer.DisplayName or LocalPlayer.Name
		end
		if objects[194] then
			local ageDays = LocalPlayer.AccountAge or 0
			local createTime = os.time() - (ageDays * 86400)
			local d = os.date("!*t", createTime)
			objects[194].Text = string.format("Age : %02d/%02d/%04d (%dd)", d.day, d.month, d.year, ageDays)
		end
		if objects[191] then
			pcall(function()
				local thumb = Players:GetUserThumbnailAsync(
					LocalPlayer.UserId,
					Enum.ThumbnailType.HeadShot,
					Enum.ThumbnailSize.Size100x100
				)
				if thumb then
					objects[191].Image = thumb
				end
			end)
		end
	end

	-- Description override
	if config.About and typeof(config.About) == "table" then
		if config.About.Description and objects[189] then
			objects[189].Text = config.About.Description
		end
	end

	-- Prefabs
	local t1Prefab = objects[93]:Clone()
	local t2Prefab = objects[114]:Clone()
	local t3Prefab = objects[140]:Clone()
	local t4Prefab = objects[162]:Clone()
	local notifPrefab = notifTemplate:Clone()
	local dropOptionPrefab = objects[397]:Clone()

	notifTemplate.Visible = false
	notifBg.Visible = true

	-- Clear samples
	objects[93]:Destroy()
	objects[114]:Destroy()
	objects[140]:Destroy()
	objects[162]:Destroy()
	objects[209]:Destroy()
	objects[229]:Destroy()
	objects[248]:Destroy()
	objects[289]:Destroy()
	objects[302]:Destroy()
	objects[324]:Destroy()
	objects[397]:Destroy()
	objects[406]:Destroy()

	-- Window instance
	local win = {
		Gui = gui,
		Objects = objects,
		VisualTemplate = visualTemplate,
		VisualScroll = visualScroll,
		CardDropFrame = cardDropFrame,
		Tabs = {},
		CurrentTab = nil,
		Flags = {},
		Setters = {},
		Prefabs = {
			T1 = t1Prefab,
			T2 = t2Prefab,
			T3 = t3Prefab,
			T4 = t4Prefab,
			DropOption = dropOptionPrefab,
		},
		IsLoaded = false,
		IsMinimized = false,
		IsFullyHidden = false
	}

	-- Header searches
	local function hookSearch(sBox, container)
		if not sBox or not container then
			return
		end
		local function doFilter()
			local q = sBox.Text:lower():gsub("^%s*(.-)%s*$", "%1")
			for _, item in ipairs(container:GetChildren()) do
				if item:IsA("CanvasGroup") or item:IsA("Frame") then
					local t = item:FindFirstChild("Title")
					if t and t:IsA("TextLabel") then
						local match = (q == "") or (t.Text:lower():find(q, 1, true) ~= nil)
						item.Visible = match
					end
				end
			end
		end
		sBox:GetPropertyChangedSignal("Text"):Connect(doFilter)
		sBox.FocusLost:Connect(doFilter)
	end
	hookSearch(objects[178], objects[92])
	hookSearch(objects[199], objects[206])

	-- Notification queue
	local activeNotifs = {}
	function win:Notify(nConfig)
		nConfig = nConfig or {}
		local text = nConfig.Content or nConfig.Desc or nConfig.Text or "Notification"
		local dur = nConfig.Duration or 1

		if #activeNotifs >= 3 then
			local oldest = table.remove(activeNotifs, 1)
			if oldest and oldest.Parent then
				oldest:Destroy()
			end
		end

		local card = notifPrefab:Clone()
		local descLabel = card:FindFirstChild("NotifDesc")
		if descLabel then
			descLabel.Text = text
		end
		card.Visible = true
		card.Position = UDim2.new(1, 150, 0, 0)
		card.Parent = notifBg
		table.insert(activeNotifs, card)

		-- Slide in
		tween(card, 0.35, { Position = UDim2.new(0, 0, 0, 0) }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

		task.delay(dur, function()
			if card and card.Parent then
				local outTween = tween(card, 0.35, { Position = UDim2.new(1, 150, 0, 0) })
				outTween.Completed:Connect(function()
					for idx, cItem in ipairs(activeNotifs) do
						if cItem == card then
							table.remove(activeNotifs, idx)
							break
						end
				end
					card:Destroy()
				end)
			end
		end)
	end

	-- Shine loop
	task.spawn(function()
		local shine = objects[69]
		while gui and gui.Parent do
			shine.Position = UDim2.new(-0.8, 0, -0.115, 0)
			tween(shine, 1.2, { Position = UDim2.new(1.4, 0, -0.115, 0) }, Enum.EasingStyle.Linear)
			task.wait(3.5)
		end
	end)

	-- Performance monitoring
	local fpsLabel = objects[492]
	local pingLabel = objects[494]
	local frameCount = 0
	local lastTime = tick()

	RunService.RenderStepped:Connect(function()
		if not perfBg.Visible then
			return
		end
		frameCount = frameCount + 1
		local now = tick()
		if now - lastTime >= 0.5 then
			local fps = math.round(frameCount / (now - lastTime))
			if fpsLabel then
				fpsLabel.Text = tostring(fps)
			end
			frameCount = 0
			lastTime = now

			if pingLabel then
				local pingVal = 0
				pcall(function()
					local pingItem = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
					pingVal = math.round(pingItem:GetValue())
				end)
				pingLabel.Text = tostring(pingVal) .. "ms"
			end
		end
	end)

	-- Side buttons
	local sideBtns = {
		{ Btn = objects[4], Tip = objects[9], Label = objects[13], Text = "About", Frame = aboutFrame, Icon = objects[8] },
		{ Btn = objects[14], Tip = objects[19], Label = objects[23], Text = "VCB", Action = "mic", Frame = micFrame, Icon = objects[18] },
		{ Btn = objects[24], Tip = objects[29], Label = objects[33], Text = "Player", Frame = mainTemplate, Icon = objects[28] },
		{ Btn = objects[34], Tip = objects[39], Label = objects[43], Text = "Visuals", Frame = visualTemplate, Icon = objects[38] },
		{ Btn = objects[44], Tip = objects[49], Label = objects[53], Text = "Other", Frame = otherTemplate, Icon = objects[48] },
		{ Btn = objects[54], Tip = objects[59], Label = objects[63], Text = "Settings", Frame = settingTemplate, Icon = objects[58] }
	}

	-- Tooltip texts
	for _, item in ipairs(sideBtns) do
		if item.Label then
			item.Label.Text = item.Text
		end
	end

	-- Active indicator
	local function updateSideMenuVisuals()
		local isMobile = checkIsMobile()
		local baseBtnSize = isMobile and 42 or 50
		local activeBtnSize = isMobile and 34 or 40
		local baseIconSize = isMobile and 32 or 40
		local activeIconSize = isMobile and 24 or 30
		local baseIconPos = isMobile and UDim2.new(0.12, 0, 0.12, 0) or UDim2.new(0.1, 0, 0.1, 0)
		local activeIconPos = isMobile and UDim2.new(0.15, 0, 0.15, 0) or UDim2.new(0.12, 0, 0.12, 0)

		for _, item in ipairs(sideBtns) do
			local isActive = false
			if item.Action == "mic" then
				isActive = micFrame.Visible
			else
				isActive = (loaderFrame.Visible and item.Frame and item.Frame.Visible)
			end

			local targetBtnSize = isActive and UDim2.new(0, activeBtnSize, 0, activeBtnSize) or UDim2.new(0, baseBtnSize, 0, baseBtnSize)
			local targetIconSize = isActive and UDim2.new(0, activeIconSize, 0, activeIconSize) or UDim2.new(0, baseIconSize, 0, baseIconSize)
			local targetIconPos = isActive and activeIconPos or baseIconPos

			tween(item.Btn, 0.2, { Size = targetBtnSize }, Enum.EasingStyle.Quad)
			if item.Icon then
				tween(item.Icon, 0.2, { Size = targetIconSize, Position = targetIconPos }, Enum.EasingStyle.Quad)
			end
		end
	end

	-- Active frame
	local function setActiveMenu(targetFrame)
		aboutFrame.Visible = false
		mainTemplate.Visible = false
		visualTemplate.Visible = false
		otherTemplate.Visible = false
		settingTemplate.Visible = false

		if targetFrame then
			loaderFrame.Visible = true
			targetFrame.Visible = true
		end
		updateSideMenuVisuals()
	end

	-- Dropdown state
	local function setDropdownOpen(open)
		dropDownFrame.Visible = open
		if dropArrow then
			tween(dropArrow, 0.25, { Rotation = open and 180 or 0 }, Enum.EasingStyle.Quad)
		end
	end

	-- Synchronized hover
	for _, item in ipairs(sideBtns) do
		local btn = item.Btn
		local icon = item.Icon
		local tip = item.Tip

		btn.MouseEnter:Connect(function()
			local isActive = false
			if item.Action == "mic" then
				isActive = micFrame.Visible
			else
				isActive = (loaderFrame.Visible and item.Frame and item.Frame.Visible)
			end

			if not isActive then
				local isMobile = checkIsMobile()
				local hoverBtn = isMobile and 38 or 44
				local hoverIcon = isMobile and 28 or 34
				local hoverPos = isMobile and UDim2.new(0.12, 0, 0.12, 0) or UDim2.new(0.11, 0, 0.11, 0)
				tween(btn, 0.15, { Size = UDim2.new(0, hoverBtn, 0, hoverBtn) }, Enum.EasingStyle.Quad)
				if icon then
					tween(icon, 0.15, { Size = UDim2.new(0, hoverIcon, 0, hoverIcon), Position = hoverPos }, Enum.EasingStyle.Quad)
				end
			end
			if tip then
				tip.Visible = true
				tip.BackgroundTransparency = 1
				tween(tip, 0.15, { BackgroundTransparency = 0 })
			end
		end)

		btn.MouseLeave:Connect(function()
			updateSideMenuVisuals()
			if tip then
				local t = tween(tip, 0.15, { BackgroundTransparency = 1 })
				t.Completed:Connect(function()
					if not btn:IsDescendantOf(gui) then
						return
					end
					tip.Visible = false
				end)
			end
		end)

		btn.MouseButton1Click:Connect(function()
			if not win.IsLoaded then
				return
			end
			if item.Action == "mic" then
				micFrame.Visible = not micFrame.Visible
				updateSideMenuVisuals()
			else
				if loaderFrame.Visible and item.Frame and item.Frame.Visible then
					loaderFrame.Visible = false
					item.Frame.Visible = false
				else
					setActiveMenu(item.Frame)
				end
				updateSideMenuVisuals()
			end
		end)
	end

	-- Mic toggle
	local micToggle = objects[79]
	local micIndicator = objects[82]
	local micGrad = micIndicator and micIndicator:FindFirstChildOfClass("UIGradient")
	local micActive = false

	local function updateMicVisual(state)
		if micIndicator then
			if state then
				tween(micIndicator, 0.2, { Position = UDim2.new(0.55, 0, 0.04, 2) })
				if micGrad then
					micGrad.Color = toggleOnColor
				end
			else
				tween(micIndicator, 0.2, { Position = UDim2.new(0.08, 0, 0.04, 2) })
				if micGrad then
					micGrad.Color = toggleOffColor
				end
			end
		end
	end
	updateMicVisual(false)

	micToggle.MouseButton1Click:Connect(function()
		micActive = not micActive
		updateMicVisual(micActive)
		win:Notify({ Content = "Anti VCB " .. (micActive and "On" or "Off"), Duration = 1 })
	end)

	-- CardDrop Close
	local function closeCardDropAction()
		cardDropFrame.Visible = false
		setDropdownOpen(false)
	end

	objects[366].MouseButton1Click:Connect(closeCardDropAction)
	if objects[366]:IsA("GuiButton") then
		objects[366].Activated:Connect(closeCardDropAction)
	end

	-- Dropdown toggle
	local dropToggle = objects[371]
	local dropIndicator = objects[374]
	local dropGrad = dropIndicator and dropIndicator:FindFirstChildOfClass("UIGradient")
	local dropActive = false

	local function updateDropToggleVisual(state)
		if dropIndicator then
			if state then
				tween(dropIndicator, 0.2, { Position = UDim2.new(0.55, 0, 0.111, 0) })
				if dropGrad then
					dropGrad.Color = toggleOnColor
				end
			else
				tween(dropIndicator, 0.2, { Position = UDim2.new(0.08, 0, 0.111, 0) })
				if dropGrad then
					dropGrad.Color = toggleOffColor
				end
			end
		end
	end
	updateDropToggleVisual(false)

	local cardDropToggleCallback = nil

	function win:SetCardDropToggleCallback(cb)
		cardDropToggleCallback = cb
	end

	dropToggle.MouseButton1Click:Connect(function()
		dropActive = not dropActive
		updateDropToggleVisual(dropActive)
		if cardDropToggleCallback then
			pcall(cardDropToggleCallback, dropActive)
		else
			win:Notify({ Content = "Toggle " .. (dropActive and "On" or "Off"), Duration = 1 })
		end
	end)

	function win:OpenCardDrop(cfg)
		cfg = cfg or {}
		if cfg.Title and objects[363] then
			objects[363].Text = cfg.Title
		end
		if cfg.Options then
			win:SetDropdownOptions(cfg.Options, cfg.Callback)
		end
		if cfg.ToggleCallback then
			cardDropToggleCallback = cfg.ToggleCallback
		end
		if cfg.Toggle ~= nil then
			dropActive = (cfg.Toggle == true)
			updateDropToggleVisual(dropActive)
		end
		if cfg.Default and selectedNameLabel then
			selectedNameLabel.Text = tostring(cfg.Default)
		end
		cardDropFrame.Visible = true
		return cardDropFrame
	end

	function win:CloseCardDrop()
		cardDropFrame.Visible = false
		setDropdownOpen(false)
	end

	function win:ToggleCardDrop(cfg)
		if cardDropFrame.Visible then
			win:CloseCardDrop()
		else
			win:OpenCardDrop(cfg)
		end
	end

	-- Dropdown hitbox
	local dropHitbox = objects[378]
	local dropSearch = objects[386]
	local dropScroll = objects[392]

	dropHitbox.MouseButton1Click:Connect(function()
		setDropdownOpen(not dropDownFrame.Visible)
	end)

	dropSearch:GetPropertyChangedSignal("Text"):Connect(function()
		local query = dropSearch.Text:lower()
		for _, child in ipairs(dropScroll:GetChildren()) do
			if child:IsA("ImageButton") then
				local nLabel = child:FindFirstChild("Name")
				if nLabel then
					local match = query == "" or nLabel.Text:lower():find(query, 1, true) ~= nil
					child.Visible = match
				end
			end
		end
	end)

	-- Draggable card
	local isDraggingCard = false
	local dragCardStart = nil
	local startCardPos = nil

	cardDropFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local mousePos = input.Position
			if dropDownFrame.Visible and mousePos.Y > dropDownFrame.AbsolutePosition.Y and mousePos.Y < dropDownFrame.AbsolutePosition.Y + dropDownFrame.AbsoluteSize.Y then
				return
			end
			isDraggingCard = true
			dragCardStart = input.Position
			startCardPos = cardDropFrame.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if isDraggingCard and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragCardStart
			cardDropFrame.Position = UDim2.new(
				startCardPos.X.Scale,
				startCardPos.X.Offset + delta.X,
				startCardPos.Y.Scale,
				startCardPos.Y.Offset + delta.Y
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			isDraggingCard = false
		end
	end)

	-- Draggable mic
	local isDraggingMic = false
	local dragMicStart = nil
	local startMicPos = nil

	micFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			isDraggingMic = true
			dragMicStart = input.Position
			startMicPos = micFrame.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if isDraggingMic and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			local delta = input.Position - dragMicStart
			micFrame.Position = UDim2.new(
				startMicPos.X.Scale,
				startMicPos.X.Offset + delta.X,
				startMicPos.Y.Scale,
				startMicPos.Y.Offset + delta.Y
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			isDraggingMic = false
		end
	end)

	-- Populate dropdown
	function win:SetDropdownOptions(options, callback)
		for _, child in ipairs(dropScroll:GetChildren()) do
			if child:IsA("ImageButton") then
				child:Destroy()
			end
		end
		for _, opt in ipairs(options) do
			local btn = dropOptionPrefab:Clone()
			local nameLabel = btn:FindFirstChild("Name")
			if nameLabel then
				nameLabel.Text = tostring(opt)
			end
			btn.Visible = true
			btn.Parent = dropScroll
			btn.MouseButton1Click:Connect(function()
				selectedNameLabel.Text = tostring(opt)
				setDropdownOpen(false)
				if callback then
					callback(opt)
				end
				win:Notify({ Content = "Selected " .. tostring(opt), Duration = 1 })
			end)
		end
	end

	-- Default options
	win:SetDropdownOptions({"Option 1", "Option 2", "Option 3", "Option 4", "Option 5"}, function(opt)
		print("Selected", opt)
	end)

	-- Close confirmation
	local cancelCloseBtn = objects[433]
	local confirmCloseBtn = objects[440]

	cancelCloseBtn.MouseButton1Click:Connect(function()
		confirmClose.Visible = false
	end)

	confirmCloseBtn.MouseButton1Click:Connect(function()
		confirmClose.Visible = false
		gui:Destroy()
	end)

	function win:Close()
		confirmClose.Visible = true
	end

	-- Keybind helper
	local function bindKeybox(kbBox, initialKey, onBound, flagKey)
		local bound = initialKey
		if kbBox then
			kbBox.Visible = true
			kbBox.PlaceholderText = "bind"
			kbBox.Text = bound and bound.Name or ""
			local listening = false

			kbBox.Focused:Connect(function()
				listening = true
				kbBox.Text = "..."
			end)

			kbBox.FocusLost:Connect(function()
				listening = false
				task.delay(0.05, function()
					kbBox.Text = bound and bound.Name or ""
				end)
			end)

			UserInputService.InputBegan:Connect(function(inp, gpe)
				if listening and kbBox:IsFocused() then
					if inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode ~= Enum.KeyCode.Unknown then
						bound = inp.KeyCode
						listening = false
						kbBox.Text = bound.Name
						kbBox:ReleaseFocus()
						if onBound then
							onBound(bound)
						end
						if flagKey then
							saveKeybindToFile(flagKey, bound.Name)
						end
						win:Notify({ Content = "Bound to " .. bound.Name, Duration = 1 })
					end
				end
			end)
		end
		return {
			Get = function() return bound end,
			Set = function(key)
				if typeof(key) == "string" and key ~= "" then
					pcall(function()
						bound = Enum.KeyCode[key]
						if kbBox then
							kbBox.Text = bound.Name
						end
						if onBound then
							onBound(bound)
						end
						if flagKey then
							saveKeybindToFile(flagKey, bound.Name)
						end
					end)
				elseif typeof(key) == "EnumItem" then
					bound = key
					if kbBox then
						kbBox.Text = bound.Name
					end
					if onBound then
						onBound(bound)
					end
					if flagKey then
						saveKeybindToFile(flagKey, bound.Name)
					end
				else
					bound = nil
					if kbBox then
						kbBox.Text = ""
					end
					if onBound then
						onBound(nil)
					end
					if flagKey then
						saveKeybindToFile(flagKey, "")
					end
				end
			end
		}
	end

	-- Settings tab
	local settingScroll = objects[226]
	local perfToggleItem = t1Prefab:Clone()
	local perfTitle = perfToggleItem:FindFirstChild("Title")
	local perfBtn = perfToggleItem:FindFirstChild("Toggle")
	local perfInd = perfBtn and perfBtn:FindFirstChild("Indicator")
	local perfGrad = perfInd and perfInd:FindFirstChildOfClass("UIGradient")
	local perfKb = perfToggleItem:FindFirstChild("Keybind")
	local perfKey = resolveSavedKey("PerfMonitor_Key", nil)

	if perfTitle then
		perfTitle.Size = UDim2.new(0, 190, 0, 23)
		perfTitle.Text = "Performance Monitor"
		perfTitle.TextScaled = false
		perfTitle.TextSize = 13
	end

	win.Flags["PerfMonitor_Toggle"] = perfBg.Visible
	win.Flags["PerfMonitor_Key"] = ""

	local function updatePerfInd(state)
		if perfInd then
			if state then
				tween(perfInd, 0.2, { Position = UDim2.new(0.51, 2, 0.111, 0) })
				if perfGrad then
					perfGrad.Color = toggleOnColor
				end
			else
				tween(perfInd, 0.2, { Position = UDim2.new(0.08, 0, 0.111, 0) })
				if perfGrad then
					perfGrad.Color = toggleOffColor
				end
			end
		end
	end
	updatePerfInd(false)

	local function togglePerf()
		perfBg.Visible = not perfBg.Visible
		win.Flags["PerfMonitor_Toggle"] = perfBg.Visible
		updatePerfInd(perfBg.Visible)
		win:Notify({ Content = "Monitor " .. (perfBg.Visible and "On" or "Off"), Duration = 1 })
	end

	if perfBtn then
		perfBtn.MouseButton1Click:Connect(togglePerf)
	end

	local perfKeyHandler = bindKeybox(perfKb, perfKey, function(k)
		perfKey = k
		win.Flags["PerfMonitor_Key"] = k and k.Name or ""
	end, "PerfMonitor_Key")

	win.Setters["PerfMonitor_Key"] = function(keyVal)
		perfKeyHandler.Set(keyVal)
	end

	win.Setters["PerfMonitor_Toggle"] = function(state)
		perfBg.Visible = (state == true)
		win.Flags["PerfMonitor_Toggle"] = perfBg.Visible
		updatePerfInd(perfBg.Visible)
	end

	perfToggleItem.LayoutOrder = -10
	perfToggleItem.Visible = true
	perfToggleItem.Parent = settingScroll

	-- Hide toggle
	local hideToggleItem = t1Prefab:Clone()
	local hideTitle = hideToggleItem:FindFirstChild("Title")
	local hideBtn = hideToggleItem:FindFirstChild("Toggle")
	local hideInd = hideBtn and hideBtn:FindFirstChild("Indicator")
	local hideGrad = hideInd and hideInd:FindFirstChildOfClass("UIGradient")
	local hideKb = hideToggleItem:FindFirstChild("Keybind")

	if hideTitle then
		hideTitle.Size = UDim2.new(0, 190, 0, 23)
		hideTitle.Text = "Hide UI Keybind"
		hideTitle.TextScaled = false
		hideTitle.TextSize = 13
	end

	win.Flags["HideUI_Key"] = toggleKey and toggleKey.Name or ""

	local function updateHideInd(state)
		if hideInd then
			if state then
				tween(hideInd, 0.2, { Position = UDim2.new(0.51, 2, 0.111, 0) })
				if hideGrad then
					hideGrad.Color = toggleOnColor
				end
			else
				tween(hideInd, 0.2, { Position = UDim2.new(0.08, 0, 0.111, 0) })
				if hideGrad then
					hideGrad.Color = toggleOffColor
				end
			end
		end
	end
	updateHideInd(false)

	local hideKeyHandler = bindKeybox(hideKb, toggleKey, function(k)
		toggleKey = k
		win.Flags["HideUI_Key"] = k and k.Name or ""
	end, "HideUI_Key")

	win.Setters["HideUI_Key"] = function(keyVal)
		hideKeyHandler.Set(keyVal)
	end

	hideToggleItem.LayoutOrder = -9
	hideToggleItem.Visible = true
	hideToggleItem.Parent = settingScroll

	-- Saved state
	local wasLoaderVisible = false
	local wasMicVisible = false

	-- Minimize logic
	local function setMinimized(val)
		if val then
			if not win.IsMinimized and not win.IsFullyHidden then
				wasLoaderVisible = loaderFrame.Visible
				wasMicVisible = micFrame.Visible
			end
			win.IsMinimized = true
			sideBg.Visible = false
			loaderFrame.Visible = false
			micFrame.Visible = false
		else
			win.IsMinimized = false
			sideBg.Visible = true
			loaderFrame.Visible = wasLoaderVisible
			micFrame.Visible = wasMicVisible
			updateSideMenuVisuals()
		end
	end

	-- Hide logic
	local function setFullyHidden(val)
		if val then
			if not win.IsMinimized and not win.IsFullyHidden then
				wasLoaderVisible = loaderFrame.Visible
				wasMicVisible = micFrame.Visible
			end
			win.IsFullyHidden = true
			win.IsMinimized = true
			sideBg.Visible = false
			loaderFrame.Visible = false
			micFrame.Visible = false
			tween(sugengBtn, 0.2, { BackgroundTransparency = 1, ImageTransparency = 1 })
			tween(sugengBtnIcon, 0.2, { ImageTransparency = 1 })
			tween(sugengBtnCanvas, 0.2, { GroupTransparency = 1 })
			sugengBtnStroke.Enabled = false
			task.delay(0.2, function()
				if win.IsFullyHidden then
					sugengBtnIcon.Visible = false
					sugengBtnCanvas.Visible = false
				end
			end)
			updateHideInd(true)
			win:Notify({ Content = "UI Hidden", Duration = 1 })
		else
			win.IsFullyHidden = false
			win.IsMinimized = false
			sugengBtnIcon.Visible = true
			sugengBtnCanvas.Visible = true
			tween(sugengBtn, 0.2, { BackgroundTransparency = 0, ImageTransparency = 0 })
			tween(sugengBtnIcon, 0.2, { ImageTransparency = 0 })
			tween(sugengBtnCanvas, 0.2, { GroupTransparency = 0 })
			sugengBtnStroke.Enabled = true
			sideBg.Visible = true
			loaderFrame.Visible = wasLoaderVisible
			micFrame.Visible = wasMicVisible
			updateSideMenuVisuals()
			updateHideInd(false)
			win:Notify({ Content = "UI Restored", Duration = 1 })
		end
	end

	local function toggleHideAction()
		setFullyHidden(not win.IsFullyHidden)
	end

	if hideBtn then
		hideBtn.MouseButton1Click:Connect(toggleHideAction)
	end

	-- SugengBtn input
	local holdStart = 0
	local isHolding = false
	local touchStartPos = nil

	sugengBtn.InputBegan:Connect(function(input)
		if not win.IsLoaded then
			return
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			holdStart = tick()
			isHolding = true
			touchStartPos = input.Position
			task.delay(0.65, function()
				if isHolding and (tick() - holdStart >= 0.6) then
					setFullyHidden(not win.IsFullyHidden)
				end
			end)
		end
	end)

	sugengBtn.InputEnded:Connect(function(input)
		if not win.IsLoaded then
			return
		end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			local pressDur = tick() - holdStart
			local wasHold = isHolding and (pressDur >= 0.6)
			isHolding = false

			local moved = touchStartPos and ((input.Position - touchStartPos).Magnitude > 25)
			if moved then
				return
			end

			if not wasHold and pressDur < 0.6 then
				if win.IsFullyHidden then
					setFullyHidden(false)
				else
					local isMainVisible = sideBg.Visible or loaderFrame.Visible or micFrame.Visible
					setMinimized(isMainVisible)
				end
			end
		end
	end)

	-- Hotkey inputs
	UserInputService.InputBegan:Connect(function(i, gpe)
		if not gpe and perfKey and i.KeyCode == perfKey then
			togglePerf()
			return
		end
		if not gpe and toggleKey and i.KeyCode == toggleKey then
			if not win.IsLoaded then
				return
			end
			toggleHideAction()
			return
		end
	end)

	-- Sequential entrance
	local function playMainEntrance()
		win.IsLoaded = true
		loaderFrame.Visible = false
		sideBg.Visible = true

		-- Hide buttons
		for _, item in ipairs(sideBtns) do
			item.Btn.Visible = false
			item.Btn.Size = UDim2.new(0, 0, 0, 0)
			if item.Icon then
				item.Icon.Size = UDim2.new(0, 0, 0, 0)
			end
		end

		-- Sugengbutton first
		local isMobile = checkIsMobile()
		local sSize = isMobile and 42 or 50
		sugengBtn.Visible = true
		sugengBtn.Size = UDim2.new(0, 0, 0, 0)
		sugengBtn.BackgroundTransparency = 0
		sugengBtn.ImageTransparency = 0
		sugengBtnIcon.ImageTransparency = 0
		sugengBtnCanvas.GroupTransparency = 0
		sugengBtnStroke.Enabled = true
		tween(sugengBtn, 0.45, { Size = UDim2.new(0, sSize, 0, sSize) }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

		task.spawn(function()
			-- Wait buttons
			task.wait(0.35)

			-- Cascade buttons
			local bSize = isMobile and 42 or 50
			local icSize = isMobile and 32 or 40
			local icPos = isMobile and UDim2.new(0.12, 0, 0.12, 0) or UDim2.new(0.1, 0, 0.1, 0)
			for _, item in ipairs(sideBtns) do
				local b = item.Btn
				local ic = item.Icon
				b.Visible = true
				b.Size = UDim2.new(0, 0, 0, 0)
				tween(b, 0.35, { Size = UDim2.new(0, bSize, 0, bSize) }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				if ic then
					ic.Size = UDim2.new(0, 0, 0, 0)
					tween(ic, 0.35, { Size = UDim2.new(0, icSize, 0, icSize), Position = icPos }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				end
				task.wait(0.09)
			end

			-- Wait main
			task.wait(0.15)

			local initialFrame = aboutFrame
			if defaultTab == "Player" then
				initialFrame = mainTemplate
			elseif defaultTab == "Visuals" or defaultTab == "Visual" or defaultTab == "Eye" then
				initialFrame = visualTemplate
			elseif defaultTab == "Other" then
				initialFrame = otherTemplate
			elseif defaultTab == "Settings" then
				initialFrame = settingTemplate
			end
			setActiveMenu(initialFrame)
			wasLoaderVisible = true

			-- Main entrance
			loaderFrame.Position = UDim2.new(0.5, 0, 0.62, 0)
			loaderFrame.Visible = true
			tween(loaderFrame, 0.4, { Position = UDim2.new(0.5, 0, 0.58, 0) }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)

			updateSideMenuVisuals()
			win:Notify({ Content = "Sugeng Loaded", Duration = 1 })
		end)
	end

	-- Login verification
	local function setupLogin()
		sugengBtn.Visible = false
		sideBg.Visible = false
		loaderFrame.Visible = false

		if not keySystem then
			loginPage.Visible = false
			playMainEntrance()
			return
		end

		loginPage.Position = UDim2.new(0.5, 0, 0.5, 0)
		loginPage.Visible = true
		local keyInput = objects[480]
		local loginBtn = objects[483]

		local function attemptLogin()
			local entered = keyInput.Text
			local isValid = false
			if keyValidator then
				isValid = keyValidator(entered)
			else
				isValid = (entered == expectedKey)
			end

			if isValid then
				win:Notify({ Content = "Key Valid", Duration = 1 })
				tween(loginPage, 0.3, { Position = UDim2.new(0.5, 0, 0.45, 0) })
				task.wait(0.3)
				loginPage.Visible = false
				playMainEntrance()
			else
				win:Notify({ Content = "Invalid Key", Duration = 1 })
				local origPos = loginPage.Position
				tween(loginPage, 0.05, { Position = origPos + UDim2.new(0, 10, 0, 0) })
				task.wait(0.05)
				tween(loginPage, 0.05, { Position = origPos - UDim2.new(0, 10, 0, 0) })
				task.wait(0.05)
				tween(loginPage, 0.05, { Position = origPos })
			end
		end

		loginBtn.MouseButton1Click:Connect(attemptLogin)
		keyInput.FocusLost:Connect(function(enterPressed)
			if enterPressed then
				attemptLogin()
			end
		end)
	end

	-- Intro animation
	local function playIntro()
		if config.SkipIntro then
			introBg.Visible = false
			setupLogin()
			return
		end

		-- Preload icon
		pcall(function()
			ContentProvider:PreloadAsync({ introIcon, objects[66] })
		end)

		sugengBtn.Visible = false
		sideBg.Visible = false
		loaderFrame.Visible = false
		loginPage.Visible = false

		introBg.Visible = true
		introBg.BackgroundTransparency = 0.5

		-- Letters hide
		for _, l in ipairs(letters) do
			l.Position = UDim2.new(l.Position.X.Scale, l.Position.X.Offset, 1.3, 0)
			l.TextTransparency = 1
		end

		-- Icon first
		introIcon.ImageTransparency = 1
		introIcon.Visible = true
		tween(introIcon, 0.5, { ImageTransparency = 0 })
		task.wait(0.4)

		-- Letters cascade
		for _, l in ipairs(letters) do
			tween(l, 0.45, { Position = UDim2.new(l.Position.X.Scale, l.Position.X.Offset, 0.65, 0), TextTransparency = 0 }, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
			task.wait(0.1)
		end

		task.wait(1.0)

		-- Letters descend
		for _, l in ipairs(letters) do
			tween(l, 0.35, { Position = UDim2.new(l.Position.X.Scale, l.Position.X.Offset, 1.3, 0), TextTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
			task.wait(0.1)
		end
		task.wait(0.15)

		-- Icon exit
		tween(introIcon, 0.4, { ImageTransparency = 1 })
		tween(introBg, 0.45, { BackgroundTransparency = 1 })
		task.wait(0.5)
		introIcon.Visible = false
		introBg.Visible = false
		setupLogin()
	end

	task.spawn(playIntro)

	local tabCount = 0

	-- Tab factory
	function win:CreateTab(tConfig)
		if typeof(tConfig) == "string" then
			tConfig = { Name = tConfig }
		end
		tConfig = tConfig or {}
		local tabName = tConfig.Name or "Tab"
		local targetContainer = tConfig.Container
		tabCount = tabCount + 1

		if not targetContainer then
			local lower = tabName:lower()
			if lower:find("other") then
				targetContainer = objects[206]
			elseif lower:find("setting") then
				targetContainer = objects[226]
			elseif lower:find("visual") or lower:find("eye") or lower:find("esp") or lower:find("target") then
				targetContainer = visualScroll
				if visualTitle then
					visualTitle.Text = tabName
				end
			elseif tabCount == 2 and not lower:find("player") and not lower:find("main") then
				targetContainer = visualScroll
				if visualTitle then
					visualTitle.Text = tabName
				end
			else
				targetContainer = objects[92]
			end
		end

		local tab = {
			Name = tabName,
			Container = targetContainer
		}

		-- Toggle widget
		function tab:AddToggle(opt)
			opt = opt or {}
			local name = opt.Name or "Toggle"
			local state = opt.Default or false
			local callback = opt.Callback or function() end
			local flag = opt.Flag or name
			local boundKey = resolveSavedKey(flag .. "_Key", opt.Keybind)

			win.Flags[flag] = state
			win.Flags[flag .. "_Key"] = boundKey and boundKey.Name or ""

			local item = t1Prefab:Clone()
			local title = item:FindFirstChild("Title")
			local tBtn = item:FindFirstChild("Toggle")
			local ind = tBtn and tBtn:FindFirstChild("Indicator")
			local grad = ind and ind:FindFirstChildOfClass("UIGradient")
			local kbBox = item:FindFirstChild("Keybind")

			if title then
				title.Text = name
			end

			local function updateVisual()
				if ind then
					if state then
						tween(ind, 0.2, { Position = UDim2.new(0.51, 2, 0.111, 0) })
						if grad then
							grad.Color = toggleOnColor
						end
					else
						tween(ind, 0.2, { Position = UDim2.new(0.08, 0, 0.111, 0) })
						if grad then
							grad.Color = toggleOffColor
						end
					end
				end
			end
			updateVisual()

			win.Setters[flag] = function(newVal)
				state = (newVal == true)
				win.Flags[flag] = state
				updateVisual()
				pcall(callback, state)
			end

			local function fire()
				state = not state
				win.Flags[flag] = state
				updateVisual()
				pcall(callback, state)
				win:Notify({ Content = name .. (state and " On" or " Off"), Duration = 1 })
			end

			if tBtn then
				tBtn.MouseButton1Click:Connect(fire)
			end

			local keyHandler = bindKeybox(kbBox, boundKey, function(k)
				boundKey = k
				win.Flags[flag .. "_Key"] = k and k.Name or ""
			end, flag .. "_Key")

			win.Setters[flag .. "_Key"] = function(keyVal)
				keyHandler.Set(keyVal)
			end

			UserInputService.InputBegan:Connect(function(i, gpe)
				if not gpe and boundKey and i.KeyCode == boundKey then
					fire()
				end
			end)

			item.Visible = true
			item.Parent = targetContainer
			return item
		end

		-- Slider widget
		function tab:AddSlider(opt)
			opt = opt or {}
			local name = opt.Name or "Slider"
			local min = opt.Min or 0
			local max = opt.Max or 100
			local current = opt.Default or min
			local state = (opt.ToggleDefault == true)
			local callback = opt.Callback or function() end
			local toggleCallback = opt.ToggleCallback
			local flag = opt.Flag or name

			win.Flags[flag] = current
			win.Flags[flag .. "_Toggle"] = state

			local item = t2Prefab:Clone()
			local title = item:FindFirstChild("Title")
			local sliderHolder = item:FindFirstChild("SliderHolder")
			local barBg = sliderHolder and sliderHolder:FindFirstChild("BarBg")
			local bar = barBg and barBg:FindFirstChild("Bar")
			local indText = sliderHolder and sliderHolder:FindFirstChild("IndicatorText")
			local tBtn = item:FindFirstChild("Toggle")
			local ind = tBtn and tBtn:FindFirstChild("Indicator")
			local grad = ind and ind:FindFirstChildOfClass("UIGradient")

			if title then
				title.Text = name
			end

			local function updateToggleVisual()
				if ind then
					if state then
						tween(ind, 0.2, { Position = UDim2.new(0.51, 2, 0.111, 0) })
						if grad then
							grad.Color = toggleOnColor
						end
					else
						tween(ind, 0.2, { Position = UDim2.new(0.08, 0, 0.111, 0) })
						if grad then
							grad.Color = toggleOffColor
						end
					end
				end
			end
			updateToggleVisual()

			local function setVal(v)
				v = math.clamp(math.round(v), min, max)
				current = v
				win.Flags[flag] = current
				if indText then
					indText.Text = tostring(v)
				end
				if bar and barBg then
					local pct = (v - min) / (max - min)
					bar.Size = UDim2.new(pct, 0, 1, 0)
				end
				pcall(callback, v, state)
			end
			setVal(current)

			win.Setters[flag] = function(newVal)
				local num = tonumber(newVal)
				if num then
					setVal(num)
				end
			end

			win.Setters[flag .. "_Toggle"] = function(newState)
				state = (newState == true)
				win.Flags[flag .. "_Toggle"] = state
				updateToggleVisual()
				if toggleCallback then
					pcall(toggleCallback, state, current)
				else
					pcall(callback, current, state)
				end
			end

			local function fireToggle()
				state = not state
				win.Flags[flag .. "_Toggle"] = state
				updateToggleVisual()
				if toggleCallback then
					pcall(toggleCallback, state, current)
				else
					pcall(callback, current, state)
				end
				win:Notify({ Content = name .. (state and " On" or " Off"), Duration = 1 })
			end

			if tBtn then
				tBtn.Visible = true
				tBtn.MouseButton1Click:Connect(fireToggle)
			end

			if barBg then
				local dragging = false
				barBg.InputBegan:Connect(function(i)
					if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
						dragging = true
						local inputPos = i.Position.X
						local barX = barBg.AbsolutePosition.X
						local barW = barBg.AbsoluteSize.X
						local pct = math.clamp((inputPos - barX) / barW, 0, 1)
						setVal(min + (max - min) * pct)
					end
				end)

				UserInputService.InputChanged:Connect(function(i)
					if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
						local inputPos = i.Position.X
						local barX = barBg.AbsolutePosition.X
						local barW = barBg.AbsoluteSize.X
						local pct = math.clamp((inputPos - barX) / barW, 0, 1)
						setVal(min + (max - min) * pct)
					end
				end)

				UserInputService.InputEnded:Connect(function(i)
					if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
						dragging = false
					end
				end)
			end

			item.Visible = true
			item.Parent = targetContainer
			return item
		end

		-- Inputbox widget
		function tab:AddInputBox(opt)
			opt = opt or {}
			local name = opt.Name or "Input"
			local val = opt.Default or opt.Value or ""
			local ph = opt.Placeholder or "Jumlah"
			local state = opt.ToggleDefault or false
			local callback = opt.Callback or function() end
			local toggleCallback = opt.ToggleCallback
			local flag = opt.Flag or name
			local boundKey = resolveSavedKey(flag .. "_Key", opt.Keybind)

			win.Flags[flag] = val
			win.Flags[flag .. "_Toggle"] = state
			win.Flags[flag .. "_Key"] = boundKey and boundKey.Name or ""

			local item = t3Prefab:Clone()
			local title = item:FindFirstChild("Title")
			local inp = item:FindFirstChild("InputBox")
			local tBtn = item:FindFirstChild("Toggle")
			local ind = tBtn and tBtn:FindFirstChild("Indicator")
			local grad = ind and ind:FindFirstChildOfClass("UIGradient")
			local kbBox = item:FindFirstChild("Keybind")

			if title then
				title.Text = name
			end

			if inp then
				if val ~= "" then
					inp.Text = tostring(val)
				end
				inp.PlaceholderText = ph
				inp.FocusLost:Connect(function(enter)
					win.Flags[flag] = inp.Text
					pcall(callback, inp.Text, state, enter)
					win:Notify({ Content = "Value Saved", Duration = 1 })
				end)
			end

			local function updateVisual()
				if ind then
					if state then
						tween(ind, 0.2, { Position = UDim2.new(0.51, 2, 0.111, 0) })
						if grad then
							grad.Color = toggleOnColor
						end
					else
						tween(ind, 0.2, { Position = UDim2.new(0.08, 0, 0.111, 0) })
						if grad then
							grad.Color = toggleOffColor
						end
					end
				end
			end
			updateVisual()

			win.Setters[flag] = function(newVal)
				val = newVal
				win.Flags[flag] = newVal
				if inp then
					inp.Text = tostring(newVal)
				end
				pcall(callback, tostring(newVal), state)
			end

			win.Setters[flag .. "_Toggle"] = function(newState)
				state = (newState == true)
				win.Flags[flag .. "_Toggle"] = state
				updateVisual()
				if toggleCallback then
					pcall(toggleCallback, state, inp and inp.Text or "")
				else
					pcall(callback, inp and inp.Text or "", state)
				end
			end

			local function fireToggle()
				state = not state
				win.Flags[flag .. "_Toggle"] = state
				updateVisual()
				if toggleCallback then
					pcall(toggleCallback, state, inp and inp.Text or "")
				else
					pcall(callback, inp and inp.Text or "", state)
				end
				win:Notify({ Content = name .. (state and " On" or " Off"), Duration = 1 })
			end

			if tBtn then
				tBtn.Visible = true
				tBtn.MouseButton1Click:Connect(fireToggle)
			end

			local keyHandler = bindKeybox(kbBox, boundKey, function(k)
				boundKey = k
				win.Flags[flag .. "_Key"] = k and k.Name or ""
			end, flag .. "_Key")

			win.Setters[flag .. "_Key"] = function(keyVal)
				keyHandler.Set(keyVal)
			end

			UserInputService.InputBegan:Connect(function(i, gpe)
				if not gpe and boundKey and i.KeyCode == boundKey then
					fireToggle()
				end
			end)

			item.Visible = true
			item.Parent = targetContainer
			return item
		end

		-- Textbox alias
		tab.AddTextbox = tab.AddInputBox

		-- Button widget
		function tab:AddButton(opt)
			opt = opt or {}
			local name = opt.Name or "Button"
			local callback = opt.Callback or function() end
			local flag = opt.Flag or name
			local cardDrop = opt.CardDrop
			local boundKey = resolveSavedKey(flag .. "_Key", opt.Keybind)

			win.Flags[flag .. "_Key"] = boundKey and boundKey.Name or ""

			local item = t4Prefab:Clone()
			local title = item:FindFirstChild("Title")
			local goBtn = item:FindFirstChild("Gobutton")
			local kbBox = item:FindFirstChild("Keybind")

			if title then
				title.Text = name
			end

			local function trigger()
				tween(goBtn, 0.1, { Size = UDim2.new(0, 22, 0, 22) })
				task.wait(0.1)
				tween(goBtn, 0.1, { Size = UDim2.new(0, 27, 0, 27) })
				if cardDrop then
					win:OpenCardDrop(cardDrop)
				end
				pcall(callback)
				win:Notify({ Content = name .. " Executed", Duration = 1 })
			end

			if goBtn then
				goBtn.MouseButton1Click:Connect(trigger)
			end

			local keyHandler = bindKeybox(kbBox, boundKey, function(k)
				boundKey = k
				win.Flags[flag .. "_Key"] = k and k.Name or ""
			end, flag .. "_Key")

			win.Setters[flag .. "_Key"] = function(keyVal)
				keyHandler.Set(keyVal)
			end

			UserInputService.InputBegan:Connect(function(i, gpe)
				if not gpe and boundKey and i.KeyCode == boundKey then
					trigger()
				end
			end)

			item.Visible = true
			item.Parent = targetContainer
			return item
		end

		-- Dropdown widget
		function tab:AddDropdown(opt)
			opt = opt or {}
			local name = opt.Name or "Dropdown"
			local opts = opt.Options or {}
			local cb = opt.Callback
			local flag = opt.Flag or name
			local defaultVal = opt.Default or "Select"

			win.Flags[flag] = defaultVal
			win.Setters[flag] = function(newVal)
				selectedNameLabel.Text = tostring(newVal)
				if cb then
					pcall(cb, newVal)
				end
			end

			local item = t4Prefab:Clone()
			local title = item:FindFirstChild("Title")
			local goBtn = item:FindFirstChild("Gobutton")
			local kbBox = item:FindFirstChild("Keybind")
			if kbBox then
				kbBox.Visible = false
			end

			if title then
				title.Text = name
			end

			local function openThisDropdown()
				win:OpenCardDrop({
					Title = name,
					Options = opts,
					Default = win.Flags[flag],
					Callback = function(val)
						win.Flags[flag] = tostring(val)
						if cb then
							pcall(cb, val)
						end
					end
				})
			end

			if goBtn then
				goBtn.MouseButton1Click:Connect(openThisDropdown)
			end

			item.Visible = true
			item.Parent = targetContainer
			return item
		end

		return tab
	end

	return win
end

return SugengLib
