library(broman)

# body weight
set.seed(201809005)
pdf("../Figs/body_weight.pdf", height=6.5, width=6.5, pointsize=14)
par(mar=c(3.6, 3.6, 0.6, 0.6))
before <- rnorm(100, 20, 3.5)
after <- before + rnorm(100, 3, 2)
after[25:26] <- after[26:25]
grayplot(before, after,
         xlab="6 wk body weight (g)",
         ylab="10 wk body weight (g)")
d <- 0.3
hilit_color <- "#ff00c0"
text(before[25]+d, after[25], "25", adj=c(0, 0.5), col=hilit_color, cex=1.5)
text(before[26]-d, after[26], "26", adj=c(1, 0.5), col=hilit_color, cex=1.5)
dev.off()
