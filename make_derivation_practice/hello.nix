#/*  let
#   b = a + 1;
#   c = a + b;
#   a = 1;
#in { d=c; f=a; w=b; } */
#
#/* rec {
#   b = a+1;
#   c = a+b;
#   a = 1;
#} */
#
#
#/* let
#   attrset = { a = { b = { c = 1; x = 4; d="hii"; }; }; };
#in
#[
#{
#   j = attrset.a.b.c + attrset.a.b.x;
#   l = with attrset.a; b.x - b.c;
#}
#{
#   inherit (attrset.a.b) x c;
#   k = "hello ${builtins.toString attrset.a.b.c} ${attrset.a.b.d}";
#}] */
#
#/* args@{a, b, ...}: a + b + args.c */
#
#/* let
#   f = x: x.a;
#in f {a = 5; } */
#
#/* (x: x+1) 1 */
#
#/* a: a+5 */ /* nix repl->import ./hello.nix 5 */


	
/* ----- Packaging existing software with nix ------ */
{stdenv, fetchzip}:
stdenv.mkDerivation {
  name = "first derivation";
  version = "0.0.1";
  src = fetchzip {
    url = "https://ftp.gnu.org/gnu/hello/hello-2.12.1.tar.gz";
    sha256 = "sha256-1kJjhtlsAkpNB7f6tZEs+dbKd8z7KoNHyDHEJ0tmhnc=";
  };
}