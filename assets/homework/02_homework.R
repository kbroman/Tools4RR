# R code to perform an exhaustive permutation test
# (with the t-statistic) and plot the results

# Utility function
#     returns binary representation of 1:(2^n)
binary.v <-
    function(n)
{
    x <- 1:(2^n)
    mx <- max(x)
    digits <- floor(log2(mx))
    ans <- 0:(digits-1); lx <- length(x)
    x <- matrix(rep(x,rep(digits, lx)),ncol=lx)
    (x %/% 2^ans) %% 2
}

# exhaustive permutation test with the t-statistic
perm.test <-
    function(x, y, var.equal=TRUE)
{
    # number of data points
    kx <- length(x)
    ky <- length(y)
    n <- kx + ky

    # Data re-compiled
    X <- c(x,y)
    z <- rep(1:0,c(kx,ky))

    tobs <- t.test(x,y,var.equal=var.equal)$statistic

    o <- binary.v(n)  # indicator of all possible samples
    o <- o[,apply(o,2,sum)==kx]
    nc <- choose(n,kx)
    allt <- 1:nc
    for(i in 1:nc) {
        xn <- X[o[,i]==1]
        yn <- X[o[,i]==0]
        allt[i] <- t.test(xn,yn,var.equal=var.equal)$statistic
    }

    attr(allt, "tobs") <- tobs

    allt
}

# some data
x <- c(6.20, 5.72, 6.07, 6.75, 5.50, 6.39, 4.30, 4.96, 5.48)
y <- c(6.49, 6.52, 6.28, 8.59, 7.18, 4.92, 6.74, 7.27)

# run the permutation test
permt <- perm.test(x, y)

# grab the observed t-statistic (saved as attribute)
tobs <- attr(permt, "tobs")

# calculate p-value
pval <- mean(abs(permt) >= abs(tobs))

# save the results to a .RData file
save(permt, tobs, pval, file="permt_results.RData")

# plot the results
pdf("hw2_plot.pdf", height=7.5, width=10, pointsize=14)
hist(permt, breaks=200, xlab="t-statistic", las=1,
     main = paste("P-value =", round(pval, 3)))
abline(v=tobs, lwd=2, col="violetred")
dev.off()
