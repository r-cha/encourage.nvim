# encourage.nvim

Add a little encouragement to your life any time you write a buffer.

Inspired by [Encourage](https://github.com/nicollasricas/vscode-encourage) for VSCode.

## Installation

To install this plugin, you can use any Neovim package manager you prefer. Below are examples for some popular package managers.

### Using `packer.nvim`

```lua
use {
  'r-cha/encourage.nvim',
  config = function()
    require('encourage').setup()
  end
}
```

### Using `lazy.nvim`

```lua
{
  'r-cha/encourage.nvim',
  config = true
}
```

## Usage

After installation, you need to set up the plugin in your Neovim configuration:

```lua
require('encourage').setup()
```

Once set up, the plugin will display encouraging messages in the command line area whenever you write a file (`:w`, `:write`, etc.).

## Customization

You can customize the plugin's behavior during setup:

```lua
require('encourage').setup({
  messages = {
    "Great job!", 
    "Keep up the good work!",
    -- Add your own messages here
  },
  -- Other configuration options...
})
```

If no custom messages are provided, the plugin wil use its default set of encouraging messages.

## Feedback and Contributions

If you have suggestions for improvements or new features, feel free to open an issue or pull request on the plugin's GitHub repository.

## License

This plugin is licensed under [MIT](https://opensource.org/licenses/MIT), so you're free to use, modify, and distribute it as you see fit.

