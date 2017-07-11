# edgeRscripts
R scripts for edgeR

binddata.R can be used to make a data.frame from multiple gene count file (txt).

Scripts to be used:
1. buildDGE.R, returns DGEList object;
2. buildDesign.R, returns design;
3. anovContrast.R, returns a string to be the argument of makeContrasts;
4. edgeR:makeContrasts;
5. makeHeatmap.R, makes MDSplot, Heatmap (logFC), and Heatmap (logCPM)

or

3. buildQLF.R;
4. pairHeatmap.R, makes MDSplot, Heatmap (logCPM)
