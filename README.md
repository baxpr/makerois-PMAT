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



ROI sources:

Spheres

- 

Entorhinal cortex

- Schröder TN, Haak K V., Jimenez NIZ, et al. Functional topography of the human entorhinal cortex. Elife. 2015;4(October 2016):1-17. doi:10.7554/eLife.06738


Temporal lobe

- Plassard AJ, McHugo M, Heckers S, Landman BA. Multi-Scale Hippocampal Parcellation Improves Atlas-Based Segmentation Accuracy. Proc SPIE Int Soc Opt Eng. 2017 Feb 11;10133:101332D. doi: 10.1117/12.2254425. Epub 2017 Feb 24. PMID: 28781411; PMCID: PMC5544133.


Freesurfer

- Bruce Fischl, Andre van der Kouwe, Christophe Destrieux, Eric Halgren, Florent Segonne, David H. Salat, Evelina Busa, Larry J. Seidman, Jill Goldstein, David Kennedy, Verne Caviness, Nikos Makris, Bruce Rosen, and Anders M. Dale. Automatically Parcellating the Human Cerebral Cortex. Cerebral Cortex January 2004; 14:11-22.


