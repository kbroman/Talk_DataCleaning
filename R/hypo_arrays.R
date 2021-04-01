# ugly histograms from hypothalamus microarrays
library(broman)
library(data.table)

# download data
csvfile <- "hypo_mlratio_raw.csv"
if(!file.exists(csvfile)) {
    gzfile <- paste0(csvfile, ".gz")
    if(file.exists(gzfile)) system(paste("gunzip", gzfile))
    else {
        url <- "https://phenomedoc.jax.org/QTL_Archive/attie_2015/Attie_2015_eqtl_raw.zip"
        file <- basename(url)
        if(!file.exists(file)) download.file(url, file)
        unzip(file, csvfile)
    }
}

hypo <- data.table::fread(csvfile, data.table=FALSE)
rownames(hypo) <- hypo[,1]
colnames(hypo) <- hypo[1,]
hypo <- t(hypo[-1,-1])


# estimate densities
x <- seq(-2, 2, length=201)
d <- apply(hypo, 2, function(a) density(a[!is.na(a)], from=-2, to=2, n=201)$y)

# median and iqr
iqr <- function(a) diff(quantile(a, c(0.25, 0.75), na.rm=TRUE))
med <- apply(hypo, 2, median, na.rm=TRUE)
iqr_val <- apply(hypo, 2, iqr)

invis_gray <- rgb(0.5,0.5,0.5,0.2)
invis_blue <- rgb(0.1,0.1,0.5,0.2)

pdf("../Figs/hypo_arrays.pdf", height=5, width=10)
par(mar=c(3.1, 0.6, 0.6, 0.6))
grayplot(x, d[,1], xlab="Gene expression", ylab="", yat=NA, ylim=c(0, max(d)),
         type="n", xlim=c(-0.2, 0.5))
for(i in 1:ncol(d)) lines(x, d[,i], col=invis_gray)
dev.off()

pdf("../Figs/hypo_arrays_hilit.pdf", height=5, width=10)
par(mar=c(3.1, 0.6, 0.6, 0.6))
grayplot(x, d[,1], xlab="Gene expression", ylab="", yat=NA, ylim=c(0, max(d)),
         type="n", xlim=c(-0.2, 0.5))
o <- order(med, decreasing=TRUE)
for(i in o[-(1:120)]) lines(x, d[,i], col=invis_gray)
for(i in o[1:120]) lines(x, d[,i], col=invis_blue)
dev.off()

pdf("../Figs/hypo_iqr_v_median.pdf", height=5, width=7)
par(mar=c(3.1, 3.1, 0.6, 0.6))
grayplot(med, iqr_val, xlab="median", ylab="Inter-quartile range")
dev.off()

# multi boxplots
pdf("../Figs/hypo_boxplots.pdf", height=5, width=10)
col <- brocolors("web")[c("blue", "purple", "red", "green", "black")]
par(mar=c(3.7, 4.1, 0.5, 0.5))
manyboxplot(hypo[,order(med, decreasing=TRUE)], type="l", lwd=1,
            dotcol=col[1], linecol=col[-1], probs=c(0.25, 0.1, 0.05, 0.01),
            ylim=c(-1,0.52), yaxs="i", yat=seq(-1, 0.5, by=0.25), ylab="")
title(xlab="Array (sorted by median)", mgp=c(2.1, 0, 0))
title(ylab="Quantile", mgp=c(2.9, 0, 0))
dev.off()
