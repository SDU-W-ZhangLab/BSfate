#' @title example_hESC
#' @description the example of hESC
#' @return  A list of gene pair, ranked by the significance score.
#' @export


library(stats)
library(entropy)
library("RColorBrewer")

data(scExp_hESC)
data(pesudo_hESC)
data(TF_human)

TF_Human=(TF_human)[,1]
scExp_hESC_TF=scExp_hESC[intersect(rownames(scExp_hESC),TF_Human),order(pesudo_hESC[,1],decreasing = F)]

Switch_test_hESC=Switch_nls(scExp_hESC_TF)
Tansient_test_hESC=Tansient_nls(scExp_hESC_TF)

top_n=20
Pro_screen_TFs=Screen_TF(Switch_test_hESC, Tansient_test_hESC,top_n)

Hs_switch=Pro_screen_TFs[,1]
Hs_transient=Pro_screen_TFs[,2]
SignificanceScore=get_SignificanceScore(scExp_hESC_TF,Hs_switch_n,Hs_transient_n,0.1)
BSfate_TFs=get_singleTF_BSfate_rank(SignificanceScore)









