Create study-specific ROI image in MNI space.

- 4mm spheres centered on the peak activations of the PMAT network

- Anterior lateral entorhinal cortex

- Posterior medial entorhinal cortex

- Perirhinal and parahippocampal cortex warped from Freesurfer output

- Anterior (head) and posterior (body+tail) hippocampus warped from Temporal_Lobe_v3 output



Inputs:

    T1
	 -> cat12_ss2p0_v2
	     - DEF_FWD
	 -> freesurfer_dev_v1
	     - SUBJECT
     -> Multi_Atlas
         -> Temporal_Lobe_v3
		     - SEG



