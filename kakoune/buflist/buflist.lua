local wezterm = require "wezterm"
local m = {}

local table_insert = table.insert

local function assemble(
    window,
    name,
    value,
    active_bg,
    active_fg,
    inactive_bg1,
    inactive_fg1,
    inactive_bg2,
    inactive_fg2
)
    if name ~= "buflist" then
        return
    end

    local entries = {}
    if value then
        local ok, buflist = pcall(wezterm.json_parse, value)
        if ok and type(buflist) == "table" then
            for i, buffer in ipairs(buflist) do
                local current_bg, current_fg

                if buffer.active then
                    current_bg = active_bg
                    current_fg = active_fg
                elseif i % 2 == 0 then
                    current_bg = inactive_bg1
                    current_fg = inactive_fg1
                else
                    current_bg = inactive_bg2
                    current_fg = inactive_fg2
                end

                table_insert(entries, { Background = { Color = current_bg } })
                table_insert(entries, { Foreground = { Color = current_fg } })
                table_insert(entries, { Text = "  " .. buffer.text .. "  " })
            end
        end
    end

    table_insert(entries, { Text = " " })
    window:set_right_status(wezterm.format(entries))
end

function m.start(active_bg, active_fg, inactive_bg1, inactive_fg1, inactive_bg2, inactive_fg2)
    wezterm.on("user-var-changed", function(window, _, name, value)
        assemble(window, name, value, active_bg, active_fg, inactive_bg1, inactive_fg1, inactive_bg2, inactive_fg2)
    end)
end

return m
