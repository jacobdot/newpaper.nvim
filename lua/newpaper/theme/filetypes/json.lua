local util = require("newpaper.util")
local M    = {}

function M.setup(configColors, configStyle)

    -- stylua: ignore start

    local jsonSyn  = {}
    jsonSyn.colors = configColors
    jsonSyn.style  = configStyle
    local newpaper = jsonSyn.colors
    local style    = jsonSyn.style

    jsonSyn.loadSyntax = function()
        local syntax = {
            jsonKeyword = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
        }
        return syntax
    end

    jsonSyn.loadTreeSitter = function()

        -- fallback to 0.7
        local treesitterOldKey = {
            ["@label.json"]    = "jsonTSLabel",
            ["@label.hjson"]   = "hjsonTSLabel",
            ["@label.jsonnet"] = "jsonnetTSLabel",
        }

        local treesitter = {
            ["@label.json"]    = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
            ["@label.hjson"]   = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
            ["@label.jsonnet"] = { fg = newpaper.darkengreen, style = style.f_style, nocombine = true },
        }

        -- fallback to 0.7
        return util.treesitterOverride(treesitter, treesitterOldKey)
    end

    jsonSyn.loadPlugins = function()
        local plugins = {}
        return plugins
    end

    -- stylua: ignore end

    return jsonSyn
end

return M
