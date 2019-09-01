{ mkDerivation, base, bytestring, comonad, containers
, contravariant, criterion, hashable, mwc-random, primitive
, profunctors, semigroupoids, semigroups, stdenv, text
, transformers, unordered-containers, vector, vector-builder
}:
mkDerivation {
  pname = "foldl";
  version = "1.4.5";
  sha256 = "19qjmzc7gaxfwgqbgy0kq4vhbxvh3qjnwsxnc7pzwws2if5bv80b";
  revision = "3";
  editedCabalFile = "0ci6wq1lqmz0i5rlb4my21ic6ziq87kg35mkp3f9la9y32zbq600";
  libraryHaskellDepends = [
    base bytestring comonad containers contravariant hashable
    mwc-random primitive profunctors semigroupoids semigroups text
    transformers unordered-containers vector vector-builder
  ];
  benchmarkHaskellDepends = [ base criterion ];
  description = "Composable, streaming, and efficient left folds";
  license = stdenv.lib.licenses.bsd3;
}
