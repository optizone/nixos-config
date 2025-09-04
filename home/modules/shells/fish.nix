{ ... }:
{
  programs.fish = {
    enable = true;

    shellInit = ''
      eval $(ssh-agent -c) &>/dev/null
      ssh-add $HOME/.ssh/id_github &>/dev/null
      ssh-add $HOME/.ssh/id_work &>/dev/null
    '';

    interactiveShellInit = ''
      # Suppresses fish's intro message
      set fish_greeting

      set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
      set -x MANROFFOPT -c
      set -g theme_nerd_fonts yes

      fastfetch
    '';

    shellAliases = {
      "cd" = "z";
      "cd.." = "cd ..";
      "cd,," = "cd ..";

      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";

      ",," = "..";
      ",,," = ",,,";
      ",,,," = ",,,,";
      ",,,,," = ",,,,,";

      "nd" = "nix develop --command fish";
      "nv" = "nvim .";
    };

    functions = {
      extract = ''
        function extract
          switch $argv[1]
            case "*.tar.bz2"
              tar xjf $argv[1]

            case "*.tar.gz"
              tar xzf $argv[1]

            case "*.bz2"
              bunzip2 $argv[1]

            case "*.rar"
              unrar e $argv[1]

            case "*.gz"
              gunzip $argv[1]

            case "*.tar"
              tar xf $argv[1]

            case "*.tbz2"
              tar xjf $argv[1]

            case "*.tgz"
              tar xzf $argv[1]

            case "*.zip"
              unzip $argv[1]

            case "*.Z"
              uncompress $argv[1]

            case "*.7z"
              7z x $argv[1]

            case "*"
              echo "unknown extension: $argv[1]"
          end
        end
      '';

      backup = ''
        function backup --argument filename
            cp $filename $filename.bak
        end
      '';

    };
  };
}
