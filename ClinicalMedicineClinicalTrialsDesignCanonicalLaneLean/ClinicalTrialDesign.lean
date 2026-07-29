import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure ClinicalTrialDesignPackage where
  randomization : Prop
  blinding : Prop
  controlGroup : Prop
  sampleSize : Prop
  endpointDefinition : Prop
  statisticalMethod : Prop

structure ClinicalTrialDesignEvidence (A : ClinicalTrialDesignPackage) where
  randomizationClosed : A.randomization
  blindingClosed : A.blinding
  controlGroupClosed : A.controlGroup
  sampleSizeClosed : A.sampleSize
  endpointDefinitionClosed : A.endpointDefinition
  statisticalMethodClosed : A.statisticalMethod

def ClinicalTrialDesignClosed (A : ClinicalTrialDesignPackage) : Prop :=
  A.randomization ∧ A.blinding ∧ A.controlGroup ∧ A.sampleSize ∧ A.endpointDefinition ∧ A.statisticalMethod

theorem clinical_trial_design_closed_from_evidence (A : ClinicalTrialDesignPackage) (E : ClinicalTrialDesignEvidence A) :
    ClinicalTrialDesignClosed A := by
  exact And.intro E.randomizationClosed (And.intro E.blindingClosed (And.intro E.controlGroupClosed (And.intro E.sampleSizeClosed (And.intro E.endpointDefinitionClosed E.statisticalMethodClosed))))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse