#' @title example_mESC
#' @description the example of mESC
#' @return  A list of gene pair, ranked by the significance score.
#' @export

library(stats)
library(entropy)
library("RColorBrewer")

data(scExp_mESC)
data(pesudo_mESC)
data(TF_Mouse)

TF_Mouse=(TF_Mouse)[,1]
scExp_mESC_TF=scExp_mESC[intersect(rownames(scExp_mESC),TF_Mouse),order(pesudo_mESC[,1],decreasing = F)]

Switch_test_mESC=Switch_nls(scExp_mESC_TF)
Tansient_test_mESC=Tansient_nls(scExp_mESC_TF)

top_n=20
Pro_screen_TFs=Screen_TF(Switch_test_mESC, Tansient_test_mESC,top_n)

Mm_switch=Pro_screen_TFs[,1]
Mm_transient=Pro_screen_TFs[,2]
SignificanceScore=get_SignificanceScore(scExp_mESC_TF,Mm_switch,Mm_transient,0.01)

BSfate_TFs=get_singleTF_BSfate_rank(SignificanceScore)






