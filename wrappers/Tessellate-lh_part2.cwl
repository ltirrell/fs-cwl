cwlVersion: v1.0
class: CommandLineTool
baseCommand: mris_extract_main_component
# mris_extract_main_component ../surf/lh.orig.nofix ../surf/lh.orig.nofix

inputs:
  orig_nofix_preextract:
    type: File
    inputBinding:
      position: 1
  output_filename:
    type: string
    default: "lh.orig.nofix"
    inputBinding:
      position: 2

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(inputs.output_filename)