import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure SafetyMonitoringPackage where
  adverseEventReporting : Prop
  seriousAdverseEvent : Prop
  safetyEndpoint : Prop
  dataSafetyMonitoringBoard : Prop
  stoppingRuleForToxicity : Prop
  adverseEventRate : Prop
  safetyDataMonitoring : Prop

structure SafetyMonitoringEvidence (S : SafetyMonitoringPackage) where
  adverseEventReportingClosed : S.adverseEventReporting
  seriousAdverseEventClosed : S.seriousAdverseEvent
  safetyEndpointClosed : S.safetyEndpoint
  stoppingRuleForToxicityClosed : S.stoppingRuleForToxicity

def SafetyMonitoringClosed (S : SafetyMonitoringPackage) : Prop :=
  S.adverseEventReporting ∧ S.seriousAdverseEvent ∧ S.safetyEndpoint ∧ S.stoppingRuleForToxicity

theorem safety_monitoring_closed_from_evidence (S : SafetyMonitoringPackage) (E : SafetyMonitoringEvidence S) : SafetyMonitoringClosed S := by
  exact And.intro E.adverseEventReportingClosed (And.intro E.seriousAdverseEventClosed (And.intro E.safetyEndpointClosed E.stoppingRuleForToxicityClosed))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse