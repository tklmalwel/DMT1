/-
a and b are types and are always passing types into the function of and
paramentricly polymorphic function
-/
#check And
/-
Introducing Prob
pay attention to (α : Type u) (β : Type v) : Type
the two arguments are anytypes and the result is also a type
-/
#check Prod
/-
How to define your own data types in lean
Below is the definition of And

structure And (a b : Prop) : Prop where
  intro ::
  left : a
  right : b

You can code it by putting it into a namespace and tweak it how you want
And itsekt is not the type
It takes two types and makes another
-/
namespace MyAnd
structure And (a b : Prop) : Prop where
  intro ::
  left : a
  right : b

axiom P : prop
axiom Q : Prop

def aProof : And P Q := And.intro _ _

#check And.left aProof
#check And.right aProof
end MyAnd

/-
And now the code for Prof another parametrically polymorphic function

structure Prod (α : Type u) (β : Type v) where
  mk ::
  fst : α
  snd : β
-/

namespace MyProd
structure Prod (α : Type u) (β : Type v) where
  mk ::
  fst : α
  snd : β

#check (Prod)
#check Prod Bool String --The type of this expresion is a type

def aProd : Prod Bool String := Prod.mk true "I love this stuff!"
#eval aProd
#check Prod.swap_prod_mk

#eval Prod.fst aProd
#eval Prod.snd aProd
end MyProd

/-
Curry Howard Isomorphism
AI Prompt For it
In short "Propositions are types, and proofs are programs."
A logical proposition corresponds to a type in a programming lang and a proof of that prop corresponds to a program

For each of the logical conectives there is a computation relation or correspondance
-/

namespace MyFuncs

def S : Type := String
def T : Type := Bool

#check S
#check T

#check S -> T

def aFunc : String -> Bool :=
  fun (s : String) => false

def aFunc2 : String -> Bool :=
  fun (s : String)=> true

def x : Nat := 3
def y : Nat := 5
def z : Nat := 2

#check ∀ (s : S), T

def aFunc3 : ∀ (s : String), Bool := λ (s : String) => false

end MyFuncs

/-
In the world of cimputation the values of the types you choose matter

The difference between Props and  Types

In the world of type the values actually matter
In the world of prop any proof is good enough as long as it proves the prop

Looking at Or
Logical Or means at least one of two
For type Sum is what corresponds to logical Or

def for Bool
inductive Bool : Type where
  | false : Bool
  | true : Bool

Or is a polymorphic type oraa type building
-/

namespace MyOr

#check Bool

inductive Bool : Type where
  | false : Bool
  | true : Bool

def b1 : Bool := Bool.true
def b2 : Bool := Bool.false

#check Or

axiom P : Prop
axiom Q : Prop
axiom p : P
axiom q : Q

#check Or P Q

theorem pfPorQ : P ∨ Q :=
  Or.inl p

theorem pfPorQ2 : P ∨ Q :=
  Or.inr q

inductive Or (a b : Prop) : Prop where
  | inl (h : a) : Or a b
  | inr (h : b) : Or a b

def zeroEqZero : 0 = 0 := rfl


end MyOr

theorem aThm : 0 = 0 ∨ 0 = 1 :=
(
  let pfZeZ : 0 = 0 := rfl
  Or.inl pfZeZ
)
