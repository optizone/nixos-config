{ ... }:
{
  home.sessionVariables = {
    EDITOR = "nvim";
  };

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
          lsp.opts = ''
            ['rust-analyzer'] = {
              cargo = { allFeature = true },
              checkOnSave = true,
              procMacro = {
                enable = true,
              },
              diagnostics = {
                enable = true,
              },
            },
          '';
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
        nvim-cursorline.enable = false;
        cinnamon-nvim.enable = false;
        fidget-nvim.enable = false;

        rainbow-delimiters.enable = false;

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

      clipboard = {
        enable = true;
        providers.wl-copy.enable = true;
        registers = "unnamedplus";
      };

      snippets.luasnip.enable = true;

      keymaps = [
        # TODO: else vim.lsp.buf.codeAction()
        {
          key = "<leader>ca";
          mode = [
            "n"
            "v"
          ];
          action = "<Cmd>RustLsp codeAction<CR>";
          silent = true;
          desc = "Code Action for Rust LSP";
        }
        {
          key = "<leader>cd";
          mode = [
            "n"
            "v"
          ];
          action = "<Cmd>RustLsp renderDiagnostic current<CR>";
          silent = true;
          desc = "Render diagnostic";
        }
        {
          key = "<leader>cr";
          mode = [
            "n"
          ];
          action = "vim.lsp.buf.rename";
          lua = true;
          desc = "Rename";
        }

        {
          key = "K";
          mode = [ "n" ];
          action = "<Cmd>RustLsp hover actions<CR>";
          silent = true;
          desc = "rustaceanvim hover actions";
        }
        {
          key = "<esc>";
          mode = [ "n" ];
          action = "<Cmd>noh<CR>";
          silent = true;
          desc = "Disable search higlights";
        }
        # TODO: toggle
        {
          key = "<c-t>";
          mode = [ "t" ];
          action = "<c-\\><c-n>:CFloatTerm<CR>";
          noremap = true;
          silent = true;
          desc = "Quit toggleterm";
        }
        {
          key = "<c-s>";
          action = "<esc><Cmd>w<CR>";
          mode = [
            "n"
            "i"
          ];
          noremap = true;
          silent = true;
          desc = "Save file";
        }
        {
          key = "<leader>E";
          mode = [ "n" ];
          action = "<Cmd>Neotree toggle<CR>";
          silent = true;
          desc = "Toggle neotree";
        }
        {
          key = "<leader>e";
          mode = [ "n" ];
          action = "<Cmd>Neotree focus<CR>";
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

        # -- Goto diagnostics
        {
          key = "]e";
          mode = [ "n" ];
          action = "function() vim.diagnostic.goto_next({severity = \"ERROR\"}) end";
          desc = "Goto next error";
          lua = true;
        }
        {
          key = "[e";
          mode = [ "n" ];
          action = "function() vim.diagnostic.goto_prev({severity = \"ERROR\"}) end";
          desc = "Goto previous error";
          lua = true;
        }
        {
          key = "]w";
          mode = [ "n" ];
          action = "function() vim.diagnostic.goto_next({severity = \"WARN\"}) end";
          desc = "Goto next warning";
          lua = true;
        }
        {
          key = "[w";
          mode = [ "n" ];
          action = "function() vim.diagnostic.goto_prev({severity = \"WARN\"}) end";
          desc = "Goto previous warning";
          lua = true;
        }
        {
          key = "]d";
          mode = [ "n" ];
          action = "function() vim.diagnostic.goto_next({severity = nil}) end";
          desc = "Goto next diagnostic";
          lua = true;
        }
        {
          key = "[d";
          mode = [ "n" ];
          action = "function() vim.diagnostic.goto_prev({severity = nil}) end";
          desc = "Goto previous diagnostics";
          lua = true;
        }
        {
          key = "<leader>cd";
          mode = [ "n" ];
          action = "vim.diagnostic.open_float";
          desc = "Line diagnostics";
          lua = true;
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
        enable = true;
        nvim-lint.enable = true;
        config.virtual_lines = false;
        config.virtual_text = true;
      };

      tabline = {
        nvimBufferline = {
          enable = true;
          mappings = {
            closeCurrent = "<leader>bd";
          };
        };
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
        nvim-notify = {
          enable = true;
          # FIXME: hack for transparent gruvbox theme
          setupOpts.background_colour = "#282828";
        };
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

      navigation = {
        harpoon = {
          enable = true;
        };
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        modes-nvim = {
          enable = false;
          setupOpts.colors = {
            copy = "#D79921"; # or #FABD2F
            delete = "#CC241D"; # #FB4934
            insert = "#B16286"; # D3869B
            visual = "#458588"; # 83A598
          };
        };
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
            rust = "120";
          };
        };
        fastaction.enable = false;
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
