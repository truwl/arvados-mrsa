#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: skesa

inputs:
  fastq:
    type:
      - File?
      - File[]?
    inputBinding:
      prefix: --fastq
      itemSeparator: ","
  fasta:
    type:
      - File?
      - File[]?
    inputBinding:
      prefix: --fasta
  use_paired_ends:
    type: boolean?
    inputBinding:
      prefix: --use_paired_ends
  contigs_out_name:
    type: string?
    default: contigs.out
    inputBinding:
      prefix: --contigs_out
  cores:
    type: int?
    default: 8
    inputBinding:
      prefix: --cores
  memory:
    type: int?
    default: 30
    inputBinding:
      prefix: --memory

outputs:
  contigs_out:
    type: File
    outputBinding:
      glob: $(inputs.contigs_out_name)

requirements:
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 8
    ramMin: 30720
  - class: DockerRequirement
    dockerPull: "quay.io/biocontainers/skesa:2.3.0--he1c1bb9_2"
