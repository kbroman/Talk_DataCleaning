library(broman)


# batch effect
il3 <- readRDS("il3.rds")
pdf("../Figs/il3.pdf", height=5.5, width=9.75, pointsize=14)
par(mar=c(3.1, 3.6, 0.6, 0.6))
grayplot(il3, xlab="Mouse index", ylab="IL3",
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1,0.25,0))
dev.off()


pdf("../Figs/il3_log.pdf", height=5.5, width=9.75, pointsize=14)
par(mar=c(3.1, 3.6, 0.6, 0.6))
grayplot(log10(il3+0.1), xlab="Mouse index", ylab=expression(paste(log[10], " IL3")),
         mgp.x=c(1.7, 0.3, 0), mgp.y=c(2.1,0.25,0))
dev.off()
