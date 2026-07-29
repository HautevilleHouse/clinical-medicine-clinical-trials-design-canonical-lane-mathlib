import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure RandomizationBlindingPackage where
  randomAllocationSequence : Prop
  allocationConcealment : Prop
  blindingMethod : Prop
  doubleBlinding : Prop
  placeboControl : Prop
  randomAllocation : Prop
  blindingImplementation : Prop

structure RandomizationBlindingEvidence (R : RandomizationBlindingPackage) where
  randomAllocationClosed : R.randomAllocation
  allocationConcealmentClosed : R.allocationConcealment
  blindingMethodClosed : R.blindingMethod
  doubleBlindingClosed : R.doubleBlinding

def RandomizationBlindingClosed (R : RandomizationBlindingPackage) : Prop :=
  R.randomAllocation ∧ R.allocationConcealment ∧ R.blindingMethod ∧ R.doubleBlinding

theorem randomization_blinding_closed_from_evidence (R : RandomizationBlindingPackage) (E : RandomizationBlindingEvidence R) : RandomizationBlindingClosed R := by
  exact And.intro E.randomAllocationClosed (And.intro E.allocationConcealmentClosed (And.intro E.blindingMethodClosed E.doubleBlindingClosed))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse