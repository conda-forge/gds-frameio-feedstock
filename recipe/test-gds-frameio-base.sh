#!/bin/bash
#
# IGWN Conda Distribution tests for gds-frameio-base
#

set -ex

# use framecpp_sample to generate some fake data
framecpp_sample --description IGWN_CONDA_TEST --start-time 1000000000
GWF="Z-IGWN_CONDA_TEST-1000000000-1.gwf"

# print frame segments
fdir ${GWF}

# print frame info
finfo ${GWF}

# dump ascii
fextract Z0:RAMPED_INT_2U_1 ${GWF} data.txt

# dump frame (only on Linux)
FrameDump -i ${GWF}
if [ "$(uname)" = "Linux" ]; then
	framedump ${GWF}
fi

# set time
fsettime .
