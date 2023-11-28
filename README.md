# business_management_and_administration_bachelor_thesis_2023
Source code of my Business Management and Administration Bachelor's Thesis. This project analyzes, with R, the adjustment of Bitcoin and Ethereum return distributions in order to determine which is more likely to give a given return. Also, it could constitute a part of a bigger analysis demanded by a possible future crypto investment decision.

Based on a previous analysis of returns over the duration of the investment period, in this analisis the position of an investor seeking returns after seven days was adopted.

- Section 3.1 develops the adjustment of the weekly returns of Bitcoin (3.1.1) and Ethereum (3.2.2). First, the candidate distributions are selected using the Cullen and Frey graph (skewness and kurtosis). Finally, the distribution to which the observed distribution is adjusted is defined following the log-likelihood and Akaike and Bayesian information criteria (AIC and BIC).

- Section 3.2 attempts to compare the probabilities of a given return occurring in both Bitcoin and Ethereum. To do this, it is necessary to necessary to use the probability density functions of the distributions we have previously adjusted for each cryptocurrency.

Author: Iván Hernández Roldán
