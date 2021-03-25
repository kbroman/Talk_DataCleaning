# make logo of rounded rectangles with "fundamentals", "verify", "explore", "confer", "document"
library(berryFunctions)
library(broman)

gap <- 2
height <- 25
width <- 50
lwd <- 5
text_cex <- 4
rounding <- 0.2

text <- c("verify", "explore", "confer", "document", "fundamentals")
colors <- brocolors("web")[c("blue", "green", "orange", "purple", "black")]

pdf("../Figs/logo.pdf", height=7.5, width=10, pointsize=14)

par(mar=rep(0,4))
plot(0,0,type="n", xlab="", ylab="", xaxt="n", yaxt="n",
     xlim=c(0, width*2 + gap*2), ylim=c(0, height*3 + gap*3),
     bty="n", xaxs="i", yaxs="i")


w <- c(rep(width, 4), width*2+gap)
h <- rep(height, 5)
x <- c(rep(c(gap*0.5, gap*1.5 + width), 2), gap*0.5)
y <- c(rep(2*height + gap*2.5, 2), rep(height+gap*1.5, 2), gap*0.5)

for(i in 1:5) {
    roundedRect(x[i], y[i], x[i]+w[i], y[i]+h[i],
                round=rounding, lwd=lwd, border=colors[i])
    text(x[i]+w[i]/2, y[i]+h[i]/2, text[i], cex=text_cex, col=colors[i])

}


dev.off()
