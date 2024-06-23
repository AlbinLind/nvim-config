return {
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = {
    italic = {
      strings = false,
      emphasis = false,
      comments = false,
      operators = false,
      folds = false
    }
  },
  init = function ()
    vim.cmd("colorscheme gruvbox") 
  end
}  
}
