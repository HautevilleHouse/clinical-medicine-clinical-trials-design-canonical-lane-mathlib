import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure AdverseEventData where
  adverseEventList : List String
  severityGrading : Prop
  causalityAssessment : Prop
  reportingPeriod : Rat
  seriousAdverseEventCount : Nat

structure AdverseEventEvidence (A : AdverseEventData) where
  adverseEventListClosed : A.adverseEventList.length > 0
  severityGradingClosed : A.severityGrading
  causalityAssessmentClosed : A.causalityAssessment
  reportingPeriodClosed : A.reportingPeriod > 0
  seriousAdverseEventCountClosed : A.seriousAdverseEventCount ≥ 0

def AdverseEventClosed (A : AdverseEventData) : Prop :=
  A.adverseEventList.length > 0 ∧ A.severityGrading ∧ A.causalityAssessment ∧
  A.reportingPeriod > 0 ∧ A.seriousAdverseEventCount ≥ 0

theorem adverse_event_closed_from_evidence (A : AdverseEventData)
    (E : AdverseEventEvidence A) : AdverseEventClosed A := by
  exact And.intro E.adverseEventListClosed
    (And.intro E.severityGradingClosed
      (And.intro E.causalityAssessmentClosed
        (And.intro E.reportingPeriodClosed E.seriousAdverseEventCountClosed)))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse