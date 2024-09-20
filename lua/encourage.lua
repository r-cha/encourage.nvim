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

local function show_floating_message(message)
  local width = #message
  local height = 1
  local buf = vim.api.nvim_create_buf(false, true)

  -- This puts the message in the bottom right corner of the current window
  local current_win = vim.api.nvim_get_current_win()
  local win_config = vim.api.nvim_win_get_config(current_win)
  local win_width = win_config.width
  local win_height = win_config.height

  local opts = {
    style = "minimal",
    relative = "win",
    win = current_win,
    width = width,
    height = height,
    row = win_height - height - 2,
    col = win_width - width - 2,
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, false, opts)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {" " .. message .. " "})

  vim.api.nvim_win_set_option(win, "winhl", "Normal:NormalFloat,FloatBorder:FloatBorder")

  -- Set a timer to close the window after 5 seconds
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 5000)
end

local function custom_write_message(encouragements)
  local message = encouragements[math.random(#encouragements)]
  show_floating_message(message)
end

function M.setup(opts)
  opts = opts or {}
  local encouragements = opts.messages or default_encouragements
  local plugin = vim.api.nvim_create_augroup("CustomWriteMessage", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    group=plugin,
    callback=function()
      custom_write_message(encouragements)
    end
  })
end

return M
