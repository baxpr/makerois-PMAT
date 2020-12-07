function [seg_nii,deffwd_nii] = prep_files(inp)

copyfile(inp.seg_niigz,[inp.out_dir '/seg.nii.gz']);
system(['gunzip -f ' inp.out_dir '/seg.nii.gz']);
seg_nii = [inp.out_dir '/seg.nii'];

copyfile(inp.deffwd_niigz,[inp.out_dir '/deffwd.nii.gz']);
system(['gunzip -f ' inp.out_dir '/deffwd.nii.gz']);
deffwd_nii = [inp.out_dir '/deffwd.nii'];
