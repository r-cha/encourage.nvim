# encourage.nvim

Add a little encouragement to your life any time you write a buffer.

Inspired by [Encourage](https://github.com/nicollasricas/vscode-encourage) for VSCode.

![output](https://github.com/user-attachments/assets/16db15fc-6922-480c-bcf3-c58a66a54964)

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

Once set up, the plugin will display encouraging messages in the bottom right corner of the current window whenever you write a file (`:w`, `:write`, etc.).

### Customization

You can customize the plugin's behavior during setup:

```lua
require('encourage').setup({
  messages = {
    "Great job!",
    "Keep up the good work!",
    -- Add your own messages here
  },
})
```

If no custom messages are provided, the plugin wil use its default set of encouraging messages.

## Local Development

To run this plugin locally in a test Neovim instance:

1. In `test/init.lua`, replace `/path/to/your/encourage.nvim` with the actual path to your plugin directory.

2. Start Neovim with the test configuration:

```sh
nvim -u test/init.lua
```

3. The plugin should now be loaded.
   You can test it by writing a file and seeing the encouraging message at the bottom right of the active window.
   If you want to test it alongside other plugins, edit `test/init.lua` accordingly.

## Feedback and Contributions

If you have suggestions for improvements or new features, feel free to open an issue or pull request on the plugin's GitHub repository.

## License

This plugin is licensed under [MIT](https://opensource.org/licenses/MIT), so you're free to use, modify, and distribute it as you see fit.
