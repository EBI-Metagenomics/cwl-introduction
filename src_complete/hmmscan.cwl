#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: CommandLineTool

label: hmmscan v3.1b2

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.hmmdb)
      - $(inputs.h3m)
      - $(inputs.h3i)
      - $(inputs.h3f)
      - $(inputs.h3p)

hints:
  DockerRequirement:
    dockerPull: "microbiomeinformatics/hmmer:v3.1b2"
  SoftwareRequirement:
    packages:
      hmmer:
        specs: [ "https://identifiers.org/rrid/RRID:SCR_005305" ]
        version: [ "3.1b2" ]

baseCommand: ["hmmscan"]

inputs:
  hmmdb:
    type: File
    inputBinding:
      position: 4
      valueFrom: $(self.basename) # hmmscan uses the db name withouth the hmm extension
    doc: |
      HMMScan HMM (<db>.hmm)
  h3m:
    type: File
    doc: |
      HMM Database secondary file
      (databases/vpHMM/vpHMM_database.hmm.h3m)
  h3i:
    type: File
    doc: |
      HMM Database secondary file
      (databases/vpHMM/vpHMM_database.hmm.h3i)
  h3f:
    type: File
    doc: |
      HMM Database secondary file
      (databases/vpHMM/vpHMM_database.hmm.h3f)
  h3p:
    type: File
    doc: |
      HMM Database secondary file
      (databases/vpHMM/vpHMM_database.hmm.h3p)
  input_fasta:
    type: File
    format: edam:format_1929
    inputBinding:
      position: 5
      separate: true
  number_of_cpus:
    type: int?
    default: 2
    inputBinding:
      separate: true
      position: 2
      prefix: "--cpu"

arguments:
  - prefix: "-E"
    valueFrom: "0.001"
    position: 2
  - prefix: "--domtblout"
    valueFrom: $(inputs.input_fasta.nameroot)_hmmscan.tbl
    position: 3
  - valueFrom: "--noali"
    position: 1

stdout: stdout

outputs:
  domtblout:
    type: File
    outputBinding:
      glob: "*hmmscan.tbl"

doc: Biosequence analysis using profile hidden Markov models

$namespaces:
 edam: http://edamontology.org/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/version/latest/schemaorg-current-http.rdf

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder:
  - class: s:Organization
    s:name: "EMBL - European Bioinformatics Institute"
    s:url: "https://www.ebi.ac.uk"