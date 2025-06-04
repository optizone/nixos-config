{
  stdenv,
  lib,
  fetchFromGitHub,
  kernel,
  kmod,
}:

stdenv.mkDerivation {
  name = "goodix-gt7868q";
  pname = "goodix-gt7868q";

  src = fetchFromGitHub {
    owner = "ty2";
    repo = "goodix-gt7868q-linux-driver";
    rev = "62f0d1898599c151a8245bc2fb7a7dcf931863b4";
    hash = "sha256-WukC3iK05eRmr/EalH75E4Y9dxOU2LIl2jtBB4lw1fg=";
  };
  patches = [ ./patch.patch ];

  installPhase = ''
    	install -Dm644 dkms/dkms.conf $out/goodix-gt7868q-62f0d1898599c151a8245bc2fb7a7dcf931863b4/dkms.conf
    	cp -r . $out/goodix-gt7868q-62f0d1898599c151a8245bc2fb7a7dcf931863b4
  '';

  hardeningDisable = [
    "pic"
    "format"
  ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KVERSION=${kernel.modDirVersion}"
    "KERNEL_DIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}"
  ];
}
