{ ... }:
{
  imports = [
    ./lualine.nix
    ./neo-tree.nix
  ];

  programs.nvf = {
    enable = true;

    settings.config.vim = {
      viAlias = true;
      vimAlias = true;

      options.wrap = false;

      lsp = {
        # This must be enabled for the language modules to hook into
        # the LSP API.
        enable = true;

        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        trouble.enable = true;
        otter-nvim.enable = true;
        nvim-docs-view.enable = true;
        inlayHints.enable = true;
      };

      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable = true;
        };
      };

      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;

        bash.enable = true;
        clang.enable = true;
        css.enable = true;
        html.enable = true;
        sql.enable = true;
        java.enable = true;
        kotlin.enable = true;
        ts.enable = true;
        go.enable = true;
        lua.enable = true;
        zig.enable = true;
        python.enable = true;
        rust = {
          enable = true;
          crates.enable = true;
        };

        assembly.enable = false;
        astro.enable = false;
        nu.enable = false;
        csharp.enable = false;
        julia.enable = false;
        vala.enable = false;
        scala.enable = false;
        gleam.enable = false;
        dart.enable = false;
        ocaml.enable = false;
        elixir.enable = false;
        haskell.enable = false;
        ruby.enable = false;
        fsharp.enable = false;
        r.enable = false;
        typst.enable = false;
        tailwind.enable = false;
        svelte.enable = false;
        nim.enable = false;
      };

      visuals = {
        nvim-scrollbar.enable = true;
        nvim-web-devicons.enable = true;
        nvim-cursorline.enable = true;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;

        rainbow-delimiters.enable = true;

        highlight-undo.enable = true;
        indent-blankline.enable = true;

        # Fun
        cellular-automaton.enable = true;
      };

      theme = {
        enable = true;
        name = "gruvbox";
        style = "dark";
        transparent = true;
      };

      autopairs.nvim-autopairs.enable = true;

      autocomplete = {
        blink-cmp = {
          enable = true;
        };
      };

      snippets.luasnip.enable = true;

      keymaps = [
        {
          key = "<c-t>";
          mode = [ "t" ];
          action = "<c-\\><c-n>:CFloatTerm<CR>";
          noremap = true;
          silent = true;
          desc = "Quit toggleterm";
        }
        {
          key = "<leader>e";
          mode = [ "n" ];
          action = "<Cmd>Neotree toggle<CR>";
          silent = true;
          desc = "Toggle neotree";
        }
        {
          key = "<leader>qq";
          mode = [ "n" ];
          action = "<Cmd>qa<CR>";
          silent = true;
          desc = "Quit All";
        }

        # -- Top Pickers
        {
          key = "<leader>ff";
          mode = [ "n" ];
          action = "function() Snacks.picker.smart() end";
          desc = "Smart Find Files";
          lua = true;
        }
        {
          key = "<space><space>";
          mode = [ "n" ];
          action = "function() Snacks.picker.grep() end";
          desc = "Grep";
          lua = true;
        }
        {
          key = "<leader>:";
          mode = [ "n" ];
          action = "function() Snacks.picker.command_history() end";
          desc = "Command History";
          lua = true;
        }
        {
          key = "<leader>,";
          mode = [ "n" ];
          action = "function() Snacks.picker.buffers() end";
          desc = "Buffers";
          lua = true;
        }
        {
          key = "<leader>n";
          mode = [ "n" ];
          action = "function() Snacks.picker.notifications() end";
          desc = "Notification History";
          lua = true;
        }

        # -- LSP
        {
          key = "gd";
          mode = [ "n" ];
          action = "function() Snacks.picker.lsp_definitions() end";
          desc = "Goto Definition";
          lua = true;
        }
        {
          key = "gD";
          mode = [ "n" ];
          action = "function() Snacks.picker.lsp_declarations() end";
          desc = "Goto Declaration";
          lua = true;
        }
        {
          key = "gr";
          mode = [ "n" ];
          action = "function() Snacks.picker.lsp_references() end";
          desc = "References";
          nowait = true;
          lua = true;
        }
        {
          key = "gi";
          mode = [ "n" ];
          action = "function() Snacks.picker.lsp_implementations() end";
          desc = "Goto Implementation";
          lua = true;
        }
        {
          key = "gy";
          mode = [ "n" ];
          action = "function() Snacks.picker.lsp_type_definitions() end";
          desc = "Goto T[y]pe Definition";
          lua = true;
        }
        {
          key = "<leader>ss";
          mode = [ "n" ];
          action = "function() Snacks.picker.lsp_symbols() end";
          desc = "LSP Symbols";
          lua = true;
        }
        {
          key = "<leader>sS";
          mode = [ "n" ];
          action = "function() Snacks.picker.lsp_workspace_symbols() end";
          desc = "LSP Workspace Symbols";
          lua = true;
        }

        # -- Other
        {
          key = "<leader>bd";
          mode = [ "n" ];
          action = "function() Snacks.bufdelete() end";
          desc = "Delete buffer";
          lua = true;
        }
      ];

      diagnostics = {
        nvim-lint.enable = true;
      };

      tabline = {
        nvimBufferline.enable = true;
      };

      treesitter.context.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
        hardtime-nvim.enable = true;
      };

      git.enable = true;

      minimap = {
        codewindow = {
          enable = true;
          mappings = {
            open = "<leader>mo";
            toggle = "<leader>mm";
            toggleFocus = "<leader>mf";
          };
        };
      };

      dashboard = {
        alpha = {
          enable = true;
          theme = "startify";
        };
      };

      notify = {
        nvim-notify.enable = true;
      };

      projects = {
        project-nvim.enable = true;
      };

      utility = {
        preview.markdownPreview.enable = true;
        outline.aerial-nvim = {
          enable = true;
          mappings.toggle = "<leader>cs";
        };

        # TODO: enable
        yanky-nvim.enable = false;
        icon-picker.enable = true;
        surround.enable = false;
        multicursors.enable = false;

        yazi-nvim = {
          enable = true;
          mappings = {
            openYazi = "<leader>-";
            openYaziDir = "<leader>cw";
            yaziToggle = "<c-up>";
          };
        };

        snacks-nvim = {
          enable = true;
          setupOpts = {
            picker.enable = true;
            keys = [
              # -- Top Pickers
              {
                key = "<leader>ff";
                mode = [ "n" ];
                action = "function() Snacks.picker.smart() end";
                desc = "Smart Find Files";
              }
              {
                key = "<space><space>";
                mode = [ "n" ];
                action = "function() Snacks.picker.grep() end";
                desc = "Grep";
              }
              {
                key = "<leader>:";
                mode = [ "n" ];
                action = "function() Snacks.picker.command_history() end";
                desc = "Command History";
              }
              {
                key = "<leader>,";
                mode = [ "n" ];
                action = "function() Snacks.picker.buffers() end";
                desc = "Buffers";
              }
              {
                key = "<leader>n";
                mode = [ "n" ];
                action = "function() Snacks.picker.notifications() end";
                desc = "Notification History";
              }

              # -- LSP
              {
                key = "gd";
                mode = [ "n" ];
                action = "function() Snacks.picker.lsp_definitions() end";
                desc = "Goto Definition";
              }
              {
                key = "gD";
                mode = [ "n" ];
                action = "function() Snacks.picker.lsp_declarations() end";
                desc = "Goto Declaration";
              }
              {
                key = "gr";
                mode = [ "n" ];
                action = "function() Snacks.picker.lsp_references() end";
                desc = "References";
                nowait = true;
              }
              {
                key = "gi";
                mode = [ "n" ];
                action = "function() Snacks.picker.lsp_implementations() end";
                desc = "Goto Implementation";
              }
              {
                key = "gy";
                mode = [ "n" ];
                action = "function() Snacks.picker.lsp_type_definitions() end";
                desc = "Goto T[y]pe Definition";
              }
              {
                key = "<leader>ss";
                mode = [ "n" ];
                action = "function() Snacks.picker.lsp_symbols() end";
                desc = "LSP Symbols";
              }
              {
                key = "<leader>sS";
                mode = [ "n" ];
                action = "function() Snacks.picker.lsp_workspace_symbols() end";
                desc = "LSP Workspace Symbols";
              }

              # -- Other
              {
                key = "<leader>bd";
                mode = [ "n" ];
                action = "function() Snacks.bufdelete() end";
                desc = "Delete buffer";
              }
            ];
          };
        };
      };

      formatter = {
        conform-nvim.enable = true;
      };

      notes = {
        todo-comments = {
          enable = true;
          mappings = {
            quickFix = "<leader>tdq";
            telescope = "<leader>tds";
            trouble = "<leader>tdt";
          };
        };
      };

      # TODO: toggle
      terminal = {
        toggleterm = {
          enable = true;
          mappings.open = "<c-t>";
          lazygit.enable = true;
          lazygit.mappings.open = "<leader>gg";
          setupOpts = {
            terminal_mappings = true;
            insert_mappings = true;
            shell = "fish";
          };
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim.enable = true;
        illuminate.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            nix = "110";
            ruby = "120";
            java = "130";
            go = [
              "90"
              "130"
            ];
          };
        };
        fastaction.enable = true;
        nvim-ufo.enable = false;
      };

      session = {
        nvim-session-manager = {
          enable = true;
          mappings = {
            deleteSession = "<leader>sd";
            loadLastSession = "<leader>slt";
            loadSession = "<leader>sl";
            saveCurrentSession = "<leader>sc";
          };
        };
      };

      comments = {
        comment-nvim = {
          enable = true;
          mappings = {
            toggleCurrentBlock = "gbc";
            toggleCurrentLine = "gcc";
            toggleOpLeaderLine = "gc";
            toggleSelectedBlock = "gb";
            toggleSelectedLine = "gc";
          };
        };
      };
    };
  };
}
