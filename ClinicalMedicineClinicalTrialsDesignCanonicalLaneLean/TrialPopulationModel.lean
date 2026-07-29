import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

structure TrialPopulation where
  targetPopulation : Type u
  inclusionCriteria : Prop
  exclusionCriteria : Prop
  sampleSize : Nat
  randomizationMethod : Prop

structure TrialPopulationEvidence (P : TrialPopulation) where
  inclusionCriteriaClosed : P.inclusionCriteria
  exclusionCriteriaClosed : P.exclusionCriteria
  sampleSizeClosed : P.sampleSize > 0
  randomizationMethodClosed : P.randomizationMethod

def TrialPopulationClosed (P : TrialPopulation) : Prop :=
  P.inclusionCriteria ∧ P.exclusionCriteria ∧ (P.sampleSize > 0) ∧ P.randomizationMethod

theorem trial_population_closed_from_evidence (P : TrialPopulation)
    (E : TrialPopulationEvidence P) : TrialPopulationClosed P := by
  exact And.intro E.inclusionCriteriaClosed
    (And.intro E.exclusionCriteriaClosed
      (And.intro E.sampleSizeClosed E.randomizationMethodClosed))

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse