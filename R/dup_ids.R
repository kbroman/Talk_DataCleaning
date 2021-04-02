library(broman)

mat <- readRDS("dup_ids.rds")

hilit_color <- "#ff00c0"

pdf("../Figs/dup_ids.pdf", height=5, width=11.5, pointsize=14)
excel_fig(mat, col_names=TRUE, hilitcells=paste0("B", c(4,9)), hilitcolor=hilit_color)
dev.off()
