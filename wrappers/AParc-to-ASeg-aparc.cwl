cwlVersion: v1.0
class: CommandLineTool
baseCommand: mri_aparc2aseg
# mri_aparc2aseg --s bert --volmask --aseg aseg.presurf.hypos --o aparc_plus_aseg.mgz

requirements:
  - class: EnvVarRequirement
    envDef:
       SUBJECTS_DIR: $(runtime.outdir)
  - class: InlineJavascriptRequirement
  - class: InitialWorkDirRequirement
    listing:
    - entry: $(inputs.aseg_presurf_hypos)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/" + inputs.aseg_presurf_hypos.basename)
    - entry: $(inputs.ribbon)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/mri/ribbon.mgz")
    - entry: $(inputs.lh_aparc_annot)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + "lh.aparc.annot")
    - entry: $(inputs.rh_aparc_annot)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/label/" + "rh.aparc.annot")
    - entry: $(inputs.lh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.white")
    - entry: $(inputs.rh_white)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.white")
    - entry: $(inputs.lh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/lh.pial")
    - entry: $(inputs.rh_pial)
      entryname: $(runtime.outdir + "/" + inputs.subname + "/surf/rh.pial")

inputs:
  subname:
    type: string
    inputBinding:
      position: 1
      prefix: "--s"
  volmask:
    type: boolean
    default: true
    inputBinding:
      position: 2
      prefix: --volmask
  aseg_presurf_hypos:
    type: File
    inputBinding:
      position: 3
      prefix: --aseg
      valueFrom: $(inputs.aseg_presurf_hypos.nameroot)
  output_filename:
    type: string
    default: "aparc_plus_aseg.mgz"    
    inputBinding:
      position: 4
      prefix: --o
  ribbon:
    type: File
  lh_aparc_annot:
    type: File
  rh_aparc_annot:
    type: File
  lh_white:
    type: File
  rh_white:
    type: File
  lh_pial:
    type: File
  rh_pial:
    type: File

outputs:
  output_file:
    type: File
    outputBinding:
      glob: $(runtime.outdir + "/" + inputs.output_filename)