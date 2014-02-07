<link href="http://kevinburke.bitbucket.org/markdowncss/markdown.css" rel="stylesheet"></link>
<link href="http://www.biostat.wisc.edu/~kbroman/markdown_modified.css" rel="stylesheet"></link>

## Knitr/R Markdown example

This is a simple example using knitr and R markdown to mix code and
text.

We'll start by setting the seed for the random number generator.


```r
set.seed(53079239)
```


We'll first simulate some data with $x \sim N(\mu=10, \sigma=5)$ and
$y = 2x + \epsilon$, where $\epsilon \sim N(\mu=0, \sigma=2)$.


```r
x <- rnorm(100, 10, 5)
y <- 2*x + rnorm(100, 0, 2)
```


Here's a scatterplot of the data.


```r
plot(x, y, pch=21, bg="slateblue", las=1)
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
## -4.472 -1.106  0.105  1.160  4.398 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  -0.5251     0.4204   -1.25     0.21    
## x             2.0337     0.0367   55.36   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.88 on 98 degrees of freedom
## Multiple R-squared:  0.969,	Adjusted R-squared:  0.969 
## F-statistic: 3.06e+03 on 1 and 98 DF,  p-value: <2e-16
```


So note that the estimated slope for the regression line is
2.03.

### Tables

To include a table, use `kable` in the knitr package or `xtable` in
the xtable package.

`kable` is simpler but has few options.


```r
coef_tab <- summary(out)$coef
kable(summary(out)$coef, format="html",
      digits=2)
```

<table>
 <thead>
  <tr>
   <th align="left">   </th>
   <th align="right"> Estimate </th>
   <th align="right"> Std. Error </th>
   <th align="right"> t value </th>
   <th align="right"> Pr(>|t|) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td align="left"> (Intercept) </td>
   <td align="right"> -0.53 </td>
   <td align="right">  0.42 </td>
   <td align="right"> -1.25 </td>
   <td align="right">  0.21 </td>
  </tr>
  <tr>
   <td align="left"> x </td>
   <td align="right">  2.03 </td>
   <td align="right">  0.04 </td>
   <td align="right"> 55.36 </td>
   <td align="right">  0.00 </td>
  </tr>
</tbody>
</table>


`xtable` gives you more complete control.


```r
library(xtable)
tab <- xtable(coef_tab, digits=c(0, 2, 2, 1, 3))
print(tab, type="html")
```

<!-- html table generated in R 3.0.2 by xtable 1.7-1 package -->
<!-- Fri Feb  7 10:17:58 2014 -->
<TABLE border=1>
<TR> <TH>  </TH> <TH> Estimate </TH> <TH> Std. Error </TH> <TH> t value </TH> <TH> Pr(&gt |t|) </TH>  </TR>
  <TR> <TD align="right"> (Intercept) </TD> <TD align="right"> -0.53 </TD> <TD align="right"> 0.42 </TD> <TD align="right"> -1.2 </TD> <TD align="right"> 0.215 </TD> </TR>
  <TR> <TD align="right"> x </TD> <TD align="right"> 2.03 </TD> <TD align="right"> 0.04 </TD> <TD align="right"> 55.4 </TD> <TD align="right"> 0.000 </TD> </TR>
   </TABLE>


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
## [1] xtable_1.7-1 knitr_1.5.22
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.1 formatR_0.10   stringr_0.6.2  tools_3.0.2
```

