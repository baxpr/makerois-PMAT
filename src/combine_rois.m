function combine_rois(wtseg_nii,waparc_nii,wperiR_nii,wperiL_nii,out_dir)


%% ROI file info, verify geometry, load
Vtseg = spm_vol(wtseg_nii);
Vaparc = spm_vol(waparc_nii);
VperiR = spm_vol(wperiR_nii);
VperiL = spm_vol(wperiL_nii);
Vat = spm_vol(which('AT_Network_ROIs.nii.gz'));
Vpm = spm_vol(which('PM_Network_ROIs.nii.gz'));
spm_check_orientations([Vtseg; Vaparc; VperiR; VperiL; Vat; Vpm]);

Ytseg = spm_read_vols(Vtseg);
Yaparc = spm_read_vols(Vaparc);
YperiR = spm_read_vols(VperiR);
YperiL = spm_read_vols(VperiL);
Yat = spm_read_vols(Vat);
Ypm = spm_read_vols(Vpm);


%% Initialize final label image and CSV
% AT and PM spheres: 1-72
% Parahippocampus: 101-102
% Perirhinal: 103-104
% ALEC: 1001-1002
% PMEC: 1003-1004
% Hippocampus: 105-108
Ylabels = zeros(size(Ytseg));
label_csv = fullfile(out_dir,'rois_PMAT-labels.csv');
label_fid = fopen(label_csv,'w');
fprintf(label_fid,'Label,Region\n');


%% Spheres
sph_labels = readtable(which('PMAT_labels.csv'));
for h = 1:height(sph_labels)
	if sph_labels.Label(h) > 72, continue; end  % Skip ALEC/PMEC for now
	Ylabels( Yat(:)==sph_labels.Label(h) || Ypm(:)==sph_labels.Label(h) ) ...
		= sph_labels.Label(h);
	fprintf(label_fid,'%d,%s_sph\n',sph_labels.Label(h),sph_labels.Region{h});
end


%% Parahippocampus, perirhinal (Freesurfer)
Ylabels(Yaparc(:)==1016) = 101;  % L parahipp
Ylabels(Yaparc(:)==2016) = 102;  % R parahipp
Ylabels(YperiL(:)>0)     = 103;  % L perirhinal, overwrites parahipp
Ylabels(YperiR(:)>0)     = 104;  % R perirhinal, overwrites parahipp

fprintf(label_fid,'101,PM_L_Parahippocampus_lh_FS\n');
fprintf(label_fid,'102,PM_R_Parahippocampus_rh_FS\n');
fprintf(label_fid,'103,AT_L_Perirhinal_lh_FS\n');
fprintf(label_fid,'104,AT_R_Perirhinal_rh_FS\n');


%% Now ALEC, PMEC
for h = 1:height(sph_labels)
	if sph_labels.Label(h) > 72
		Ylabels( Yat(:)==sph_labels.Label(h) || Ypm(:)==sph_labels.Label(h) ) ...
			= sph_labels.Label(h);
		fprintf(label_fid,'%d,%s_EC\n',sph_labels.Label(h),sph_labels.Region{h});
	end
end


%% Temporal lobe
Ylabels(Ytseg(:)==4) = 105;
Ylabels(Ytseg(:)==1) = 106;
Ylabels(Ytseg(:)==5 || Ytseg(:)==11) = 107;
Ylabels(Ytseg(:)==2 || Ytseg(:)==10) = 108;

fprintf(label_fid,'105,AT_L_Hippocampus_Anterior_lh_TLv3\n');
fprintf(label_fid,'106,AT_R_Hippocampus_Anterior_rh_TLv3\n');
fprintf(label_fid,'107,PM_L_Hippocampus_Posterior_lh_TLv3\n');
fprintf(label_fid,'108,PM_R_Hippocampus_Posterior_rh_TLv3\n');


%% Done - close csv and write label image
fclose(label_fid);
Vlabels = Vat;
Vlabels.pinfo(1:2) = [1;0];
Vlabels.dt(1) = spm_type('uint16');
Vlabels.fname = fullfile(out_dir,'rois_PMAT.nii');
spm_write_vol(Vlabels,Ylabels);




