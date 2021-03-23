# make a circle logo with "verify", "explore", "confer", and "document"

d <- 0.04
lwd <- 5
r <- 1
text_cex <- 2.9

pdf("../Figs/logo.pdf", height=7.5, width=10, pointsize=12)

par(pty="s")
plot(0,0,type="n", xlab="", ylab="", xaxt="n", yaxt="n",
     xlim=c(-r*1.05-d,r*1.05+d), ylim=c(-r*1.05-d,r*1.05+d), bty="n", xaxs="i", yaxs="i")

n <- 201
z <- seq(0, pi/2, len=n)

x0 <- y0 <- d
lines(r*cos(z)+x0, r*sin(z)+y0, lwd=lwd)
segments(x0, y0, x0+r, y0, lwd=lwd)
segments(x0, y0, x0, y0+r, lwd=lwd)
text(x0+r-d, y0+d*3, "confer", adj=c(1, 0.5), cex=text_cex)

x0 <- -d; y0 <- d
lines(r*cos(z+pi/2)+x0, r*sin(z+pi/2)+y0, lwd=lwd)
segments(x0, y0, x0, y0+r, lwd=lwd)
segments(x0, y0, x0-r, y0, lwd=lwd)
text(x0-r+d, y0+d*3, "verify", adj=c(0, 0.5), cex=text_cex)

x0 <- d; y0 <- -d
lines(r*cos(z+3*pi/2)+x0, r*sin(z+3*pi/2)+y0, lwd=lwd)
segments(x0, y0, x0+r, y0, lwd=lwd)
segments(x0, y0, x0, y0-r, lwd=lwd)
text(x0+r-d, y0-d*3, "document", adj=c(1, 0.5), cex=text_cex)

x0 <- -d; y0 <- -d
lines(r*cos(z+pi)+x0, r*sin(z+pi)+y0, lwd=lwd)
segments(x0, y0, x0, y0-r, lwd=lwd)
segments(x0, y0, x0-r, y0, lwd=lwd)
text(x0-r+d, y0-d*3, "explore", adj=c(0, 0.5), cex=text_cex)

dev.off()
