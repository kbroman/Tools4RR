<link href="http://kevinburke.bitbucket.org/markdowncss/markdown.css" rel="stylesheet"></link>
<link href="http://kbroman.org/qtlcharts/assets/vignettes/markdown_modified.css" rel="stylesheet"></link>

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

![plot of chunk scatterplot](figure/scatterplot-1.png) 

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
##     Min      1Q  Median      3Q     Max 
## -4.4716 -1.1059  0.1049  1.1597  4.3980 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept) -0.52511    0.42037  -1.249    0.215    
## x            2.03365    0.03673  55.362   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.884 on 98 degrees of freedom
## Multiple R-squared:  0.969,	Adjusted R-squared:  0.9687 
## F-statistic:  3065 on 1 and 98 DF,  p-value: < 2.2e-16
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
   <th style="text-align:left;">   </th>
   <th style="text-align:right;"> Estimate </th>
   <th style="text-align:right;"> Std. Error </th>
   <th style="text-align:right;"> t value </th>
   <th style="text-align:right;"> Pr(&gt;|t|) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> (Intercept) </td>
   <td style="text-align:right;"> -0.53 </td>
   <td style="text-align:right;"> 0.42 </td>
   <td style="text-align:right;"> -1.25 </td>
   <td style="text-align:right;"> 0.21 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> x </td>
   <td style="text-align:right;"> 2.03 </td>
   <td style="text-align:right;"> 0.04 </td>
   <td style="text-align:right;"> 55.36 </td>
   <td style="text-align:right;"> 0.00 </td>
  </tr>
</tbody>
</table>

`xtable` gives you more complete control.


```r
library(xtable)
tab <- xtable(coef_tab, digits=c(0, 2, 2, 1, 3))
print(tab, type="html")
```

<!-- html table generated in R 3.1.2 by xtable 1.7-4 package -->
<!-- Tue Dec  2 10:02:25 2014 -->
<table border=1>
<tr> <th>  </th> <th> Estimate </th> <th> Std. Error </th> <th> t value </th> <th> Pr(&gt;|t|) </th>  </tr>
  <tr> <td align="right"> (Intercept) </td> <td align="right"> -0.53 </td> <td align="right"> 0.42 </td> <td align="right"> -1.2 </td> <td align="right"> 0.215 </td> </tr>
  <tr> <td align="right"> x </td> <td align="right"> 2.03 </td> <td align="right"> 0.04 </td> <td align="right"> 55.4 </td> <td align="right"> 0.000 </td> </tr>
   </table>

### It's usually best to end with session information


```r
sessionInfo()
```

```
## R version 3.1.2 (2014-10-31)
## Platform: x86_64-apple-darwin13.4.0 (64-bit)
## 
## locale:
## [1] C
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] xtable_1.7-4 knitr_1.8   
## 
## loaded via a namespace (and not attached):
## [1] evaluate_0.5.5 formatR_1.0    highr_0.4      stringr_0.6.2 
## [5] tools_3.1.2
```
