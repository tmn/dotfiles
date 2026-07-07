{
  pkgs,
  ...
}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      HELIX_RUNTIME = "$HOME/src/helix/runtime";
      EDITOR = "hx";
      NVM_DIR = "$HOME/.nvm";
    };

    history = {
      size = 1000000;
      save = 1000000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
    };

    shellAliases = {
      ls = "eza --sort=type";
      l = "eza -lbF --git --sort=type";
      ll = "eza -lbF --git --sort=type";
      llm = "eza -lbGd --git --sort=modified";
      la = "eza -lbhHigUmuSa --sort=type --time-style=long-iso --git --color-scale";
      lx = "eza -lbhHigUmuSa@ --sort=type --time-style=long-iso --git --color-scale";

      hl = "${pkgs.ripgrep}/bin/rg --passthru";

      cat = "${pkgs.bat}/bin/bat";
      ccat = "/usr/bin/cat";
      ss = "${pkgs.git}/bin/git status";
    };

    initContent = ''
      setopt EXTENDED_HISTORY
      setopt HIST_FIND_NO_DUPS
      setopt HIST_REDUCE_BLANKS
      setopt INC_APPEND_HISTORY
      setopt APPEND_HISTORY

      # Git prompt
      source "${pkgs.git}/share/git/contrib/completion/git-prompt.sh"
      # source /usr/lib/git-core/git-sh-prompt
      setopt PROMPT_SUBST
      PROMPT='%F{135}tmn%f%F{133}@%f%F{166}tv%f %F{118}%~%f$(__git_ps1 " (%s)")
      $ '
      # PATH additions
      path+=(
        "$HOME/.local/bin"
        "$HOME/.local/share/swiftly/bin"
        "$HOME/.pixi/bin"
        "$HOME/.cargo/bin"
      )
    '';
  };
}