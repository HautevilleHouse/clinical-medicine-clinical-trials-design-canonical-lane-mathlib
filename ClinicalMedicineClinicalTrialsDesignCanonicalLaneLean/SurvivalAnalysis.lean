import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure SurvivalAnalysisPackage where
  hazardFunction : Prop
  survivalCurve : Prop
  censoringMechanism : Prop
  proportionalHazards : Prop
  logRankTest : Prop
  coxRegression : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  hazardFunctionClosed : S.hazardFunction
  survivalCurveClosed : S.survivalCurve
  censoringMechanismClosed : S.censoringMechanism
  proportionalHazardsClosed : S.proportionalHazards
  logRankTestClosed : S.logRankTest
  coxRegressionClosed : S.coxRegression

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.hazardFunction ∧ S.survivalCurve ∧ S.censoringMechanism ∧ S.proportionalHazards ∧ S.logRankTest ∧ S.coxRegression

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.hazardFunctionClosed
    (And.intro E.survivalCurveClosed
      (And.intro E.censoringMechanismClosed
        (And.intro E.proportionalHazardsClosed
          (And.intro E.logRankTestClosed E.coxRegressionClosed))))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse
