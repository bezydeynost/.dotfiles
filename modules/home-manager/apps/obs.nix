{ pkgs, ... }: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs # Allows you to screen capture on wlroots based wayland compositors
      obs-vkcapture # Linux Vulkan/OpenGL game capture
      obs-vaapi # VAAPI support via GStreamer. FFMPEG VAAPI implementation shows performance bottlenecks on some AMD hardware.
      obs-pipewire-audio-capture # Capture using PipeWire (разве этого нет в сток обс?)
      obs-mute-filter # Mute audio of a source
      #obs-multi-rtmp # Multi-site simultaneous broadcast. Имба? Рестрим локальный?
      #obs-composite-blur # Блюрить порнуху https://github.com/FiniteSingularity/obs-composite-blur
      #obs-backgroundremoval # Удалить или заблюрить фон на вебке
      #input-overlay # Show keyboard, gamepad and mouse input on stream
      droidcam-obs # Use your phone as a camera directly in OBS Studio https://droidcam.app/obs/
    ];
  };

  # home.file."config?".source = ./config?; # Мб потом добавлю конфиги obs сюда
}
