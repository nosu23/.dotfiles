return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
      "nvim-telescope/telescope.nvim"
  },
  config = function()
    require("telescope").setup({
      defaults = {
        sorting_strategy = "ascending",  -- ← これを足す
      },
      extensions = {
        file_browser = {
          grouped = true,                -- ディレクトリを先に
          hidden = true,                 -- 好みで
        },
      },
    })
    require("telescope").load_extension("file_browser")
  end,
}