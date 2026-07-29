import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure ClinicalTrialAdmissibleClass where
  object : AdmittedObject
  treatmentEffectSignificant : Prop
  safetyProfileAcceptable : Prop
  dataIntegrityConfirmed : Prop
  gateWitness : treatmentEffectSignificant ∨ safetyProfileAcceptable

def clinical_trial_admissible_closure (A : ClinicalTrialAdmissibleClass) : Prop :=
  bridgeClosed A.object ∧ (A.treatmentEffectSignificant ∨ A.safetyProfileAcceptable)

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse