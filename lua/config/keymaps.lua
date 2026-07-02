-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nerdtree",
  callback = function()
    vim.keymap.set("n", "a", "ma", { buffer = true, noremap = true, silent = true })
  end,
})

-- Search ONLY your notes folder instantly
vim.keymap.set("n", "<leader>fd", function()
  LazyVim.pick("files", { cwd = "~/notes" })()
end, { desc = "[F]ind Notes" })

-- Live grep search INSIDE the text of all notes
vim.keymap.set("n", "<leader>fg", function()
  LazyVim.pick("live_grep", { cwd = "~/notes" })()
end, { desc = "[F]ind [G]rep Notes" })

--[=[
-- Reference Jumping within same file MarkDown format
vim.keymap.set("n", "gl", function()
  -- 1. Get the exact text inside the brackets/parentheses under the cursor
  local target = vim.fn.expand("<cfile>")

  -- 2. If it starts with '#', strip it off so we can search for the raw ID
  if string.sub(target, 1, 1) == "#" then
    target = string.sub(target, 2)
  end

  -- 3. Search the current file for that ID (case-insensitive)
  -- If it can't find it, show a clear message.
  if not vim.fn.search([[\c]] .. target, "w") then
    print("Could not find reference: " .. target)
  end
end, { buffer = true, desc = "Jump to internal link reference" })
--]=]
