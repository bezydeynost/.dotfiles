{inputs, ...}: {
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    discord = {
      equicord.enable = true;
      vencord.enable = false;
      openASAR.enable = false;
    };
    config = {
      autoUpdate = true;
      plugins = {
        clearUrls.enable = true;
        callTimer.enable = true;
        betterUploadButton.enable = true;
        gameActivityToggle.enable = true;
        gitHubRepos.enable = true;
        gifMaker.enable = true;
        messageLoggerEnhanced.enable = true;
        noF1.enable = true;
        favoriteEmojiFirst.enable = true;
        forceOwnerCrown.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        voiceChatDoubleClick.enable = true;
        viewRawVariant.enable = true;
        viewIcons.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        noBlockedMessages.enable = true;
        youtubeAdblock.enable = true;
        fullVcpfp.enable = true;
        saveFavoriteGifs.enable = true;
        silentTyping.enable = false;
        spotifyCrack.enable = true;
        petpet.enable = true;
        fakeNitro.enable = true;
        betterFolders = {
          enable = true;
          closeAllFolders = true;
          closeAllHomeButton = true;
          closeOthers = true;
        };
        gifCollections = {
          enable = true;
          collectionPrefix = "gc:";
          itemPrefix = "gc-item:";
          onlyShowCollections = false;
          showCopyImageLink = false;
          preventDuplicates = true;
          stopWarnings = false;
          defaultEmptyCollectionImage = "https://c.tenor.com/YEG33HsLEaIAAAAC/parksandrec-oops.gif";
        };
      };
    };
  };
}
