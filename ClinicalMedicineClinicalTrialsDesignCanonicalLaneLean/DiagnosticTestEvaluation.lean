import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure DiagnosticTest where
  goldStandard : Prop
  sensitivity : Rat
  specificity : Rat
  positivePredictiveValue : Rat
  negativePredictiveValue : Rat
  preTestProbability : Rat

structure DiagnosticTestEvidence (D : DiagnosticTest) where
  sensitivityClosed : D.sensitivity ≥ 0 ∧ D.sensitivity ≤ 1
  specificityClosed : D.specificity ≥ 0 ∧ D.specificity ≤ 1
  positivePredictiveValueClosed : D.positivePredictiveValue ∈ Finset.Icc 0 1
  negativePredictiveValueClosed : D.negativePredictiveValue ∈ Finset.Icc 0 1
  preTestProbabilityClosed : D.preTestProbability ≥ 0 ∧ D.preTestProbability ≤ 1

def DiagnosticTestClosed (D : DiagnosticTest) : Prop :=
  (D.sensitivity ≥ 0 ∧ D.sensitivity ≤ 1) ∧
  (D.specificity ≥ 0 ∧ D.specificity ≤ 1) ∧
  (D.positivePredictiveValue ≥ 0 ∧ D.positivePredictiveValue ≤ 1) ∧
  (D.negativePredictiveValue ≥ 0 ∧ D.negativePredictiveValue ≤ 1) ∧
  (D.preTestProbability ≥ 0 ∧ D.preTestProbability ≤ 1)

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTest)
    (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  have h1 : D.sensitivity ≥ 0 ∧ D.sensitivity ≤ 1 := E.sensitivityClosed
  have h2 : D.specificity ≥ 0 ∧ D.specificity ≤ 1 := E.specificityClosed
  have h3 : D.positivePredictiveValue ≥ 0 ∧ D.positivePredictiveValue ≤ 1 := by
    have mem := E.positivePredictiveValueClosed
    rcases Finset.mem_Icc.mp mem with ⟨hleft, hright⟩; exact ⟨hleft, hright⟩
  have h4 : D.negativePredictiveValue ≥ 0 ∧ D.negativePredictiveValue ≤ 1 := by
    have mem := E.negativePredictiveValueClosed
    rcases Finset.mem_Icc.mp mem with ⟨hleft, hright⟩; exact ⟨hleft, hright⟩
  have h5 : D.preTestProbability ≥ 0 ∧ D.preTestProbability ≤ 1 := E.preTestProbabilityClosed
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 h5)))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse