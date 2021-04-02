# spreadsheet examples related to "everything with a script"
library(broman)

dat <- readRDS("mismatch.rds")
for(i in seq_along(dat)) dat[[i]] <- cbind(id=rownames(dat[[i]]), dat[[i]])
mat1 <- dat[[1]]
mat2 <- dat[[2]]

colnames(mat1)[c(2,4,5)] <- c("water_consumption", "age_at_dosing", "age_at_death")
mat1 <- mat1[,-c(2,5)]

hilit_color <- "#ff00c0"


pdf("../Figs/mismatch.pdf", height=5, width=7.2, pointsize=14)
excel_fig(mat1, col_names=TRUE, hilitcells="D6", hilitcolor=hilit_color)
dev.off()

pdf("../Figs/mismatchB.pdf", height=5, width=7.2, pointsize=14)
excel_fig(mat2, col_names=TRUE, hilitcells="C6", hilitcolor=hilit_color)
dev.off()
