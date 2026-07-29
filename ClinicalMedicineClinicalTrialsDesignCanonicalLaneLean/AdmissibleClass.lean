import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure ClinicalAdmittedObject where
  trialData : String
  endpointStatement : Prop

structure AdmissibleClass where
  object : ClinicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∧ (A.object.endpointStatement → A.endpointSatisfied)

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse