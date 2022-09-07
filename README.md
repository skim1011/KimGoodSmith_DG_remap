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
