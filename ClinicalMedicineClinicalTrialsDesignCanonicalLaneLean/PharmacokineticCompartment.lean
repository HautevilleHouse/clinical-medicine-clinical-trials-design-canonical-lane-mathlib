import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure PharmacokineticCompartmentPackage where
  volumeOfDistribution : Prop
  clearanceRate : Prop
  absorptionRate : Prop
  eliminationRate : Prop
  bioavailability : Prop
  doseInput : Prop

structure PharmacokineticCompartmentEvidence (P : PharmacokineticCompartmentPackage) where
  volumeOfDistributionClosed : P.volumeOfDistribution
  clearanceRateClosed : P.clearanceRate
  absorptionRateClosed : P.absorptionRate
  eliminationRateClosed : P.eliminationRate
  bioavailabilityClosed : P.bioavailability
  doseInputClosed : P.doseInput

def PharmacokineticCompartmentClosed (P : PharmacokineticCompartmentPackage) : Prop :=
  P.volumeOfDistribution ∧ P.clearanceRate ∧ P.absorptionRate ∧ P.eliminationRate ∧ P.bioavailability ∧ P.doseInput

theorem pharmacokinetic_compartment_closed_from_evidence (P : PharmacokineticCompartmentPackage) (E : PharmacokineticCompartmentEvidence P) : PharmacokineticCompartmentClosed P := by
  exact And.intro E.volumeOfDistributionClosed
    (And.intro E.clearanceRateClosed
      (And.intro E.absorptionRateClosed
        (And.intro E.eliminationRateClosed
          (And.intro E.bioavailabilityClosed E.doseInputClosed))))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse
