import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure DiagnosticTestAccuracy where
  sensitivity : ℝ
  specificity : ℝ
  positivePredictiveValue : ℝ
  negativePredictiveValue : ℝ
  rocAUC : ℝ

structure DiagnosticTestEvidence (D : DiagnosticTestAccuracy) where
  sensitivityHigh : D.sensitivity > 0.8
  specificityHigh : D.specificity > 0.8
  rocAUCHigh : D.rocAUC > 0.9

def DiagnosticTestClosed (D : DiagnosticTestAccuracy) : Prop :=
  D.sensitivity > 0.8 ∧ D.specificity > 0.8 ∧ D.rocAUC > 0.9

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestAccuracy) (E : DiagnosticTestEvidence D) :
    DiagnosticTestClosed D := by
  exact And.intro E.sensitivityHigh (And.intro E.specificityHigh E.rocAUCHigh)

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse