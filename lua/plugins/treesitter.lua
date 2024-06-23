-- From https://gist.github.com/Zbizu/43df621b3cd0dc460a76f7fe5aa87f30
function getOS()
	-- Unix, Linux variants
	local fh,err = assert(io.popen("uname -o 2>/dev/null","r"))
	if fh then
    local f, err = assert(io.open("/etc/lsb-release", "r"))
    if f then
      os_info = f:read("*a")
      local is_nix = string.find(os_info, "NixOS")
      if is_nix then
        return "NixOS"
      else
        return "Linux"
      end
    else
      osname = fh:read()
    end
	end

	return osname or "Windows"
end

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function() 
      if getOS() == "NixOS" then
        return ""
      end
      return ":TSUpdate"
    end,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      local to_install = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" }

      -- if getOS() == "NixOS" then
      --   to_install = {}
      -- end

      configs.setup({
          ensure_installed = to_install,
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  }
}
