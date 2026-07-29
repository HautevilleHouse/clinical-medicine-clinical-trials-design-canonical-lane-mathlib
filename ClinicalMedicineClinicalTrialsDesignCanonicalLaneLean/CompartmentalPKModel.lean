import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure CompartmentalPKModel where
  compartments : Nat
  volumeOfDistribution : ℝ → ℝ
  clearance : ℝ
  absorptionRate : ℝ
  initialDose : ℝ
  linearDynamics : Prop

structure PKModelEvidence (M : CompartmentalPKModel) where
  volumePositive : ∀ t, M.volumeOfDistribution t > 0
  clearancePositive : M.clearance > 0
  absorptionRateNonnegative : M.absorptionRate ≥ 0
  linearDynamicsClosed : M.linearDynamics

def PKModelClosed (M : CompartmentalPKModel) : Prop :=
  M.linearDynamics ∧ M.clearance > 0

theorem pk_model_closed_from_evidence (M : CompartmentalPKModel) (E : PKModelEvidence M) :
    PKModelClosed M := by
  exact And.intro E.linearDynamicsClosed E.clearancePositive

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse