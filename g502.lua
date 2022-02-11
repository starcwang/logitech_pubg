EnablePrimaryMouseButtonEvents(true)
local step = 2.0
local recoil = false

-- only int
ak = 5
ak_slp=6

m4 = 4
m4_slp=8

function OnEvent(event, arg)
    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 6) then
        recoil = false
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
        recoil = true
        step = m4
        slp = m4_slp
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 4) then
        recoil = true
        step = ak
        slp = ak_slp
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and recoil) then
        repeat
            Sleep(slp)
            MoveMouseRelative(0, step)
        until not IsMouseButtonPressed(1)
    end
end
