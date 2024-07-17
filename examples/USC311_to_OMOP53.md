# Introduction

This is the US Core 3.1.1 to OMOP 5.3 example. It is based on inputs under `/inputs/fhir_r4_uscore_3.1.1`, mappings under `/mappings` starting from `/mappings/main-uscore_311_to_omop53.wstl`, and outputs generated under `/outputs/USC311_to_OMOP53`.

Run the `/examples/USC311_to_OMOP53.sh` script to generate a new output after adding or editing inputs, or modifying the relevant mappings. The Git diffs under `/outputs/USC311_to_OMOP53` after running this script should give you a good idea of the new results based on any changes you have made since the last commit.

The example is still a primitive example but a more complete mapping will be implemented soon.  The goal at this point was to set up this repository to support the mapping effort but still show some working examples for how to use the Whistle2 language and tooling to define and apply the mappings.

The main next steps will be:
- Adding an example of concept mappings
- More meaningful FHIR to OMOP examples and mappings.

# Relevant resources

- The US Core IG version 3.1.1 is [here](https://hl7.org/fhir/us/core/STU3.1.1/)
  - Resource examples are [here](https://hl7.org/fhir/us/core/STU3.1.1/all-examples.html)
  - It is based on FHIR 4.0.1 found [here](https://hl7.org/fhir/R4/index.html)
- The OMOP 5.3 data model is [here](https://ohdsi.github.io/CommonDataModel/cdm53.html)
