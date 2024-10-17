{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Algiers";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bilel = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
      "networkmanager"
    ];
  };

  # Programs
  programs = {
    hyprland.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    virt-manager.enable = true;
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Hardware
  hardware = {
    bluetooth.enable = true;
    opengl.enable = true;
  };

  # Portal Configuration
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
    ];
  };

  # Virtualisation
  virtualisation.libvirtd.enable = true;

  # Services
  services = {
    blueman.enable = true;
    dbus.enable = true;
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    emacs = {
      enable = true;
      package = pkgs.emacs29-gtk3;
    };
    flatpak.enable = true;
    openssh.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    postgresql = {
      enable = true;
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
  };

  # Security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # Allow unfree and insecure packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowInsecure = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  # Fonts
  fonts.packages = with pkgs; [
    ubuntu_font_family
    amiri
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra
    fira
    fira-go
    geist-font
    montserrat
    corefonts
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "CodeNewRoman"
        "FantasqueSansMono"
        "Meslo"
        "SpaceMono"
        "FiraCode"
        "GeistMono"
        "Hack"
        "CommitMono"
        "Iosevka"
        "JetBrainsMono"
        "Recursive"
        "Lilex"
        "Hasklig"
        "MPlus"
        "Mononoki"
        "Monofur"
        "RobotoMono"
        "VictorMono"
        "UbuntuMono"
      ];
    })
  ];

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [

    # Tools
    curl
    wget
    psmisc
    unrar
    unzip
    zip
    p7zip
    lxde.lxsession
    libnotify
    libsecret
    eza
    bat
    ripgrep
    killall
    ffmpeg
    qemu_full
    tree-sitter
    appimage-run
    tree
    linux-firmware
    alsa-firmware
    alsa-ucm-conf
    yt-dlp
    sof-firmware

    # Terminals
    kitty
    wezterm
    foot

    # Text editors
    vscode-fhs
    vim
    neovim

    # Programming
    gh
    gitFull
    go
    jdk
    kotlin
    dart
    flutter
    bun
    deno
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    nodePackages.typescript-language-server
    nodePackages.yarn
    typescript
    cargo
    rustc
    ruby
    gcc
    cmake
    gnumake
    php
    php82Packages.composer
    mysql
    sqlite
    python3Full
    python311Packages.pip
    python311Packages.pipx
    gleam
    zig

    # TUI apps
    lazygit
    fastfetch
    cmatrix
    htop
    lolcat
    toilet
    figlet
    tty-clock
    cava
    pulsemixer
    lynx
    yazi
    rtorrent

    # GUI apps
    bitwarden
    discord
    figma-linux
    davinci-resolve
    gimp
    inkscape
    obs-studio
    postman
    mcomix
    spotify
    deluge-gtk

    # Internet
    firefox
    brave
    chromium
    thunderbird
    arc-browser

    # Office
    libreoffice
    grim
    slurp
    zathura

    # Media
    imv
    mpv
    swww

    # Window manager tools
    fuzzel
    mako
    ydotool
    wl-clipboard
    networkmanagerapplet
    nwg-look
    waybar
    brightnessctl

  ];

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05";

  # Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
