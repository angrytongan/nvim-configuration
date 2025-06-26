local M = {}

function M.setup()
    -- 1. Define a highlight group for inactive windows
    -- You can adjust 'guifg', 'guibg', 'ctermfg', 'ctermbg' to your preference.
    -- 'guifg' and 'ctermfg' are foreground (text) colors.
    -- 'guibg' and 'ctermbg' are background colors.
    -- 'blend' is specific to Neovim's UI, making the background partially transparent
    -- or blended with the default background. A value of 0 is opaque, 100 is fully transparent.
    -- You might need to experiment with 'blend' or simply change 'guibg' to a darker shade.
    -- vim.cmd([[highlight DimInactive guifg=grey guibg=black ctermfg=grey ctermbg=black blend=20]])

    -- Alternatively, you might just want to dim the background
    vim.cmd([[highlight DimInactive guibg=#1C1C1C ctermbg=darkgrey]]) -- example for a darker background

    -- 2. Function to apply/remove dimming
    local function dim_inactive_windows()
        for _, win_id in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
            if win_id == vim.api.nvim_get_current_win() then
                -- Active window: reset background to default (or your theme's default)
                vim.api.nvim_set_option_value('winhighlight', '', { win = win_id })
            else
                -- Inactive window: apply the DimInactive highlight group
                vim.api.nvim_set_option_value('winhighlight', 'Normal:DimInactive', { win = win_id })
            end
        end
    end

    -- 3. Autocommands to trigger the function
    vim.api.nvim_create_autocmd({ "WinEnter", "TabEnter", "BufWinEnter" }, {
        callback = dim_inactive_windows,
        group = vim.api.nvim_create_augroup("DimInactiveWindows", { clear = true }),
    })

    -- Initially apply dimming when Neovim starts
    dim_inactive_windows()
end

return M
