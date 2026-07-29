import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure AdaptiveDesignPackage where
  responseAdaptiveRandomization : Prop
  sampleSizeReEstimation : Prop
  interimAnalysis : Prop
  stoppingRule : Prop
  alphaSpendingFunction : Prop
  doseEscalationRule : Prop
  adaptationRule : Prop

structure AdaptiveDesignEvidence (A : AdaptiveDesignPackage) where
  responseAdaptiveRandomizationClosed : A.responseAdaptiveRandomization
  sampleSizeReEstimationClosed : A.sampleSizeReEstimation
  interimAnalysisClosed : A.interimAnalysis
  stoppingRuleClosed : A.stoppingRule

def AdaptiveDesignClosed (A : AdaptiveDesignPackage) : Prop :=
  A.responseAdaptiveRandomization ∧ A.sampleSizeReEstimation ∧ A.interimAnalysis ∧ A.stoppingRule

theorem adaptive_design_closed_from_evidence (A : AdaptiveDesignPackage) (E : AdaptiveDesignEvidence A) : AdaptiveDesignClosed A := by
  exact And.intro E.responseAdaptiveRandomizationClosed (And.intro E.sampleSizeReEstimationClosed (And.intro E.interimAnalysisClosed E.stoppingRuleClosed))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse