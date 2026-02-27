{ pkgs, ... }:

{
    # Config
    environment.etc.".gitconfig".text =
    ''
	[user]
	name = "Plunne"
	email = "plunne.celeste@gmail.com"
    '';
}
