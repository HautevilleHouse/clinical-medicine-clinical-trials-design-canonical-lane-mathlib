import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure TrialDesignPackage where
  randomization : Prop
  blinding : Prop
  sampleSize : Prop
  primaryEndpoint : Prop
  secondaryEndpoints : Prop
  statisticalMethod : Prop

structure TrialDesignEvidence (T : TrialDesignPackage) where
  randomizationClosed : T.randomization
  blindingClosed : T.blinding
  sampleSizeClosed : T.sampleSize
  primaryEndpointClosed : T.primaryEndpoint
  secondaryEndpointsClosed : T.secondaryEndpoints
  statisticalMethodClosed : T.statisticalMethod

def TrialDesignClosed (T : TrialDesignPackage) : Prop :=
  T.randomization ∧ T.blinding ∧ T.sampleSize ∧ T.primaryEndpoint ∧ T.secondaryEndpoints ∧ T.statisticalMethod

theorem trial_design_closed_from_evidence (T : TrialDesignPackage) (E : TrialDesignEvidence T) : TrialDesignClosed T := by
  exact And.intro E.randomizationClosed
    (And.intro E.blindingClosed
      (And.intro E.sampleSizeClosed
        (And.intro E.primaryEndpointClosed
          (And.intro E.secondaryEndpointsClosed E.statisticalMethodClosed))))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse
