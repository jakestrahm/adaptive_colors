local M = {}

function detect_display_mode()
    -- how to check for each os?
    local os = ""

    if os == "" then
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")

        if handle then
            local result = handle:read("*a")
            handle:close()

            return result:match("Dark") and "dark" or "light"
        end
    end
end

function M.set_colors(light_theme, dark_theme)
   local is_dark = detect_display_mode() == "dark"

    vim.cmd("colorscheme " .. (is_dark and dark_theme or light_theme))
    vim.cmd("set background=" .. (is_dark and "dark" or "light"))
end

return M
