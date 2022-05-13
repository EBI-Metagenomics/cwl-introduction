#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool

label: Prodigal v2.6.3

doc: Protein-coding gene prediction for prokaryotic genomes

hints:
  DockerRequirement:
    dockerPull: "microbiomeinformatics/prodigal:v2.6.3"
  SoftwareRequirement:
    packages:
      rpdogal:
        specs: [ "https://identifiers.org/rrid/RRID:SCR_021246" ]
        version: [ "2.6.3" ]

baseCommand: ["prodigal"]

inputs:
  input_fasta:
    type: File
    format: edam:format_1929
    inputBinding:
      separate: true
      prefix: "-i"

arguments:
  - prefix: -a
    valueFrom: $(inputs.input_fasta.nameroot)_predicted_cds.faa

outputs:
  output_fasta:
    type: File
    format: edam:format_1929
    outputBinding:
      glob: "*.faa"

$namespaces:
 s: http://schema.org/
 edam: http://edamontology.org/
$schemas:
 - https://schema.org/version/latest/schemaorg-current-http.rdf

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder:
  - class: s:Organization
    s:name: "EMBL - European Bioinformatics Institute"
    s:url: "https://www.ebi.ac.uk"