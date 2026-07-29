import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure CompartmentPharmacokineticsPackage where
  numCompartment : Nat
  drugMass : Type u
  volumeDistribution : Type v
  eliminationRate : Type w
  absorptionRate : Type x
  linearKinetics : Prop
  compartmentModel : Prop
  firstOrderAbsorption : Prop
  eliminationHalfLife : Prop

structure CompartmentPharmacokineticsEvidence (D : CompartmentPharmacokineticsPackage) where
  compartmentModelClosed : D.compartmentModel
  linearKineticsClosed : D.linearKinetics
  firstOrderAbsorptionClosed : D.firstOrderAbsorption
  eliminationHalfLifeClosed : D.eliminationHalfLife

def CompartmentPharmacokineticsClosed (D : CompartmentPharmacokineticsPackage) : Prop :=
  D.compartmentModel ∧ D.linearKinetics ∧ D.firstOrderAbsorption ∧ D.eliminationHalfLife

theorem compartment_pharmacokinetics_closed_from_evidence (D : CompartmentPharmacokineticsPackage) (E : CompartmentPharmacokineticsEvidence D) : CompartmentPharmacokineticsClosed D := by
  exact And.intro E.compartmentModelClosed (And.intro E.linearKineticsClosed (And.intro E.firstOrderAbsorptionClosed E.eliminationHalfLifeClosed))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse