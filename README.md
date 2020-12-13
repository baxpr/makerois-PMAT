# Create study-specific ROI image in MNI space

- 4mm spheres centered on the peak activations of the PMAT network

- Anterior lateral entorhinal cortex

- Posterior medial entorhinal cortex

- Perirhinal and parahippocampal cortex warped from Freesurfer output

- Anterior (head) and posterior (body+tail) hippocampus warped from Temporal_Lobe_v3 output



## Inputs:

    T1
	 -> cat12_ss2p0_v2
	     - DEF_FWD
	 -> freesurfer_dev_v1
	     - SUBJECT
     -> Multi_Atlas
         -> Temporal_Lobe_v3
		     - SEG



## Regions of interest

### Spheres

Source: _Libby LA, Ekstrom AD, Ragland JD, Ranganath C. Differential connectivity of perirhinal and parahippocampal cortices within human hippocampal subregions revealed by high-resolution functional imaging. J Neurosci. 2012;32(19):6550-6560. doi:10.1523/JNEUROSCI.3711-11.2012_

Method: _Schröder TN, Haak K V., Jimenez NIZ, et al. Functional topography of the human entorhinal cortex. Elife. 2015;4(October 2016):1-17. doi:10.7554/eLife.06738_
 

### Entorhinal cortex (ALEC/PMEC)

Schröder TN, Haak K V., Jimenez NIZ, et al. Functional topography of the human entorhinal cortex. Elife. 2015;4(October 2016):1-17. doi:10.7554/eLife.06738


Temporal lobe

     1  R Hipp Head
	 2  R Hipp Body
	 4  L Hipp Head
     5  L Hipp Body
     6  R Amygdala
	 8  L Amygdala
	10  R Hipp Tail
	11  L Hipp Tail 

- Plassard AJ, McHugo M, Heckers S, Landman BA. Multi-Scale Hippocampal Parcellation Improves Atlas-Based Segmentation Accuracy. Proc SPIE Int Soc Opt Eng. 2017 Feb 11;10133:101332D. doi: 10.1117/12.2254425. Epub 2017 Feb 24. PMID: 28781411; PMCID: PMC5544133.


Freesurfer

- Bruce Fischl, Andre van der Kouwe, Christophe Destrieux, Eric Halgren, Florent Segonne, David H. Salat, Evelina Busa, Larry J. Seidman, Jill Goldstein, David Kennedy, Verne Caviness, Nikos Makris, Bruce Rosen, and Anders M. Dale. Automatically Parcellating the Human Cerebral Cortex. Cerebral Cortex January 2004; 14:11-22.


