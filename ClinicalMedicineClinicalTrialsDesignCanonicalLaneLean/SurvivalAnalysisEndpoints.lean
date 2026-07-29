import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure SurvivalAnalysisEndpoints where
  medianSurvival : ℝ
  hazardRatio : ℝ
  censoringRate : ℝ
  logRankPValue : ℝ
  proportionalHazards : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisEndpoints) where
  medianSurvivalClosed : S.medianSurvival > 0
  hazardRatioClosed : S.hazardRatio < 1.0
  logRankPValueClosed : S.logRankPValue < 0.05
  proportionalHazardsClosed : S.proportionalHazards

def SurvivalAnalysisClosed (S : SurvivalAnalysisEndpoints) : Prop :=
  S.medianSurvival > 0 ∧ S.hazardRatio < 1.0 ∧ S.logRankPValue < 0.05

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisEndpoints) (E : SurvivalAnalysisEvidence S) :
    SurvivalAnalysisClosed S := by
  exact And.intro E.medianSurvivalClosed (And.intro E.hazardRatioClosed E.logRankPValueClosed)

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse