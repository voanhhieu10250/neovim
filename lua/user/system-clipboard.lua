local m = {}

local function SET_G_CLIPBOARD()
  vim.g.clipboard = {
    name = "clip.exe (Copy Only)",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    cache_enabled = true,
  }
end

function m.TOGGLE_G_CLIPBOARD()
  if vim.g.clipboard ~= nil then
    vim.g.clipboard = nil
  else
    SET_G_CLIPBOARD()
  end

  -- reload clipboard tool 
  vim.cmd "unlet g:loaded_clipboard_provider"
  vim.cmd "runtime autoload/provider/clipboard.vim"
end

return m
