{ inputs, stdenv, package, utils, libT, ... }:
stdenv.mkDerivation {
  name = "itbuilds";
  src = ./.;
  doCheck = true;
  dontUnpack = true;
  buildPhase = ''
    mkdir -p $out
  '';
  checkPhase = let
    # you can define multiple test runs within a single test phase.
    # if you need a clean environment:
    # define 2 of these with different tests, and run them both in the check phase
    runpkgbash = libT.mkRunPkgTest {
      inherit package;
      testnames = {
        hello = true;
        lua_dir = true;
        pluginfile = true;
        afterplugin = true;
        test_libT_vars = true;
        nested_test = true;
        nixCats_fields = true;
        n2l_tests = true;
      };
    };
  in /*bash*/ ''
    ${runpkgbash}
  '';
}
