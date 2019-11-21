with import <nixpkgs> {};
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    expect
    sbcl
    lispPackages.quicklisp
    readline
  ];
}
