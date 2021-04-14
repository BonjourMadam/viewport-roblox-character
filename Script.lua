character = game.Players.LocalPlayer.Character
camera = Instance.new("Camera", script.Parent)

game:GetService("RunService").RenderStepped:Connect(function()
	for i,v in pairs(script.Parent.ViewportFrame.Player:GetDescendants()) do
		v:Destroy()
	end
	for i,v in pairs(character:GetChildren()) do
		local clone = v:Clone()
		if clone:IsA("Script") or clone:IsA("LocalScript")or clone:IsA("ModuleScript") then
			clone:Destroy()
		else
			clone.Parent = script.Parent.ViewportFrame.Player
			if clone:IsA("Humanoid") then
				clone.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
			end
		end
	end
	script.Parent.ViewportFrame.CurrentCamera = camera
  -- MODIFY THE ANGLES HERE, THESE ARE THE BEST ANGLES FOR A CENTER VIEW I COULD FIND, RESULTS MAY VARY
	camera.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,4.3,-7) *  CFrame.Angles(math.rad(30),math.rad(180),0)


end)
