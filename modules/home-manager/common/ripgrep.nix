# https://github.com/BurntSushi/ripgrep
{
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--colors=line:style:bold"
    ];
  };
}
