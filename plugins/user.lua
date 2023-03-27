-- InGitRepo source: https://github.com/wbthomason/packer.nvim/discussions/534

local vim = vim

local function check_git_repo()
  local cmd = "git rev-parse --is-inside-work-tree"
  if vim.fn.system(cmd) == "true\n" then
    vim.api.nvim_exec_autocmds("User", { pattern = "InGitRepo" })
    return true  -- removes autocmd after lazy loading git related plugins
  end
end

vim.api.nvim_create_autocmd(
  { "VimEnter", "DirChanged" },
  { callback = function() vim.schedule(check_git_repo) end }
)

return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {"tpope/vim-fugitive", event = 'User InGitRepo'},
  {"catppuccin/nvim" },
}
