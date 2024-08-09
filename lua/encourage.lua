local M = {}

local default_encouragements = {
  "Great job! ✨",
  "You're doing great! 💪",
  "Keep up the good work! 🌟",
  "Well done! 🎉",
  "Onward and upward! 🚀",
  "You're on fire! 🔥",
  "You're a star! ⭐️",
  "You're amazing! 🌈",
  "That was awesome! 🎈",
  "Smart move. 🧠",
  "Bravo! 👏",
  "Nailed it. 🔨",
}

math.randomseed(os.time())

local function show_floating_message(message)
  local width = #message
  local height = 1
  local buf = vim.api.nvim_create_buf(false, true)
  local win_height = vim.api.nvim_get_option("lines")
  local win_width = vim.api.nvim_get_option("columns")

  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = win_height - height - 4,
    col = win_width - width - 2,
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, false, opts)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {" " .. message .. " "})
  vim.api.nvim_win_set_option(win, "winblend", 20)

  -- Use FloatBorder for the border color
  vim.api.nvim_win_set_option(win, "winhl", "Normal:Normal,FloatBorder:FloatBorder")

  -- Set a timer to close the window after 5 seconds
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 5000)
end

local function custom_write_message(encouragements)
  -- Choose a random message
  local message = encouragements[math.random(#encouragements)]
  -- Display the custom message in a floating window
  show_floating_message(message)
end

local function setup_highlights()
  -- Link our custom highlight groups to default ones
  vim.api.nvim_set_hl(0, "CustomWriteMessageNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "CustomWriteMessageBorder", { link = "FloatBorder" })
end

function M.setup(opts)
  opts = opts or {}
  local encouragements = opts.messages or default_encouragements

  -- Set up highlight groups
  setup_highlights()

  local plugin = vim.api.nvim_create_augroup("CustomWriteMessage", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group=plugin,
    callback=function()
      custom_write_message(encouragements)
    end
  })
end

return M
