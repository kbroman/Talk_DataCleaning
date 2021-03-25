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


for(i in 1:5) {

    pdf(paste0("../Figs/logo_", text[i], ".pdf"), height=2.5, width=ifelse(i==5, 10, 5), pointsize=14)

    par(mar=rep(0,4))
    plot(0,0,type="n", xlab="", ylab="", xaxt="n", yaxt="n",
         xlim=c(0, ifelse(i==5, 2, 1)*(width + gap)),
         ylim=c(0, height + gap),
         bty="n", xaxs="i", yaxs="i")

    w <- ifelse(i==5, width*2+gap, width)
    h <- height
    x <- gap*0.5
    y <- gap*0.5

    roundedRect(x, y, x+w, y+h,
                round=rounding, lwd=lwd, border=colors[i])
    text(x+w/2, y+h/2, text[i], cex=text_cex, col=colors[i])

    dev.off()
}
