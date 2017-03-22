#ifdef USE_MULTI

SBMLCONSTRUCTOR_EXCEPTION(MultiPkgNamespaces)
SBMLCONSTRUCTOR_EXCEPTION(PossibleSpeciesFeatureValue)
SBMLCONSTRUCTOR_EXCEPTION(SpeciesFeatureValue)
SBMLCONSTRUCTOR_EXCEPTION(CompartmentReference)
SBMLCONSTRUCTOR_EXCEPTION(SpeciesTypeInstance)
SBMLCONSTRUCTOR_EXCEPTION(InSpeciesTypeBond)
SBMLCONSTRUCTOR_EXCEPTION(OutwardBindingSite)
SBMLCONSTRUCTOR_EXCEPTION(SpeciesFeatureType)
SBMLCONSTRUCTOR_EXCEPTION(SpeciesTypeComponentIndex)
SBMLCONSTRUCTOR_EXCEPTION(SpeciesFeature)
SBMLCONSTRUCTOR_EXCEPTION(SpeciesTypeComponentMapInProduct)
SBMLCONSTRUCTOR_EXCEPTION(MultiSpeciesType)
SBMLCONSTRUCTOR_EXCEPTION(BindingSiteSpeciesType)
SBMLCONSTRUCTOR_EXCEPTION(IntraSpeciesReaction)
SBMLCONSTRUCTOR_EXCEPTION(ListOfPossibleSpeciesFeatureValues)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSpeciesFeatureValues)
SBMLCONSTRUCTOR_EXCEPTION(ListOfCompartmentReferences)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSpeciesTypeInstances)
SBMLCONSTRUCTOR_EXCEPTION(ListOfInSpeciesTypeBonds)
SBMLCONSTRUCTOR_EXCEPTION(ListOfOutwardBindingSites)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSpeciesFeatureTypes)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSpeciesTypeComponentIndexes)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSpeciesFeatures)
SBMLCONSTRUCTOR_EXCEPTION(ListOfSpeciesTypeComponentMapInProducts)
SBMLCONSTRUCTOR_EXCEPTION(ListOfMultiSpeciesTypes)

/**
 * Convert MultiSpeciesType objects into the most specific object possible.
 */
%typemap(out) MultiSpeciesType*
{
	$result = SWIG_NewPointerObj($1, GetDowncastSwigTypeForPackage($1, "multi"), $owner | %newpointer_flags);
}


#endif // USE_MULTI 

