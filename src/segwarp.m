function segwarp(varargin)


%% Parse inputs
P = inputParser;

% Native space segmentation
addOptional(P,'seg_niigz','../INPUTS/T1_seg.nii.gz');

% Forward SPM deformation field from native to atlas
addOptional(P,'deffwd_niigz','../INPUTS/y_t1.nii.gz');

% Already-warped subject T1
addOptional(P,'wt1_niigz','../INPUTS/wmt1.nii.gz');

% Output geometry ('avg152T1.nii' or 'TPM.nii')
addOptional(P,'mnigeom_nii','avg152T1.nii')

% Subject info if on XNAT
addOptional(P,'project','UNK_PROJ');
addOptional(P,'subject','UNK_SUBJ');
addOptional(P,'session','UNK_SESS');
addOptional(P,'scan','UNK_SCAN');

% Output location
addOptional(P,'out_dir','../OUTPUTS');

% Change paths to match test environment if needed
addOptional(P,'fsl_dir','/usr/local/fsl');
addOptional(P,'src_dir','/opt/cersuit/src');
addOptional(P,'immag_dir','/usr/bin');


%% Parse and process
parse(P,varargin{:});
disp(P.Results)

segwarp_main(P.Results)

