-- automatically highlighting other uses of the word under the cursor

return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  config = function()
    -- require('illuminate').setup()

    vim.cmd ( "highlight IlluminatedWordText gui=NONE guibg=#373737" )
    vim.cmd ( "highlight IlluminatedWordRead gui=NONE guibg=#373737" )
    vim.cmd ( "highlight IlluminatedWordWrite gui=NONE guibg=#373737" )
  end

}
