---
category: 999
---

# Mathematical Appendix

**By Maximilian Weylandt**

## Calculating the Regression Coefficient

For bivariate regressions, you can calculate the coefficient yourself. The equation is 

$$b = \frac{S_Y}{S_X}R$$

where $S_Y$ is the standard deviation in $Y$, $S_X$ is the standard deviation in $X$, and $R$ is the correlation between $X$ and $Y$. In our example on gender equality and education, the values are:\
$R = 0.83$\
$S_X = 2.95$\
$S_Y = 39.32$\
Try plugging them into the above equation and seeing whether you get the result you see in regression table, Table 8.3. (Don't worry if it's not exact, there's a fair amount of rounding going on).

## Significance Tests

*Calculating the p-value*

Note: this calculation presumes that you have understood the discussion about hypothesis testing earlier on in this book. If you are unsure, take a few minutes to refresh your memory on the contents of the chapter on _Hypothesis Testing_.

Our regression result suggests that $b=11.6$. However, this is an *estimate*, and therefore there is some uncertainty around this number, which is expressed in the standard error. Table 8.1 (and 2) tells us this error is $0.62$. Next, we need a decision rule: how unlikely do we think the p-value can be before we think this result is implausible? Let's set it as $\alpha=0.05$: if the probability of getting this particular $b$ is less than $5\%$ (assuming a world where the null hypothesis is true) we will reject the null hypothesis.

We can now calculate the Z-score, which standardizes our $b-value$ -- in other words, it tells us where it would fall on a standard normal distribution.

$$Z = \frac{|b-H_0|}{SE} = \frac{11.6}{0.62} \approx 18.71$$

We can now go to our Z-table and see what probability is associated with a large Z value. Your Z-table should indicate that the odds of getting a Z-value this large are very small. Our $p$ is much smaller than the $\alpha$ value set, so we reject the null hypothesis.

Make sure you understand the intuition behind that intuition. If null hypothesis is true and the real $b$ is 0, it would be *very weird* for us to get this result of 11.6 when calculating the regression line for our sample of countries. Given how weird it is, we might find the alternative hypothesis more plausible: maybe $b$ is not $0$ after all. Thus, we reject the null hypothesis.

*Confidence Interval* The formula for a confidence interval is fairly straightforward. You'll need the Z-score that corresponds to your desired degree of confidence. For example, for a $95\%$ level, $z\approx1.96$; for a $99\%$ level, $z\approx 2.58$.

The confidence Interval is: $$b \pm z \cdot SE$$

Let's say we want a 95% confidence interval. Then we'd have:

$b = 11.6$\
$z = 1.96$\
$SE = 0.62$

So the confidence interval is: 

$[b - z \cdot SE ; b + z\cdot SE]$\
$= [11.6 - 1.96 \cdot 0.62 ; 11.6 + 1.96 \cdot 0.62 ]$\
$= [10.4; 12.8]$

## Error Terms

The regression equations we wrote out above are technically incomplete. In papers, you will often encounter regression equations with an $e$ at the end, like this:

$$Y = a + b_{1}X_{1} + b_{2}X_{2} + e$$ The $e$ basically stands for our residuals, or the difference between what our regression predicts and what the data actually show, and is sometimes called *error term*. If you plug in any real $X$-value from the actual data, the $Y$ you get is likely to be slightly off, because our regression line is the best fit but does not hit all points. Both sides of an equation have to be equal, and so the error term is brought in to make the right hand side equal to the actual $Y$ at that $X$-value

## Logged Variables

While discussing our linear regression, we noted that GDP was not included directly as a control variable, but rather the log of GDP. We do this because we think that a one unit increase does not always mean the same thing across the range of possible values for our variable. Let's say we are talking about per capita GDP, in units of 1,000 dollars. The differences between a country with a per capita GDP of 1,000 USD and 10,000 USD are massive. (In our data, countries close to those values are Niger, one of the poorest countries in the world and Indonesia, the largest economy in Southeast Asia). Meanwhile, countries with per capita GDP of 38,000 vs 47,000 are likely quite similar, like France and the Netherlands. The extra 9,000 dollars (9 units) don't have the same effect across the range of values. Taking the log of GDP values allows us to 'flatten' the relationship, so that a unit change means a similar thing across $X$-values, but it does make the coefficient a bit harder to interpret. The unit of our variable went from 1 dollar in GDP/capita to the log of 1 dollar, which is not an intuitive number to plug into "an increase of 1 unit $X$ is associated with an increase of $b$ units of $Y$.\"

But there is a rule of thumb. When an X-variable is logged, we can say \"a 1% increase in X corresponds with a $b/100$ change in Y. In our example, that means that a 1% increase in per capita GDP is associated with a 0.159 point increase in the gender equality index.

You can calculate the change in $Y$ associated with other percentage increases ($p$) by using the formula $$\Delta Y = b \cdot \frac{100+p}{100}$$