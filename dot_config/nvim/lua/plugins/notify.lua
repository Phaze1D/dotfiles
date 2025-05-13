vim.notify = require("notify")
vim.notify.setup({
  timeout = 2000,
})

-- Setup notifications for CodeCompanion events
local notification_id = nil
local spinner_symbols = {
  "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏",
}
local spinner_index = 1
local spinner_timer = nil

-- Set up event listeners for CodeCompanion requests
local function setup_codecompanion_notifications()
  local group = vim.api.nvim_create_augroup("CodeCompanionHooks", { clear = true })

  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "CodeCompanionRequestStarted", "CodeCompanionRequestFinished" },
    group = group,
    callback = function(args)
      if args.match == "CodeCompanionRequestStarted" then
        -- Start spinner animation
        if spinner_timer then
          spinner_timer:stop()
        end

        spinner_timer = vim.loop.new_timer()
        spinner_timer:start(0, 100, vim.schedule_wrap(function()
          spinner_index = (spinner_index % #spinner_symbols) + 1
          local spinner = spinner_symbols[spinner_index]

          -- Create or update notification
          notification_id = vim.notify(
            "Processing request... " .. spinner,
            vim.log.levels.INFO,
            {
              title = "CodeCompanion",
              icon = "",
              replace = notification_id
            }
          )
        end))
      elseif args.match == "CodeCompanionRequestFinished" then
        -- Stop the timer and clear notification
        if spinner_timer then
          spinner_timer:stop()
          spinner_timer = nil
        end

        -- Show completion notification and clear after a delay
        notification_id = vim.notify(
          "Request completed!",
          vim.log.levels.INFO,
          {
            title = "CodeCompanion",
            icon = "✓",
            replace = notification_id
          }
        )

        -- Clear the completion notification after a short delay
        vim.defer_fn(function()
          if notification_id then
            vim.notify.dismiss(notification_id)
            notification_id = nil
          end
        end, 1000)
      end
    end,
  })
end

-- Initialize notifications
setup_codecompanion_notifications()
