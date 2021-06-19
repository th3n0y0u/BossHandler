local anims = {script.BallAnimation, script.JumpRingsAnimation, script.WaveAnimation}

local died = false

function boss()
	
	while wait() and died == false do
		
		local function ball()
			
			local loadedanimation = script.Parent.Humanoid:LoadAnimation(anims[1])
			loadedanimation:Play()
			
			function sound()
				local Sound = Instance.new("Sound", game.Workspace)
				Sound.SoundId = "rbxassetid://144699494"
				Sound.Volume = 1
				Sound.PlaybackSpeed = 1
				Sound:Play()
				coroutine.resume(coroutine.create(function()
					wait(Sound.TimeLength)
					Sound:Destroy()
				end) )
			end
			
			function folder()
				local balls = Instance.new("Folder", game.Workspace)
				balls.Name = "BallsFolder"
			end
			
			folder()
			
			function touched(hit) 
				if hit.Parent:FindFirstChild("Humanoid") then
					if hit.Parent.Humanoid.Health > 0 then
						if hit ~= nil then
							hit.Parent.Humanoid:TakeDamage(10)
						end
					else
						hit.Parent:BreakJoints()
					end
				end
			end
			
			for _,v in ipairs(game.ServerStorage.Balls:GetChildren()) do
				
				local clone = v:Clone()
				clone.Parent = game.Workspace.BallsFolder
				clone.CanCollide = false
				sound()
				wait(0.04) 
				clone.Touched:Connect(touched) 
			end
			
			wait(5)
			game:GetService("Debris"):AddItem(game.Workspace.BallsFolder, 1)
	
			loadedanimation:Stop()
		end
		
		local function jumprings()
			
			function sound()
				local Sound = Instance.new("Sound", game.Workspace)
				Sound.SoundId = "rbxassetid://1529967756"
				Sound.Volume = 10
				Sound.PlaybackSpeed = 1
				Sound:Play()
				coroutine.resume(coroutine.create(function()
					wait(Sound.TimeLength)
					Sound:Destroy()
				end) )
			end 
			
			local loadedanimation = script.Parent.Humanoid:LoadAnimation(anims[2])
			loadedanimation:Play()
			
			function touched(hit)
				if hit.Parent:FindFirstChild("Humanoid") then
					if hit.Parent.Humanoid.Health > 0 then
						if hit ~= nil then
							hit.Parent.Humanoid:TakeDamage(50)
							wait(1)
							hit.Parent.Humanoid.Sit = true
						end
					else
						hit.Parent:BreakJoints()
					end
				end
			end
			
			function ring()
				
				local clone = game.ServerStorage.Ring:Clone()
				clone.Parent = game.Workspace
				
				for v = 1, 100, 1 do
					wait(0.04)
					clone.Size = clone.Size + Vector3.new(1, 1, 1)
					sound()
					clone.Touched:Connect(touched)
				end
				
				wait(3)
				
				for v = 1, 100, 1 do
					wait(0.04)
					clone.Size = clone.Size + Vector3.new(-1, 1, -1)
					sound()
					clone.Touched:Connect(touched)
				end
				
				clone:Destroy()
			end 
			
			ring()
			loadedanimation:Stop()
		end
		
		local function wave()
			
			local loadedanimation = script.Parent.Humanoid:LoadAnimation(anims[3])
			loadedanimation:Play()
			
			function sound()
				local Sound = Instance.new("Sound", game.Workspace)
				Sound.SoundId = "rbxassetid://3415622194"
				Sound.Volume = 10
				Sound.PlaybackSpeed = 1
				Sound:Play()
				coroutine.resume(coroutine.create(function()
					wait(Sound.TimeLength)
					Sound:Destroy()
				end) )
			end 

			function troops()
				local number = 20
				local x
				local y
				local z
					
				for v = 1, number, 1 do
					local target = game.ServerStorage.WaveTroops:FindFirstChild("Giant Noob")
					local clone = target:Clone()
					if clone ~= nil then
						x = math.random(50, 122.325)
						y = 0.225
						z = math.random(50, 296.533)
							
						if clone:FindFirstChild("Humanoid") then
							clone.Torso.CFrame = CFrame.new(x, y, z)
							clone.Parent = game.Workspace
							clone:MakeJoints()
						else
							clone:WaitForChild("Humanoid")
							clone.Torso.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
							clone.Parent = game.Workspace
						end
					end
				end
				
				for v = 1, number * 1.5, 1 do
					local target = game.ServerStorage.WaveTroops:FindFirstChild("Noob")
					local clone = target:Clone()
					if clone ~= nil then
						x = math.random(50, 122.325)
						y = 0.225
						z = math.random(50, 296.533)

						if clone:FindFirstChild("Humanoid") then
							clone.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
							clone.Parent = game.Workspace
							clone:MakeJoints()
						else
							clone:WaitForChild("Humanoid")
							clone.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
							clone.Parent = game.Workspace
						end
					end
				end
				
				for v = 1, number * 2, 1 do
					local target = game.ServerStorage.WaveTroops:FindFirstChild("Sword Noob")
					local clone = target:Clone()
					if clone ~= nil then
						x = math.random(50, 122.325)
						y = 0.225
						z = math.random(50, 296.533)

						if clone:FindFirstChild("Humanoid") then
							clone.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
							clone.Parent = game.Workspace
							clone:MakeJoints()
						else
							clone:Load("Humanoid")
							clone:WaitForChild("Humanoid")
							clone.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
							clone.Parent = game.Workspace
							clone:MakeJoints()
						end
					end
				end
					wait(1)
					print("Troops spawned.")
					sound()
			end
			
			function gatlingguns()
				game.ServerStorage["Gatling Guns"].Parent = game.Workspace
			end 
			
			sword()
			troops()
			gatlingguns()
			print("All Troops Spawned.")
			
			while wait() do
				if game.Workspace:FindFirstChild("Sword Noob") == nil and game.Workspace:FindFirstChild("Noob") == nil and game.Workspace:FindFirstChild("Giant Noob") == nil then
					game.Workspace["Gatling Guns"].Parent = game.ServerStorage
					break
				end
			end
			
			loadedanimation:Stop()
		end
		
		
		ball()
		wait(1)
		jumprings()
		wait(1)
		wave()
		wait(1)
	end
	
	local function died()
		
		function sound()
			local Sound = Instance.new("Sound", game.Workspace)
			Sound.SoundId = "rbxassetid://5165834523"
			Sound.Volume = 10
			Sound.PlaybackSpeed = 1
			Sound:Play()
			coroutine.resume(coroutine.create(function()
				wait(Sound.TimeLength)
				Sound:Destroy()
			end) )
		end 
		
		died = true
		sound()
		
		wait(30)
		game:GetService("Debris"):AddItem(script.Parent, 1)
	end
	
	script.Parent.Humanoid.Died:Connect(died) 
end

local function teleport()
	for _, player in pairs(game.Players:GetPlayers()) do
		local gameid = 6972023013
		game:GetService("TeleportService"):Teleport(gameid, player) 
	end
end

local function mainclass()
	wait(25)
	boss()
	teleport()
end

mainclass()

-- i got bored ok?
local function easteregg()
	wait(69420)
	print("what")
	wait(69420)
	for _,v in pairs(game.Workspace:GetChildren()) do
		v:Destory()
	end
	print("LLLLL")
	wait(69420)
	for _,v in pairs(game.Players:GetPlayers()) do
		game:GetService("TeleportService"):Teleport(5243341535, v) 
	end
	print("BRUH")
end

easteregg()

print("ez")
print("L")
print("EZEZEZ")
print("EZLLLLL")
print("BRUHHH")
print("SO EZZZ")
wait(69420)
print("L")