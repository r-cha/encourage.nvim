-- Create a new plugin
local plugin = vim.api.nvim_create_augroup("CustomWriteMessage", { clear = true })

-- Define some encouraging messages
local encouragements = {
  "Great job! ✨",
  "You're doing great! 💪",
  "Keep up the good work! 🌟",
  "Well done! 🎉",
  "Onward and upward! 🚀",
}

math.randomseed(os.time())

-- Define the function to override the write message
local function custom_write_message()
  -- Choose a random message
  local message = encouragements[math.random(#encouragements)]
  -- Display the custom message
  vim.api.nvim_echo({{message, ""}}, false, {})
end

-- Create an autocommand to trigger the custom write message
vim.api.nvim_create_autocmd("BufWritePost", {
  group = plugin,
  callback = function()
    custom_write_message()
  end,
})
