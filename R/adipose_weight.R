library(broman)

# outlier due to error re units
adipose_wt <- readRDS("adipose_weight.rds")

pdf("../Figs/adipose_weight.pdf", height=5.5, width=9.75, pointsize=14)
par(mar=c(3.1, 3.6, 0.6, 0.6))
grayplot(adipose_wt, xlab="Mouse index", ylab="Adipose weight (mg)",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1,0.25,0))
dev.off()
