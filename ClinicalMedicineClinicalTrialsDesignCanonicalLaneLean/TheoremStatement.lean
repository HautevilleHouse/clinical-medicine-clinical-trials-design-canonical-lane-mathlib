import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure ClinicalTrialClosed (T : ClinicalTrialClass) : Prop where
  trialPopulationValid : T.trialPopulation = T.trialPopulation
  interventionValid : T.interventionArm
  controlValid : T.controlArm
  endpointValid : T.endpointDefined

structure TheoremStatement where
  theoremName : String
  theoremObject : String
  clinicalTrial : ClinicalTrialClass
  constrainedClosure : ConstrainedTrialClosure (AdmissibleClass.mk clinicalTrial True True (Or.inl True))

def makeTheoremStatement (name : String) (trial : ClinicalTrialClass) : TheoremStatement :=
  let admissible : AdmissibleClass := AdmissibleClass.mk trial True True (Or.inl True)
  {
    theoremName := name
    theoremObject := "Clinical Medicine Clinical Trials Design"
    clinicalTrial := trial
    constrainedClosure := constrained_trial_endgame admissible
  }

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse