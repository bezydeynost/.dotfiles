{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  programs.zen-browser = {
    enable = true;

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false; # I use bitwarden
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.bezydeynost = {
      name = "bezydeynost";
      isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        clearurls
        darkreader
        localcdn
        material-icons-for-github
        privacy-badger
        return-youtube-dislikes
        sponsorblock
        ublock-origin
      ];

      mods = [
        "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
        "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unload Tabs
        "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec" # Cleaned URL bar
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
        "599a1599-e6ab-4749-ab22-de533860de2c" # Pimp your PiP
        "81fcd6b3-f014-4796-988f-6c3cb3874db8" # Zen Context Menu
      ];

      settings = {
        "zen.view.compact.enable-at-startup" = true;
        "zen.tabs.vertical.right-side" = true;
        "zen.welcome-screen.seen" = true;
      };
    };
  };
  stylix.targets.zen-browser.profileNames = [ "bezydeynost" ];
  stylix.targets.zen-browser.enable = true;
}
