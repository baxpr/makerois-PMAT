function [tseg_nii,deffwd_nii] = prep_files(inp)

copyfile(inp.tseg_niigz,[inp.out_dir '/tseg.nii.gz']);
system(['gunzip -f ' inp.out_dir '/tseg.nii.gz']);
tseg_nii = [inp.out_dir '/tseg.nii'];

copyfile(inp.deffwd_niigz,[inp.out_dir '/deffwd.nii.gz']);
system(['gunzip -f ' inp.out_dir '/deffwd.nii.gz']);
deffwd_nii = [inp.out_dir '/deffwd.nii'];
