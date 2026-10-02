{
  lib,
  rustPlatform,
  fetchFromGitHub,
  makeWrapper,
  grim,
  slurp,
  tesseract,
  quickshell,
}:

rustPlatform.buildRustPackage rec {
  pname = "lipa";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "satix-one";
    repo = "lipa";
    rev = "v${version}";
    hash = "sha256-cTD27zMpAi8f8yohVUIVYLjpTzGRzREbqUyDSUmGZOI=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
  };

  postPatch = ''
    cp ${./Cargo.lock} Cargo.lock
  '';

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [
    grim
    slurp
    tesseract
    quickshell
  ];

  postInstall = ''
    mkdir -p $out/share/lipa
    cp lipa.qml $out/share/lipa/

    wrapProgram $out/bin/lipa \
      --prefix PATH : ${
        lib.makeBinPath [
          grim
          slurp
          tesseract
          quickshell
        ]
      } \
      --run "mkdir -p \"\$HOME/.config/lipa\" && ln -sfn $out/share/lipa/lipa.qml \"\$HOME/.config/lipa/lipa.qml\""
  '';

  meta = with lib; {
    description = "Wayland screen translation tool using Quickshell";
    homepage = "https://github.com/satix-one/lipa";
    license = licenses.mit;
    platforms = platforms.linux;
    mainProgram = "lipa";
  };
}
