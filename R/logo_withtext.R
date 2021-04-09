# make logo of rounded rectangles with "fundamentals", "verify", "explore", "ask", "document"
library(berryFunctions)
library(broman)

gap <- 2
height <- 25
width <- 50
lwd <- 5
header_cex <- 2
text_cex <- 1.5
rounding <- 0.2

text <- c("verify", "explore", "ask", "document", "fundamentals")
colors <- rgb(c(  0,  26, 225, 17, 122),
              c(106, 154, 103, 17,   0),
              c(207,  34,  27, 17, 128), maxColorValue=255) # ("blue", "green", "orange", "black", "purple")

pdf("../Figs/logo_withtext.pdf", height=7.5, width=12, pointsize=14)

par(mar=rep(0,4))
plot(0,0,type="n", xlab="", ylab="", xaxt="n", yaxt="n",
     xlim=c(0, width*2 + gap*2), ylim=c(0, height*3 + gap*3),
     bty="n", xaxs="i", yaxs="i")


w <- c(rep(width, 4), width*2+gap)
h <- rep(height, 5)
x <- c(rep(c(gap*0.5, gap*1.5 + width), 2), gap*0.5)
y <- c(rep(height + gap*1.5, 2), rep(gap*0.5, 2), 2*height+ gap*2.5)

principles <- list(
    c("  6. Verify that distinct things are distinct",
      "  7. Verify that matching things match",
      "  8. Check calculations",
      "  9. Look for other instances of problems"),
    c("10. Make lots of plots",
      "11. Look at missing value patterns",
      "12. With big data make more plots",
      "13. Follow up all artifacts"),
    c("14. Ask questions",
      "15. Ask for the primary data",
      "16. Ask for metadata",
      "17. Ask why data are missing"),
    c("18. Create checklists & pipelines",
      "19. Document not just what but why",
      "20. Expect to recheck"),
    c("  1. Don't clean data when tired or hungry",
      "  2. Don't trust anyone (even yourself)",
      "  3. Think about what might have gone wrong",
      "  4. Use care in merging",
      "  5. Dates & categories suck"))


for(i in 1:5) {
    roundedRect(x[i], y[i], x[i]+w[i], y[i]+h[i],
                round=rounding, lwd=lwd, border=colors[i])
    text(x[i]+w[1]*0.05, y[i]+h[i]*0.87, text[i], cex=header_cex, col=colors[i], adj=c(0, 0.5))

    for(j in seq_along(principles[[i]]))
        text(x[i]+w[1]*0.07, y[i]+h[i]*0.7 - h[i]*0.15*(j-1) - ifelse(i<5, h[i]*0.05, 0),
             principles[[i]][[j]], cex=text_cex, col=colors[i], adj=c(0, 0.5))

}


dev.off()
