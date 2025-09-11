def association : Prop :=
  ∀ (P Q R : Prop), P ∧ (Q ∧ R) -> (P ∧ Q) ∧ R

def pfAssociation : association :=
  fun ( P Q R : Prop) =>
  (
    fun (h : P ∧ (Q ∧ R)) =>
    (
      let p : P := h.left
      let q : Q := h.right.left
      let r : R := h.right.right
      let pq : P ∧ Q := And.intro p q
      And.intro pq r
    )
  )
