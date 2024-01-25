{ pkgs, config, lib, ... }:
{
  programs.ledger.enable = true;
  programs.ledger.package = pkgs.ledger;
  programs.ledgersettings = {
  			   date-format = "%Y-%m-%d";
			   sort = "date";
		};
}
