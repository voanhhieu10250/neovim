local status_ok, navic = pcall(require, "nvim-navic")
if not status_ok then
  return
end

local icons = require "user.icons"


navic.setup {
  icons = {
    File = icons.kind.File .. ' ',
    Module = icons.kind.Module .. ' ',
    Namespace = icons.kind.Module .. ' ',
    Package = icons.ui.Package .. ' ',
    Class = icons.kind.Class .. ' ',
    Method = icons.kind.Method .. ' ',
    Property = icons.kind.Property .. ' ',
    Field = icons.kind.Field .. ' ',
    Constructor = icons.kind.Constructor .. ' ',
    Enum = icons.kind.Enum .. ' ',
    Interface = icons.kind.Interface .. ' ',
    Function = icons.kind.Function .. ' ',
    Variable = icons.kind.Variable .. ' ',
    Constant = icons.kind.Constant .. ' ',
    String = icons.type.String .. ' ',
    Number = icons.type.Number .. ' ',
    Boolean = icons.type.Boolean .. ' ',
    Array = icons.type.Array .. ' ',
    Object = icons.type.Object .. ' ',
    Key = icons.kind.Keyword .. ' ',
    Null = icons.kind.Field .. ' ',
    EnumMember = icons.kind.EnumMember .. ' ',
    Struct = icons.kind.Struct .. ' ',
    Event = icons.kind.Event .. ' ',
    Operator = icons.kind.Operator .. ' ',
    TypeParameter = icons.kind.TypeParameter .. ' '
  },
  highlight = true,
  separator = " " .. icons.ui.ChevronRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
}

-- local icons = require "user.icons"
--
-- -- vim.api.nvim_set_hl(0, "WinBarSeparator", { fg = "#111fff" })
-- -- local fg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).background
-- -- local bg = vim.api.nvim_get_hl_by_name('DiffAdd', 0).foreground
--
-- local space = ""
--
-- if vim.fn.has "mac" == 1 then
--   space = " "
-- end
--
-- vim.api.nvim_set_hl(0, "Winbar", { fg = "#6b737f" })
--
-- -- Customized config
-- gps.setup {
--
--   disable_icons = false, -- Setting it to true will disable all icons
--
--   icons = {
--     ["class-name"] = "%#CmpItemKindClass#" .. icons.kind.Class .. "%*" .. space, -- Classes and class-like objects
--     ["function-name"] = "%#CmpItemKindFunction#" .. icons.kind.Function .. "%*" .. space, -- Functions
--     ["method-name"] = "%#CmpItemKindMethod#" .. icons.kind.Method .. "%*" .. space, -- Methods (functions inside class-like objects)
--     ["container-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space, -- Containers (example: lua tables)
--     ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.misc.Tag .. "%*" .. " ", -- Tags (example: html tags)
--     ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
--     ["sequence-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
--     ["null-name"] = "%#CmpItemKindField#" .. icons.kind.Field .. "%*" .. space,
--     ["boolean-name"] = "%#CmpItemKindValue#" .. icons.type.Boolean .. "%*" .. space,
--     ["integer-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
--     ["float-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
--     ["string-name"] = "%#CmpItemKindValue#" .. icons.type.String .. "%*" .. space,
--     ["array-name"] = "%#CmpItemKindProperty#" .. icons.type.Array .. "%*" .. space,
--     ["object-name"] = "%#CmpItemKindProperty#" .. icons.type.Object .. "%*" .. space,
--     ["number-name"] = "%#CmpItemKindValue#" .. icons.type.Number .. "%*" .. space,
--     ["table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Table .. "%*" .. space,
--     ["date-name"] = "%#CmpItemKindValue#" .. icons.ui.Calendar .. "%*" .. space,
--     ["date-time-name"] = "%#CmpItemKindValue#" .. icons.ui.Table .. "%*" .. space,
--     ["inline-table-name"] = "%#CmpItemKindProperty#" .. icons.ui.Calendar .. "%*" .. space,
--     ["time-name"] = "%#CmpItemKindValue#" .. icons.misc.Watch .. "%*" .. space,
--     ["module-name"] = "%#CmpItemKindModule#" .. icons.kind.Module .. "%*" .. space,
--   },
--
--   -- Add custom configuration per language or
--   -- Disable the plugin for a language
--   -- Any language not disabled here is enabled by default
--   -- languages = {
--   -- 	-- Some languages have custom icons
--   -- 	["json"] = {
--   -- 		icons = {
--   -- 		}
--   -- 	},
--   -- 	["toml"] = {
--   -- 		icons = {
--   -- 		}
--   -- 	},
--   -- 	["verilog"] = {
--   -- 		icons = {
--   -- 		}
--   -- 	},
--   -- 	["yaml"] = {
--   -- 		icons = {
--   -- 		}
--   -- 	},
--
--   -- Disable for particular languages
--   -- ["bash"] = false, -- disables nvim-gps for bash
--   -- ["go"] = false,   -- disables nvim-gps for golang
--
--   -- Override default setting for particular languages
--   -- ["ruby"] = {
--   --	separator = '|', -- Overrides default separator with '|'
--   --	icons = {
--   --		-- Default icons not specified in the lang config
--   --		-- will fallback to the default value
--   --		-- "container-name" will fallback to default because it's not set
--   --		["function-name"] = '',    -- to ensure empty values, set an empty string
--   --		["tag-name"] = ''
--   --		["class-name"] = '::',
--   --		["method-name"] = '#',
--   --	}
--   --}
--   -- },
--
--   separator = " " .. icons.ui.ChevronRight .. " ",
--
--   -- limit for amount of context shown
--   -- 0 means no limit
--   -- Note: to make use of depth feature properly, make sure your separator isn't something that can appear
--   -- in context names (eg: function names, class names, etc)
--   depth = 0,
--
--   -- indicator used when context is hits depth limit
--   depth_limit_indicator = "..",
--   text_hl = "Winbar",
-- }
