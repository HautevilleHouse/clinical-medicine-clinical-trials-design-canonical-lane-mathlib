import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure ClinicalEndpoint where
  endpointName : String
  primaryEndpoint : Prop
  secondaryEndpoint : Prop
  timeFrame : Rat
  clinicallyMeaningful : Prop

structure EndpointEvidence (E : ClinicalEndpoint) where
  primaryEndpointClosed : E.primaryEndpoint
  secondaryEndpointClosed : E.secondaryEndpoint
  timeFrameClosed : E.timeFrame > 0
  clinicallyMeaningfulClosed : E.clinicallyMeaningful

def EndpointClosed (E : ClinicalEndpoint) : Prop :=
  E.primaryEndpoint ∧ E.secondaryEndpoint ∧ E.timeFrame > 0 ∧ E.clinicallyMeaningful

theorem endpoint_closed_from_evidence (E : ClinicalEndpoint)
    (Ev : EndpointEvidence E) : EndpointClosed E := by
  exact And.intro Ev.primaryEndpointClosed
    (And.intro Ev.secondaryEndpointClosed
      (And.intro Ev.timeFrameClosed Ev.clinicallyMeaningfulClosed))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse