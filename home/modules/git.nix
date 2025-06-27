{
  username,
  gitUsername,
  gitEmail,
  ...
}:
{
  programs.git = {
    enable = true;

    userName = "${gitUsername}";
    userEmail = "${gitEmail}";

    extraConfig = {
      init.defaultBranch = "main";
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
      pull.ff = "only";
      color.ui = true;
      url = {
        "git@github.com:".insteadOf = [
          "gh:"
          "https://github.com/"
        ];
      };
      core.excludesFile = "/home/${username}/.config/git/.gitignore";
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = false;
        diff-so-fancy = true;
        navigate = true;
      };
    };
  };

  xdg.configFile."git/.gitignore".text = ''
    .vscode
  '';
}
