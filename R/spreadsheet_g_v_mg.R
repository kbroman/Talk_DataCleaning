library(broman)

hilit_color <- "#ff00c0"

# a few values in g where the rest are in mg

mat <- cbind(id=paste0("DO-", 121:130),
             "Rt Kidney wt"=c(294, 296, "NA", 513, 381,
                              225, 262, 231, 263, 266),
             "Rt Adipose wt"=c(757, 583, 834, 808, 780,
                               1.066, 1.03, 0.687, 0.932, 985),
             "Liver wt"=c(930, 439, 527, 600, 493,
                          355, 512, 497, 580, 906))

pdf("../Figs/spreadsheet_g_v_mg.pdf", height=5, width=10)
excel_fig(mat, col_names=TRUE, hilitcells=paste0("C", 7:10), hilitcolor=hilit_color)
dev.off()
