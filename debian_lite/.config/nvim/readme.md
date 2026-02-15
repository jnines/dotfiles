# My Neovim setup

Probably shouldn't use this unless you know enough to tweak to your liking.

```bash
git clone https://github.com/jnines/nvim "$HOME"/.config/nvim
```

This will clone the basic/core config.  
You can switch to the lite or full config via:

```bash
touch "$HOME"/.config/nvim/.lite
```

... or

```bash
touch "$HOME"/.config/nvim/.full
```

... respectively, '.full' will override '.lite'. This could be done with ENV
vars, hostnames, or multiple other ways, but I prefer this approach atm.
