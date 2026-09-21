{
  pkgs,
  inputs,
  ...
}:
{
  fonts.packages = with pkgs; [
    adwaita-fonts
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    noto-fonts-monochrome-emoji
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    nerd-fonts.symbols-only
    nerd-fonts.caskaydia-mono
    carlito
    terminus_font
    inconsolata
    font-awesome
    liberation_ttf
    dejavu_fonts
    unifont
    unifont_upper
    times-newer-roman
    google-fonts
  ];

  services = {
    gvfs.enable = true;
    flatpak.enable = true;
    xserver.enable = true;
    printing.enable = true;
    udisks2.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    cloudflare-warp.enable = true;
  };

  programs = {
    nix-ld = {
      enable = true;
      libraries = with pkgs; [
        stdenv.cc.cc
        util-linux
        glib
        dbus
        krb5
        zlib
        zstd
        mesa
        libGL
        libglvnd
        freetype
        fontconfig
        cairo
        gdk-pixbuf
        pango
        harfbuzz
        libpng
        expat
        gtk3
        atk
        at-spi2-atk
        webkitgtk_4_1
        libsoup_3
        icu
        nspr
        nss
        kdePackages.qtbase
        kdePackages.qttools
        kdePackages.qtwayland
        kdePackages.qtsvg
        kdePackages.qtimageformats
        libxkbcommon
        libX11
        libXext
        libXrandr
        libXrender
        libXcursor
        libXxf86vm
        libXi
        libXfixes
        libxcb
        libxcb-util
        libxcb-keysyms
        libxcb-wm
        libxcb-image
        libxcb-render-util
        xcb-util-cursor
        libxcb-cursor
      ];
    };

    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs =
          pkgs: with pkgs; [
            libpng
            libpng12
            libepoxy
            pcre2
            double-conversion
            webkitgtk_4_1
            libsoup_3
            zstd
          ];
      };
    };

    obs-studio.enableVirtualCamera = true;

    niri.enable = true;
    niri.useNautilus = false;
    kdeconnect.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${pkgs.system}.default
    vscodium
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.pano-scrobbler-flake.packages.${system}.default
    matugen
    chromium
    teamspeak6-client
    proton-authenticator
    cataclysm-dda
    aria2
    #flameshot
    bibata-cursors
    colloid-icon-theme
    qbittorrent-enhanced
    bitwarden-desktop
    throne
    dialect
    mission-center
    #gnome-disk-utility
    pavucontrol # PulseAudio Volume Control
    brightnessctl # Brightness control for laptop
    crosspipe # Прокидка звука в другие источники pipewire
    gparted # Форматирование дисков
    localsend # Кидать файлы
    pear-desktop
    spotify
    spotiflac
    micro # Terminal text editor
    parabolic # Frontend yt-dlp
    #qdiskinfo # Disk info
    #kdiskmark
    waypaper # Wallpaper
    gnome-calculator # Calculator
    gpu-screen-recorder-gtk # Fast record video
    bazaar # Check Flatpaks
    telegram-desktop
    darktable
    samira
    imgbrd-grabber
    polkit_gnome
    kdePackages.okular
    kdePackages.kdenlive # Видеоредактор
    kdePackages.dolphin
    haruna
    openssl
    wget
    curl
    git
    gh
    yt-dlp # Скачивать и смотреть медиа с разных сайтов
    wl-clipboard
    cliphist
    trash-cli
    android-tools # ADB
    adb-sync
    v4l-utils
    ntfs3g
    ffmpeg_7 # Обработка видео. Нужен всегда и везде как зависимость
    svt-av1 # Кодек для рендера в av1 на проце
    imagemagick # Обработка изображений. Мб тоже нужен всегда
    vips # В 4 раза быстрее imagemagick?
    tree # Структура файлов в терминале
    gnugrep # Поиск в терминале
    rsync # Синхронизация файлов
    bat # Аналог cat с подсветкой синтаксиса
    xrandr # Управление мониторами
    xdg-utils # Set of command line tools that assist applications with a variety of desktop integration tasks
    playerctl # Управление медиа. Плей/пауза и тд
    mediainfo # Info fow FLAC
    amdgpu_top # Tool to display AMD GPU usage
    btop-rocm # Монитор ресурсов в терминале
    nvtopPackages.amd
    icoextract
    rocmPackages.rocm-smi # Чтоб в btop было gpu
    rocmPackages.rocblas # Для работы hip?
    rocmPackages.hipblas # Для работы hip?
    rocmPackages.clr # Для работы hip?
    rocmPackages.rocm-core
    rocmPackages.rocminfo
    timer # A "sleep" with progress. Таймер на пельмени "timer 5m"
    fzf # Нечёткий поиск
    killall # Убить процессы. Мем, что в стоке не стоит
    libnotify # Вызов оповещений через "notify-send"
    gallery-dl # Качать много картинок с кучи разных сайтов
    ddcutil # Прикол для управление яркости моего моника
    ddcutil-service # Прикол для управление яркости моего моника
    lm_sensors # Сенсоры
    grim
    slurp
    miller # Like awk, sed, cut, join, and sort for data formats such as CSV, TSV, JSON, JSON Lines, and positionally-indexed
    usbutils # lsusb
    f2fs-tools # f2fs filesystem
    exfat # exFAT filesystem
    xwayland-satellite # Для нири
    xwayland # Для нири
    udiskie
    duf # Место
    eza # Replace for ls
    ncdu # Disk usage analyzer
    man # Documentation
    tldr # Documentation
    wev # Event viewer
    ripdrag # Drag and drop
    gpu-screen-recorder
    microfetch # I use nixos btw
    fastfetch
    nix-melt
    nur.repos.zerozawa.mikusays
    xhost
    scrcpy
    opus-tools
    chafa
    wooz
    mpvpaper
    libreoffice-fresh # Редактировать документы
    onlyoffice-desktopeditors
    hunspell # Проверка орфографии для libreoffice
    hunspellDicts.ru_RU # Словарь для проверки орфографии
    hunspellDicts.en_US # Словарь для проверки орфографии
    hunspellDicts.uk_UA # EСловарь для проверки орфографии
    yazi # Terminal File manager
    ffmpegthumbnailer # A lightweight video thumbnailer
    kdePackages.kimageformats # Image format plugins for Qt 6
    kdePackages.qtimageformats # Plugins for additional image formats: TIFF, MNG, TGA, WBMP
    kdePackages.qtsvg # SVG support
    kdePackages.karchive # Plugin for Krita and OpenRaster images
    webp-pixbuf-loader # .webp support (what's this?)
    gdk-pixbuf.dev # Library for image loading and manipulation
    libwebp # .webp support
    libavif # AVIF format support
    libheif # HEIF format support
    libgsf # .odf support
    libjxl # JPEG-XL format support
    libraw # RAW format support
    librsvg # Small library to render SVG images to Cairo surfaces
    jxrlib # JPEG XR image support
    poppler # PDF support
    freetype # Font rendering engine
    imath # EXR format support
    openexr # High dynamic-range (HDR) image file format
    tauon # Музыкальный плееер
    rhythmbox # Музыкальный плееер
    picard # Массовый редактор метаданных музыки
    mousai # Опенсорс шазам. Со временем просит платный api
    mpv # Смотреть видео
    feh # Нужен в большом количестве софта как зависимость. Может в avif, но криво
    loupe
    krita # Рисовать
    #gimp
    obsidian # Заметки
    neovim
    vim
    adwaita-icon-theme
    adwaita-qt
    adwaita-qt6
    papirus-icon-theme
    material-icons
    glslang
    spirv-cross
    spirv-headers
    spirv-tools
    vulkan-extension-layer
    vulkan-headers
    vulkan-loader
    vulkan-tools
    vulkan-tools-lunarg
    vulkan-utility-libraries
    vulkan-validation-layers
    vkdisplayinfo
    vk-bootstrap
    dxvk # Чтоб wine игры запускались через vulkan, а не opengl (Direct3D 8/9/10/11)
    vkd3d # Чтоб wine игры запускались через vulkan, а не opengl (Direct3D 12)
    vkd3d-proton
    fontconfig
    zlib
    libva-utils # Проверяет работоспособность VAAPI?
    clinfo # Проверяет работоспособность OpenCL?
    pamixer # PulseAudio cli (громкость редачу)
    droidcam
    cargo
    cmake
    go
    python313
    glib
    nixd
    nil
    nodejs
    protols # LSP
    protobuf
    protoc-gen-go
    protoc-gen-go-grpc
    v2ray # VPN
    xray # VPN
    sing-box # VPN
    lmstudio # Local AP
    #ventoy-full-gtk
    zip # Архивировать
    file-roller # Архиватор от gnome
    unzip # Разархивировать
    unrar # Разархивировать
    gnutar # Для .tar?
    p7zip # Это пакет для 7z?
    bzip2 # .bz2 архивы
    unar
    #peazip
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-gtk3-1.1.12"
    "electron-39.8.10"
  ];
}
