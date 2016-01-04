theory Nibbles
imports "~/hgs/isabelle-nunchaku/Nunchaku"
begin

datatype nib =
  N0
| N1
| N2
| N3
| N4
| N5
| N6
| N7
| N8
| N9
| Na
| Nb
| Nc
| Nd
| Ne
| Nf

fun inc :: "nib \<Rightarrow> nib" where
  "inc N0 = N1"
| "inc N1 = N2"
| "inc N2 = N3"
| "inc N3 = N4"
| "inc N4 = N5"
| "inc N5 = N6"
| "inc N6 = N7"
| "inc N7 = N7" (* wrong *)
| "inc N8 = N9"
| "inc N9 = Na"
| "inc Na = Nb"
| "inc Nb = Nc"
| "inc Nc = Nd"
| "inc Nd = Ne"
| "inc Ne = Nf"
| "inc Nf = N0"

datatype byte =
  Byte nib nib

fun map_nibs :: "(nib \<Rightarrow> nib) \<Rightarrow> byte \<Rightarrow> byte" where
  "map_nibs f (Byte m n) = Byte (f m) (f n)"

lemma "map_nibs inc b \<noteq> b"
nunchaku

end
