{ mkDerivation, ansi-wl-pprint, base, bytestring, process
, QuickCheck, stdenv, transformers, transformers-compat
}:
mkDerivation {
  pname = "optparse-applicative";
  version = "0.15.0.0";
  src = ./optparse-applicative-0.15.0.0;
  libraryHaskellDepends = [
    ansi-wl-pprint base process transformers transformers-compat
  ];
  testHaskellDepends = [ base bytestring QuickCheck ];
  homepage = "https://github.com/pcapriotti/optparse-applicative";
  description = "Utilities and combinators for parsing command line options";
  license = stdenv.lib.licenses.bsd3;
}
