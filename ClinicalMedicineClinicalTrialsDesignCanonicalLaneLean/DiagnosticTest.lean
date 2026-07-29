import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure DiagnosticTestPackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatio : Prop

structure DiagnosticTestEvidence (A : DiagnosticTestPackage) where
  sensitivityClosed : A.sensitivity
  specificityClosed : A.specificity
  positivePredictiveValueClosed : A.positivePredictiveValue
  negativePredictiveValueClosed : A.negativePredictiveValue
  likelihoodRatioClosed : A.likelihoodRatio

def DiagnosticTestClosed (A : DiagnosticTestPackage) : Prop :=
  A.sensitivity ∧ A.specificity ∧ A.positivePredictiveValue ∧ A.negativePredictiveValue ∧ A.likelihoodRatio

theorem diagnostic_test_closed_from_evidence (A : DiagnosticTestPackage) (E : DiagnosticTestEvidence A) :
    DiagnosticTestClosed A := by
  exact And.intro E.sensitivityClosed (And.intro E.specificityClosed (And.intro E.positivePredictiveValueClosed (And.intro E.negativePredictiveValueClosed E.likelihoodRatioClosed)))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse