import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.endpointStatement → A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  intro h
  -- from gateWitness we can derive endpointSatisfied or remainderRecorded, but we need endpointSatisfied
  -- We assume we have a lemma that endpointSatisfied follows from the statement
  -- For now, use the gateWitness to get one of them, then a second lemma that it must be endpointSatisfied
  have hgate := A.gateWitness
  -- Suppose we have a lemma that if remainderRecorded then endpointSatisfied (maybe via some reasoning)
  -- Here we just use A.endpointSatisfied from the class? Actually it's a Prop, not necessarily true.
  -- So this proof is not trivial: we need to show that given h, endpointSatisfied holds.
  -- We can use A.gateWitness: either endpointSatisfied or remainderRecorded. If endpointSatisfied, done.
  -- If remainderRecorded, we need a lemma that remainderRecorded implies endpointSatisfied.
  sorry

end ClinicalMedicineClinicalTrialsDesignCanonicalLaneLean
end HautevilleHouse