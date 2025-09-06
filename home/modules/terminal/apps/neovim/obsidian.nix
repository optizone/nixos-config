{ pkgs, ... }:
{

  programs.nvf.settings.config.vim.lazy.plugins = {
    "obsidian.nvim" = {
      package = pkgs.vimPlugins.obsidian-nvim;
      setupModule = "obsidian";

      lazy = true;
      event = [
        {
          event = "User";
          pattern = "LazyFile";
        }
      ];

      setupOpts = {
        workspaces = [
          {
            name = "zettelkasten";
            path = "~/zettelkasten";
          }
        ];

        picker = {
          name = "snacks.pick";
        };

        completion = {
          blink = true;
          nvim_cmp = false;
        };
      };
    };
  };
}
