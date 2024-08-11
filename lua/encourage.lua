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

---Chooses a random message and displays it using the notify API
---@param encouragements string[]
local function custom_write_message(encouragements)
  local message = encouragements[math.random(#encouragements)]
  -- The third parameter is ignored by default, unless you have a plugin like `nvim-notify`
  vim.notify(message, nil, { title = "encourage.nvim" } )
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
