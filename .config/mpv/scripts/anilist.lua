local python_path = "/usr/bin/python3"
local update_path = "/home/yl/Documents/Utilities/keroro/utils/update_progress.py"
local update_presence_path = "/home/yl/Documents/Utilities/keroro/presence/update_presence.py"
local run_presence_path = "/home/yl/Documents/Utilities/keroro/presence/run_presence.py"

local python_path = "/usr/bin/python3"
local update_path = "/home/yl/Documents/Utilities/keroro/utils/update_progress.py"
local update_presence_path = "/home/yl/Documents/Utilities/keroro/presence/update_presence.py"
local run_presence_path = "/home/yl/Documents/Utilities/keroro/presence/run_presence.py"

local cmd = nil
local complete = false

local function start_process(args)
    return mp.command_native_async({
        name = "subprocess",
        playback_only = false,
        args = args
    }, function() end)
end

local function start_presence()
    if cmd ~= nil then
        return
    end
end

local function stop_presence()
    cmd = nil
end

local function update_presence(pos)
end

local function check_completion(pos)
    if tonumber(pos) >= 80 then
        start_process({python_path, update_path, mp.get_property("path")})
        complete = true
    end
end

Timer = mp.add_periodic_timer(5, function()
    local pos = mp.get_property("percent-pos")
    update_presence(pos)
    if not complete then
        check_completion(pos)
    end
end)

mp.register_event("start-file", function()
    complete = false
    Timer:resume()
    start_presence()
end)

mp.register_event("shutdown", function()
    if cmd ~= nil then
        stop_presence()
    end
end)
