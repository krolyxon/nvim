local KrolyxonGroup = vim.api.nvim_create_augroup('Krolyxon', {})

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Remove trailing whitespaces on :w
autocmd({ "BufWritePre" }, {
    group = KrolyxonGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Don"t auto commenting new lines
autocmd("BufEnter", {
    pattern = "",
    command = "set fo-=c fo-=r fo-=o"
})

-- spell check markdown and tex files
vim.cmd([[
  augroup spellCheck
    autocmd!
    autocmd Filetype plaintext setlocal spell
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
    autocmd BufRead,BufNewFile *.rmd setlocal spell
    autocmd BufRead,BufNewFile *.Rmd setlocal spell
    autocmd BufRead,BufNewFile *.tex setlocal spell
  augroup END
]])


-- Run C/C++ fil
vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', ':w<CR>:!gcc -o %:t:r % && ./%:t:r<CR>', {silent = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<F6>', ':w<CR>:!g++ -o %:t:r % && ./%:t:r<CR>', {silent = true})
vim.api.nvim_buf_set_keymap(0, 'n', '<F7>', ':w<CR>:lua require("kterm.terminal").send("cp -f " .. vim.fn.expand("%") .. " /tmp; javac -d /tmp " .. vim.fn.expand("%") .. "; java -cp /tmp " .. vim.fn.expand("%:t:r"), "float")<CR>', {silent = true})
-- vim.api.nvim_buf_set_keymap(0, 'n', '<F5>', ":w<CR>:new | term . '!gcc %:p:h && ./a.out'<CR>:startinsert<CR>", {silent = true})
--


local build_commands = {
  c = "!g++ -std=c++17 -o %:p:r.o %",
  cpp = "!g++ -std=c++17 -Wall -O2 -o %:p:r.o %",
  rust = "!cargo build --release",
  go = "!go build",
  -- tex = "pdflatex %",
  tex = "VimtexCompile",
  javascript = "",
}

local debug_build_commands = {
  c = "!g++ -std=c++17 -g -o %:p:r.o %",
  cpp = "!g++ -std=c++17 -g -o %:p:r.o %",
  rust = "!cargo build",
  go = "!go build",
}

local run_commands = {
  c = "%:p:r.o",
  cpp = "%:p:r.o",
  rust = "cargo run --release",
  go = "go run .",
  tex = "",
  javascript = "node %",
  python = "python3 %",
}

vim.api.nvim_create_user_command("Build", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(build_commands) do
    if filetype == file then
      vim.cmd(command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("DebugBuild", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(debug_build_commands) do
    if filetype == file then
      vim.cmd(command)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Run", function()
  local filetype = vim.bo.filetype

  for file, command in pairs(run_commands) do
    if filetype == file then
      vim.cmd("sp") -- Vertical split
      -- vim.cmd("vs") -- Horizontal split
      vim.cmd("term " .. command)
      vim.cmd("resize 20N") -- Comment this if horizontal
      local keys = vim.api.nvim_replace_termcodes("i", true, false, true)
      vim.api.nvim_feedkeys(keys, "n", false)
      break
    end
  end
end, {})

vim.api.nvim_create_user_command("Ha", function()
  vim.cmd([[Build]])
  vim.cmd([[Run]])
end, {})

vim.api.nvim_create_user_command("Config", function() vim.cmd([[cd ~/.config/nvim]]) end, {})
