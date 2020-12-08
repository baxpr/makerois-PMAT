function combine_rois(wtseg_nii,waparc_nii,wperiR_nii,wperiL_nii,out_dir)


%% ROI file info, and verify geometry
Vtseg = spm_vol(wtseg_nii);
Vaparc = spm_vol(waparc_nii);
VperiR = spm_vol(wperiR_nii);
VperiL = spm_vol(wperiL_nii);
Vat = spm_vol(which('AT_Network_ROIs.nii.gz'));
Vpm = spm_vol(which('PM_Network_ROIs.nii.gz'));
spm_check_orientations([Vtseg; Vaparc; VperiR; VperiL; Vat; Vpm]);


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
fprintf(label_fid,'1,AT_R_Hippocampus_Anterior_rh_TLv3\n');
fprintf(label_fid,'2,AT_L_Hippocampus_Anterior_lh_TLv3\n');
fprintf(label_fid,'3,PM_R_Hippocampus_Posterior_rh_TLv3\n');
fprintf(label_fid,'4,PM_L_Hippocampus_Posterior_lh_TLv3\n');


%% Freesurfer
Yaparc = spm_read_vols(Vaparc);
YperiR = spm_read_vols(VperiR);
YperiL = spm_read_vols(VperiL);
pp = zeros(size(Yaparc));
pp(Yaparc(:)==2016) = 5;  % R parahipp
pp(Yaparc(:)==1016) = 6;  % L parahipp
pp(YperiR(:)>0)     = 7;  % R perirhinal, overwrites parahipp
pp(YperiL(:)>0)     = 8;  % L perirhinal, overwrites parahipp

sums = labels>0 + pp>0;
if any(sums(:)>1)
	error('ROI overlap in freesurfer')
end

labels = labels + pp;
fprintf(label_fid,'5,PM_R_Parahippocampus_rh_FS\n');
fprintf(label_fid,'6,PM_L_Parahippocampus_lh_FS\n');
fprintf(label_fid,'7,AT_R_Perirhinal_rh_FS\n');
fprintf(label_fid,'8,AT_L_Perirhinal_lh_FS\n');



