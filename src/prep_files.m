function [tseg_nii,deffwd_nii,aparc_nii] = prep_files(inp)

% MNI space deformation field
copyfile(inp.deffwd_niigz,[inp.out_dir '/deffwd.nii.gz']);
system(['gunzip -f ' inp.out_dir '/deffwd.nii.gz']);
deffwd_nii = [inp.out_dir '/deffwd.nii'];

% Temporal lobe
copyfile(inp.tseg_niigz,[inp.out_dir '/tseg.nii.gz']);
system(['gunzip -f ' inp.out_dir '/tseg.nii.gz']);
tseg_nii = [inp.out_dir '/tseg.nii'];

% Freesurfer - need to convert this one from mgz
system([ ...
	inp.fs_dir '/mri_convert ' ...
	inp.subj_dir '/mri/aparc+aseg.mgz ' ...
	inp.out_dir '/aparc+aseg.nii' ...
	]);
aparc_nii = [inp.out_dir '/aparc+aseg.nii'];

