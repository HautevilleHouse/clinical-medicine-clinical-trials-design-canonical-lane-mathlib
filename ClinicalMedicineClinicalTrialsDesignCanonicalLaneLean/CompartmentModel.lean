import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  compartmentLabels : List String
  transferRates : Nat -> Nat -> Real
  transferRatesNonnegative : ∀ i j, transferRates i j ≥ 0
  initialCondition : Nat -> Real

structure CompartmentModelEvidence (M : CompartmentModel) where
  compartmentsClosed : M.compartments > 0
  transferRatesNonnegativeClosed : M.transferRatesNonnegative
  initialConditionSumClosed : (∑ i, M.initialCondition i) = 1

def CompartmentModelClosed (M : CompartmentModel) : Prop :=
  M.compartments > 0 ∧ (∀ i j, M.transferRates i j ≥ 0) ∧ (∑ i, M.initialCondition i) = 1

theorem compartment_model_closed_from_evidence (M : CompartmentModel) (E : CompartmentModelEvidence M) : CompartmentModelClosed M := by
  exact And.intro E.compartmentsClosed (And.intro E.transferRatesNonnegativeClosed E.initialConditionSumClosed)

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse