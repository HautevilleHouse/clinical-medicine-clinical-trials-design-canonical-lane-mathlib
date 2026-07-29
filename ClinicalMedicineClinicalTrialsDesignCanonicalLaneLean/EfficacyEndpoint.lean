import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure EfficacyEndpointPackage where
  primaryEndpoint : Prop
  secondaryEndpoint : Prop
  compositeEndpoint : Prop
  surrogateEndpoint : Prop
  responderAnalysis : Prop
  timeToEvent : Prop
  endpointDefinition : Prop

structure EfficacyEndpointEvidence (E : EfficacyEndpointPackage) where
  primaryEndpointClosed : E.primaryEndpoint
  secondaryEndpointClosed : E.secondaryEndpoint
  compositeEndpointClosed : E.compositeEndpoint
  responderAnalysisClosed : E.responderAnalysis

def EfficacyEndpointClosed (E : EfficacyEndpointPackage) : Prop :=
  E.primaryEndpoint ∧ E.secondaryEndpoint ∧ E.compositeEndpoint ∧ E.responderAnalysis

theorem efficacy_endpoint_closed_from_evidence (E : EfficacyEndpointPackage) (Ev : EfficacyEndpointEvidence E) : EfficacyEndpointClosed E := by
  exact And.intro Ev.primaryEndpointClosed (And.intro Ev.secondaryEndpointClosed (And.intro Ev.compositeEndpointClosed Ev.responderAnalysisClosed))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse