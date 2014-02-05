<link href="http://kevinburke.bitbucket.org/markdowncss/markdown.css" rel="stylesheet"></link>
<link href="http://www.biostat.wisc.edu/~kbroman/markdown_modified.css" rel="stylesheet"></link>

## Knitr/R Markdown example

This is a simple example using knitr and R markdown to mix code and
text.

We'll first simulate some data with $x \sim N(\mu=10, \sigma=5)$ and
$y = 2x + \epsilon$, where $\epsilon \sim N(\mu=0, \sigma=2)$.


```r
x <- rnorm(100, 10, 5)
y <- 2 * x + rnorm(100, 0, 2)
```


Here's a scatterplot of the data.


```r
plot(x, y, pch = 21, bg = "slateblue", las = 1)
```

![plot of chunk scatterplot](figure/scatterplot.png) 


The estimated correlation between $x$ and $y$ is
0.98.

Here is the result of regressing $y$ on $x$.


```r
out <- lm(y ~ x)
summary(out)
```

```
## 
## Call:
## lm(formula = y ~ x)
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -4.889 -1.391 -0.094  1.435  3.994 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -0.3107     0.4439    -0.7     0.49    
## x             2.0152     0.0389    51.9   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.97 on 98 degrees of freedom
## Multiple R-squared:  0.965,	Adjusted R-squared:  0.964 
## F-statistic: 2.69e+03 on 1 and 98 DF,  p-value: <2e-16
```


So note that the estimated slope for the regression line is
2.02.

### It's usually best to end with session information


```r
sessionInfo()
```

```
## R version 3.0.2 (2013-09-25)
## Platform: x86_64-apple-darwin10.8.0 (64-bit)
## 
## locale:
## [1] en_US.US-ASCII/en_US.US-ASCII/en_US.US-ASCII/C/en_US.US-ASCII/en_US.US-ASCII
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] knitr_1.5
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.1 formatR_0.10   stringr_0.6.2  tools_3.0.2
```

