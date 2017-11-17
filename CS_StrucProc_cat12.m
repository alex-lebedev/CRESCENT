%-----------------------------------------------------------------------
% This is a template job file for processing structural T1 images in the CRESCENT
% Job generated on 15-Nov-2017 11:21:21 by Alexander Lebedev
% requires SPM12 (used version 6685) and CAT12 installed in the toolbox folder
%-----------------------------------------------------------------------

matlabbatch{1}.spm.tools.cat.estwrite.data = {
                                              '/home/ALDRECENTRUM/alexander.lebedev/Desktop/CRESCENT/T1s/ANAIS/sub-5685/sub-5685_T1w.nii,1'
                                              '/home/ALDRECENTRUM/alexander.lebedev/Desktop/CRESCENT/T1s/ANAIS/sub-5693/sub-5693_T1w.nii,1'
                                              '/home/ALDRECENTRUM/alexander.lebedev/Desktop/CRESCENT/T1s/ANAIS/sub-5735/sub-5735_T1w.nii,1'
                                              % [...] list all the T1s you'd like to process
                                              };
matlabbatch{1}.spm.tools.cat.estwrite.nproc = 5;
matlabbatch{1}.spm.tools.cat.estwrite.opts.tpm = {'/home/ALDRECENTRUM/alexander.lebedev/Desktop/tbx/spm12/tpm/TPM.nii'};
matlabbatch{1}.spm.tools.cat.estwrite.opts.affreg = 'mni';
matlabbatch{1}.spm.tools.cat.estwrite.opts.biasstr = 0.75;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.APP = 2;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.LASstr = 0.75;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.gcutstr = 0.5;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.cleanupstr = 0.5;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.registration.darteltpm = {'/home/ALDRECENTRUM/alexander.lebedev/Desktop/tbx/spm12/toolbox/cat12/templates_1.50mm/Template_1_IXI555_MNI152.nii'};
matlabbatch{1}.spm.tools.cat.estwrite.extopts.registration.shootingtpm = {'/home/ALDRECENTRUM/alexander.lebedev/Desktop/tbx/spm12/toolbox/cat12/templates_1.50mm/Template_0_IXI555_MNI152_GS.nii'};
matlabbatch{1}.spm.tools.cat.estwrite.extopts.registration.regstr = 4;
matlabbatch{1}.spm.tools.cat.estwrite.extopts.vox = 1.5;
matlabbatch{1}.spm.tools.cat.estwrite.output.surface = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.ROI = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.GM.native = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.GM.mod = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.GM.dartel = 2;
matlabbatch{1}.spm.tools.cat.estwrite.output.WM.native = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.WM.mod = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.WM.dartel = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.bias.warped = 1;
matlabbatch{1}.spm.tools.cat.estwrite.output.jacobian.warped = 0;
matlabbatch{1}.spm.tools.cat.estwrite.output.warps = [1 0];
