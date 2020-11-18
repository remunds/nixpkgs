{ stdenv, fetchFromGitHub, nodePackages, glib }:

stdenv.mkDerivation rec {
  pname = "pop-os-shell";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "pop-os";
    repo = "shell";
    rev =  "1.0.0";
    sha256 = "sha256-gv9knhG1/HOUsIyPWfBRBpJWg/bfRXbbg/x2QDgSmls=";
  };

  buildInputs = [ glib nodePackages.typescript ];


  uuid = "pop-shell@system76.com";

  makeFlags = [ "INSTALLBASE=$(out)/share/gnome-shell/extensions" ];

  meta = with stdenv.lib; {
    description = "Keyboard-driven layer for GNOME Shell which allows for quick and sensible navigation and management of windows";
    license = licenses.gpl3;
    homepage = "https://github.com/pop-os/shell";
    platforms = platforms.linux; 
    maintainers = with mainters; [ remunds ];
  };
}
