with import <nixpkgs> {};

#{ stdenv, fetchFromGitHub, kernel }:

assert stdenv.lib.versionAtLeast linuxPackages.kernel.version "3.5";

stdenv.mkDerivation rec {
  name = "digimend";
  pname = "digimend";
  version = "9";

  src = fetchFromGitHub {
    owner = "DIGImend";
    repo = "digimend-kernel-drivers";
    rev = "v${version}";
    sha256 = "0zh0nxzaimrd81dm1j0d78jdpf1njj3x92sf5jizgcqvfh2gawbj";
  };

  postPatch = ''
    substituteInPlace Makefile \
        --replace "/usr/share" "/share"
  '';

  INSTALL_MOD_PATH = "\${out}";

  #nativeBuildInputs = [ which kmod ];

  #buildInputs = linuxPackages.kernel.moduleBuildDependencies;

  makeFlags = [
    "KDIR=${linuxPackages.kernel.dev}/lib/modules/${linuxPackages.kernel.modDirVersion}/build"
    "DESTDIR=$(out)"
  ];

  installPhase = ''
    # upstream install target also runs udevadm and depmod, which we don't want
    make $makeFlags 
    make $makeFlags modules_install udev_rules_install depmod_conf_install xorg_conf_install
    #modprobe -r hid-kye hid-uclogic hid-polostar hid-viewsonic
  '';
}
