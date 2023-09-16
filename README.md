# Multiply-Divide.vim
This Vim plugin provides actions for multiplication and division of the number
under the cursor or the next number in the current line.

# What does it do?
Like built-in `<C-a>` and `<C-x>`, but with multiplication and division!

# Mappings
No mappings are created automatically. Add your own. I use:
```vim
nmap <Leader><C-a> <Plug>(multiply)
nmap <Leader><C-x> <Plug>(divide)
```
or using `init.lua`:
```lua
vim.keymap.set('n', '<Leader><C-a>', '<Plug>(multiply)')
vim.keymap.set('n', '<Leader><C-x>', '<Plug>(divide)')
```

# Usage
It works almost exactly like the built-in `<C-a>` and `<C-x>`
In normal mode, type `[count]<Leader><C-a>` to multiply the number under the
cursor (or the next number in the current line) with `[count]`.
It supports both integer and floating point numbers, and is dot-repeatable
without requiring [vim-repeat](https://github.com/tpope/vim-repeat).

A notable difference to the built-in `<C-a>` and `<C-x>` is that using `<C-a>`
without a `[count]` adds `1`, but since multiplication with `1` is a NOOP, the
action for `<Plug>(multiply)` in this case reuses the previous `[count]`. The
same applies to `<Plug>(divide)`.

# Requirements
Developed and tested on Neovim `0.9.1`. 100% Vimscript and no fancy stuff, so it
should work on Vim8+, too.

# Credits
Based on an implementation by [romainl](https://gist.github.com/romainl/97d79dfd522bd1c33c7fafb9ec08dc5d). I just polished it a little to add the following features:
1. Support for floating point numbers
2. Remember the last count
3. Dot-repeatable
4. Search restricted to the current line
