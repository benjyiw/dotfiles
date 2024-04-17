vim.keymap.set("n", "<leader>dd", "<cmd>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require('dap').close()<CR>")

-- debug go test
vim.keymap.set("n", "<leader>dt", "<cmd>lua require('dap-go').debug_test()<CR>")

-- open dap ui
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<CR>")

local function get_arguments()
  local co = coroutine.running()
  if co then
    return coroutine.create(function()
      local args = {}
      vim.ui.input({ prompt = 'Enter command-line arguments: ' }, function(input)
        args = vim.split(input, " ")
      end)
      coroutine.resume(co, args)
    end)
  else
    local args = {}
    vim.ui.input({ prompt = 'Enter command-line arguments: ' }, function(input)
      args = vim.split(input, " ")
    end)
    return args
  end
end

require("dap-go").setup({
  dap_configurations = {
    {
      type = "go",
      name = "Debug Go Main With Args",
      request = "launch",
      mode = "debug",
      program = "./${relativeFileDirname}",
      args = get_arguments,
    },
  }
})

require("dapui").setup()
