library(ggplot2)
library(visdat)
library(naniar)
library(cowplot)
library(broman)

larger_title <- theme(plot.title=element_text(size=24))

p1 <- vis_dat(airquality) + labs(title="{visdat}") + larger_title
p2 <- ggplot(airquality, aes(x = Solar.R, y = Ozone)) + geom_miss_point() +
    theme_karl() + labs(title="{naniar}") + larger_title

ggsave("../Figs/scatter_na.pdf", plot_grid(p1, p2),
       height=5, width=11, pointsize=18)
