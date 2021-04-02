library(broman)

homa <- readRDS("homa.rds")

pdf("../Figs/check_calculations.pdf", height=5, width=12.5)
par(mfrow=c(1,2), mar=c(4.1, 4.1, 0.6, 1.1))
grayplot_na(homa[,2], homa[,3],
            xlab="HOMA_IR", ylab="glucose/insulin")
grayplot_na(homa[,3]- homa[,2], mgp.y=c(3.2,0.2,0),
            xlab="Index", ylab="glucose/insulin - HOMA_IR")
dev.off()

pdf("../Figs/check_calculations_log.pdf", height=5, width=11.5)
par(mfrow=c(1,2), mar=c(4.1, 4.1, 0.6, 1.1))
grayplot_na(log10(homa[,2]), log10(homa[,3]),
            xlab="log HOMA_IR", ylab="log glucose/insulin")
grayplot_na(log10(homa[,3]) - log10(homa[,2]), mgp.y=c(2.6,0.2,0),
            xlab="Index",
            ylab="log(glucose/insulin) - log(HOMA_IR)")
dev.off()
