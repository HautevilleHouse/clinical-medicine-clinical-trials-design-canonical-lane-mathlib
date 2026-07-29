import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure DiagnosticInferencePackage where
  sensitivity : Prop
  specificity : Prop
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  likelihoodRatioPositive : Prop
  likelihoodRatioNegative : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  sensitivityClosed : D.sensitivity
  specificityClosed : D.specificity
  positivePredictiveValueClosed : D.positivePredictiveValue
  negativePredictiveValueClosed : D.negativePredictiveValue
  likelihoodRatioPositiveClosed : D.likelihoodRatioPositive
  likelihoodRatioNegativeClosed : D.likelihoodRatioNegative

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.sensitivity ∧ D.specificity ∧ D.positivePredictiveValue ∧ D.negativePredictiveValue ∧ D.likelihoodRatioPositive ∧ D.likelihoodRatioNegative

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage) (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.sensitivityClosed
    (And.intro E.specificityClosed
      (And.intro E.positivePredictiveValueClosed
        (And.intro E.negativePredictiveValueClosed
          (And.intro E.likelihoodRatioPositiveClosed E.likelihoodRatioNegativeClosed))))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse
