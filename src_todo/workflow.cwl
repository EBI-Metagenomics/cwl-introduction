#!/usr/bin/env cwl-runner
cwlVersion: v1.2
class: Workflow

doc: |
  Demo Workflow
  Protein-coding gene prediction for prokaryotic assemblies and pfam annotation for the genes

inputs:
  assembly_fasta:
    type: string
    format: edam:format_1929
  hmmdb:
    type: File
    doc: |
      HMMScan HMM (<db>.hmm).
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

steps:
  prodigal:
    run: prodigal.cwl
    in:
      input_fasta_file: assembly_fasta
    out:
      - output_fasta
  hmmscan:
    label: hmmscan
    run: hmmscan.cwl
    in:
      input_fasta: prodigal/output_fasta
      hmmdb: hmmdb
      h3m: h3m
      h3i: h3i
      h3f: h3f
      h3p: h3p
    out:
      - domtblout

outputs:
  prodigal_fasta:
    outputSource: prodigal/output_fasta
    type: File
    format: edam:format_1929
  hmmscan_domtblout:
    outputSource: hmmscan/domtblout
    type: File
    format: edam:format_1929

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