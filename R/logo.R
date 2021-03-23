# make logo of rounded rectangles with "fundamentals", "verify", "explore", "confer", "document"
library(berryFunctions)
library(broman)

gap <- 2
height <- 25
width <- 50
lwd <- 5
text_cex <- 4
rounding <- 0.2

text <- c("fundamentals", "verify", "explore", "confer", "document")
colors <- brocolors("web")[c("black", "blue", "green", "orange", "purple")]

pdf("../Figs/logo.pdf", height=7.5, width=10, pointsize=14)

par(mar=rep(0,4))
plot(0,0,type="n", xlab="", ylab="", xaxt="n", yaxt="n",
     xlim=c(0, width*2 + gap*2), ylim=c(0, height*3 + gap*3),
     bty="n", xaxs="i", yaxs="i")


w <- c(width*2+gap, rep(width, 4))
h <- rep(height, 5)
x <- c(gap*0.5, rep(c(gap*0.5, gap*1.5 + width), 2))
y <- c(height*2 + gap*2.5, height + gap*1.5, height + gap*1.5,
       gap*0.5, gap*0.5)

for(i in 1:5) {
    roundedRect(x[i], y[i], x[i]+w[i], y[i]+h[i],
                round=rounding, lwd=lwd, border=colors[i])
    text(x[i]+w[i]/2, y[i]+h[i]/2, text[i], cex=text_cex, col=colors[i])

}


dev.off()
