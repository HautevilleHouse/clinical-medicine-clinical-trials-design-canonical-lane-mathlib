import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean.CompartmentModel

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure PharmacokineticModel extends CompartmentModel where
  drugMass : Nat -> Real
  clearanceRate : Real
  absorptionRate : Real
  dose : Real
  doseAdministered : Prop
  initialDrugMass : Nat -> Real
  initialDrugMassConsistent : ∀ i, initialDrugMass i = drugMass i 0

def PharmacokineticClosed (P : PharmacokineticModel) : Prop :=
  CompartmentModelClosed P.toCompartmentModel ∧ P.clearanceRate ≥ 0 ∧ P.absorptionRate ≥ 0 ∧ P.dose > 0

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse