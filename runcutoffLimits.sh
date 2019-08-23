	echo ""
#!/bin/bash
# This is a script to create workspaces and cards with different mWV cutoffs

for cutoff in 2100 2400 2700 3000 3300 3600 3900 4200 4500
do
	echo "====================================================================="
	echo "CUTOFF mWV: "$cutoff GeV
	echo "====================================================================="

	python prepare_bkg_oneCat.py -b --channel el --readtrees --hi $cutoff
	mv "cards_el_HPV_900_""$cutoff""/wwlvj_el_HPV_900_""$cutoff""_workspace.root" CutoffLimitCards
	rm -rf "cards_el_HPV_900_""$cutoff"
	rm -rf "plots_el_HPV_900_""$cutoff"

        python prepare_bkg_oneCat.py -b --channel mu --readtrees --hi $cutoff
        mv "cards_mu_HPV_900_""$cutoff""/wwlvj_mu_HPV_900_""$cutoff""_workspace.root" CutoffLimitCards
        rm -rf "cards_mu_HPV_900_""$cutoff"
        rm -rf "plots_mu_HPV_900_""$cutoff"
done 
