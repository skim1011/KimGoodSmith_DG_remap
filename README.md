# KimGoodSmith_DG_remap

# data file
- All are provided as 420 cells (rows) by 5 columns (sessions)

* active_session: 
 0 - no place fields in session
 1 - place fields in session

* maze_short: specify distinct environments
- 1: square_1
- 2: square_2
- 3: circle
- 4: octagon

* spinfo: spatial information score (in bits/spike)
* peakrates: peak firing rate
* meanrate: mean firing rate
* infop: p value for spatial information score
* vel_filt_rmap: speed filtered, 48x64 pixel firing rate maps
* cl:  0: mossy cells, 1: granule cells
* votes: the confidence level from classifier 0~1
* order: lists of cells for population vector analysis


# Codes
* rate_overlap_wo_repeat.m
for rate overlap values among four distinct environments (Fig2. B and C).
* spatial_corr_wo_repeat.m
for spatial correlation values among four distinct environments (Fig2. E and F).
* rate_overlap_repeat.m
for rate overlap values with repeated session (Fig3. A).
* spatial_corr_repeat.m
for spatial correlation values with repeated session (Fig3. D).
* rate_RI.m
for rate remap index (Fig3.B)
* spatial_RI.m
for spatial remap index (Fig3.E)
* rate_RI_senzai.m
for rate remap index Senzai et al method. (Figure S4 A and B)
* spatial_RI_senzai.m
for spatial remap index using Senzai et al method.(Figure S4 C and D)
* remap_PV.m / remap_bootstrap_PV.m
for population vector analysis (Fig3. G and H)
