pdf("../Figs/fig2.pdf", height=3.5, width=4.5)
par(mar=c(4,4,1,1))

x <- rnorm(100)
y <- x*0.9 + rnorm(100)

plot(x, y, las=1)

dev.off()
