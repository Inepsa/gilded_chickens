progressbar = exports.vorp_progressbar:initiate()

RegisterNetEvent("gilded_chickens:try_search")
RegisterNetEvent("gilded_chickens:do_search")
RegisterNetEvent("gilded_chickens:abort_search")
RegisterNetEvent("gilded_chickens:harvest")


local _prompts, _prompt = GetRandomIntInRange(0, 0xffffff), nil
local searching, showprompt, nearest = false, false, 0

AddEventHandler("gilded_chickens:try_search",function()
	searching, nearest = false, 0
end)

AddEventHandler("gilded_chickens:do_search",function(nestIndex, searchTime)
	local playerPed = PlayerPedId()
	TaskStartScenarioInPlace(playerPed, GetHashKey('WORLD_HUMAN_CROUCH_INSPECT'), searchTime, true, false, false, false)
	--exports['progressBars']:startUI(searchTime, _U("searching"))
	progressbar.start(_U("searching"), searchTime, 'linear' )
	Citizen.Wait(searchTime)
	ClearPedTasksImmediately(playerPed)
	nearest = 0
	searching = false
	TriggerServerEvent("gilded_chickens:do_search",nestIndex)
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		showprompt = false
		local sleep = true
		local pedID = PlayerPedId()
		local DeadOrDying = IsPedDeadOrDying(pedID)
		if (not searching) and (not DeadOrDying) then
			local coords = GetEntityCoords(pedID)
			for index, pos in ipairs(Config.ChickenNests) do
				local distance = #(coords - pos)
				if distance <= 1.5 then
					sleep = false 
					showprompt = true
					nearest = index
					break
				end
			end
		elseif searching and DeadOrDying then
			searching = false
			showprompt = false
			TriggerServerEvent("gilded_chickens:abort_search")
		end
		if showprompt and (not searching) and (nearest > 0) and (not DeadOrDying) then
			PromptSetActiveGroupThisFrame(_prompts, CreateVarString(10, 'LITERAL_STRING', _U("search_nest")))
			if Citizen.InvokeNative(0xC92AC953F0A982AE,_prompt) then
				sleep = true
				searching = true
				TriggerServerEvent("gilded_chickens:try_search",nearest)
			end
		end
		nearest = 0
		if sleep then Citizen.Wait(500) end
	end
end)

Citizen.CreateThread(function()
	_prompt = PromptRegisterBegin()
	PromptSetControlAction(_prompt, 0x760A9C6F) -- G key
	local str = CreateVarString(10, 'LITERAL_STRING', _U("nest"))
	PromptSetText(_prompt, str)
	PromptSetEnabled(_prompt, 1)
	PromptSetStandardMode(_prompt,1)
	PromptSetGroup(_prompt, _prompts)
	Citizen.InvokeNative(0xC5F428EE08FA7F2C,_prompt,true)
	PromptRegisterEnd(_prompt)
end)
