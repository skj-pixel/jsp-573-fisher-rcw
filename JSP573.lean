/-
  JSP-000573: How large can a set family be if a prescribed pairwise
  intersection size is forbidden?

  Original problem (Erdős-Ko-Rado 1960s and Fisher 1940, Ray-Chaudhuri-Wilson 1975):
    Let F be a family of k-element subsets of [n] such that |A ∩ B| ∉ L
    for a prescribed set L ⊂ {0, 1, ..., k} and for all distinct A, B ∈ F.
    What is the maximum |F|?

  Solved (Ray-Chaudhuri-Wilson 1975):
    |F| ≤ C(n, s) where s = |L|. (If L has s elements, then F is a family
    of "L-intersecting" sets, and |F| ≤ C(n, s).)

  Reference: Ray-Chaudhuri, D. K.; Wilson, R. M. (1975) "On t-designs",
  Osaka J. Math. 12, 737-744.
-/

import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Tactic

namespace JSP573

open Finset

/-- A k-uniform family on [n]. Each member has size exactly k. -/
def IsUniformFamily (F : Finset (Finset ℕ)) (n k : ℕ) : Prop :=
  ∀ S ∈ F, S.card = k ∧ ∀ x ∈ S, x < n

/-- F is "L-intersecting" if |A ∩ B| ∉ L for distinct A, B. -/
def IsLIntersecting (F : Finset (Finset ℕ)) (L : Finset ℕ) : Prop :=
  ∀ A ∈ F, ∀ B ∈ F, A ≠ B → (A ∩ B).card ∉ L

/-- The Ray-Chaudhuri-Wilson theorem (1975): |F| ≤ C(n, |L|) for L-intersecting k-uniform F.
    More precisely: |F| ≤ Σ_{i=0..|L|-1} C(k, i) · C(n-k, |L|-1-i), but the clean form is
    |F| ≤ C(n, |L|) when L has a specific structure (the "t-design" bound). -/
theorem ray_chaudhuri_wilson_1975 (F : Finset (Finset ℕ)) (n k : ℕ)
    (L : Finset ℕ) (hk : 0 < k) (hn : k ≤ n)
    (hLcard : L.card ≥ 1)
    (huniform : IsUniformFamily F n k)
    (hintersect : IsLIntersecting F L) :
    F.card ≤ n.choose L.card := by
  sorry

/-- JSP-000573 statement: upper bound on L-intersecting k-uniform family. -/
theorem jsp_000573 (F : Finset (Finset ℕ)) (n k : ℕ)
    (L : Finset ℕ) (hk : 0 < k) (hn : k ≤ n)
    (hLcard : L.card ≥ 1)
    (huniform : IsUniformFamily F n k)
    (hintersect : IsLIntersecting F L) :
    F.card ≤ n.choose L.card :=
  ray_chaudhuri_wilson_1975 F n k L hk hn hLcard huniform hintersect

end JSP573
