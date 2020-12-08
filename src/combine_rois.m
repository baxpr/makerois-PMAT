function combine_rois(wtseg_nii,waparc_nii,out_dir)


%% ROI file info, and verify geometry
Vtseg = spm_vol(wtseg_nii);
Vaparc = spm_vol(waparc_nii);
Vat = spm_vol(which('AT_Network_ROIs.nii.gz'));
Vpm = spm_vol(which('PM_Network_ROIs.nii.gz'));
spm_check_orientations([Vtseg; Vaparc; Vat; Vpm]);


%% Temporal lobe
Ytseg = spm_read_vols(Vtseg);

% Labels
r_hipp_anterior =   1 * (Ytseg==1);
l_hipp_anterior =   2 * (Ytseg==4);
r_hipp_posterior =  3 * (Ytseg==2 || Ytseg==10);
l_hipp_posterior =  4 * (Ytseg==5 || Ytseg==11);

% Check for overlap
sums = r_hipp_anterior>0 + l_hipp_anterior>0 ...
	+ r_hipp_posterior>0 + l_hipp_posterior>0;
if any(sums(:)>1)
	error('ROI overlap in temporal lobe')
end

% Combine and start the label file
labels = r_hipp_anterior + l_hipp_anterior ...
	+ r_hipp_posterior + l_hipp_posterior;
label_csv = fullfile(out_dir,'rois_PMAT-labels.csv');
label_fid = fopen(label_csv,'w');
fprintf(label_fid,'Label,Region\n');
fprintf(label_fid,'1,Hippocampus_Anterior_R\n');
fprintf(label_fid,'2,Hippocampus_Anterior_L\n');
fprintf(label_fid,'3,Hippocampus_Posterior_R\n');
fprintf(label_fid,'4,Hippocampus_Posterior_L\n');


%% Freesurfer
Yaparc = spm_read_vols(Vaparc);



