import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse