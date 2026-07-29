import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure DoseResponseBridge where
  doseLevels : List ℝ
  responseCurve : ℝ → ℝ
  effectSize : ℝ
  significanceLevel : ℝ
  monotonicity : Prop

structure DoseResponseEvidence (B : DoseResponseBridge) where
  effectSizeClosed : B.effectSize > 0
  significanceLevelClosed : B.significanceLevel < 0.05
  monotonicityClosed : B.monotonicity

def DoseResponseClosed (B : DoseResponseBridge) : Prop :=
  B.effectSize > 0 ∧ B.significanceLevel < 0.05

theorem dose_response_closed_from_evidence (B : DoseResponseBridge) (E : DoseResponseEvidence B) :
    DoseResponseClosed B := by
  exact And.intro E.effectSizeClosed E.significanceLevelClosed

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse