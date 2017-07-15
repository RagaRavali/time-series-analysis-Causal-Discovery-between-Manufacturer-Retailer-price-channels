Causal Discovery between Manufacturer-Retailer price channels

Identifying the strategy employed by business firms has motivated empirical research towards
studying a firm’s behavior. If there exists a specific pattern that can describe the interactions
between the manufacturers and retailers, the application of causality analysis on their pricing
interaction can clarify their strategic behavior.
The interactions between the manufacturer and retailer can be discussed to follow a verticalintegrated
system or Stackelberg leadership bilateral-monopoly model. In a vertical-integrated
system, the manufacturer and retailer cooperate to maximize the profit of the distribution
channel instead of individual profit. The important character of this model is that both the
manufacturer and retailer affect the sales of the product.
In the Stackelberg leadership modeling, the Stackelberg leader anticipates the response of his
opponents with respect to his strategy while his followers do not know how their behavior
affect the leader’s strategic choice. Thus, the Stackelberg leader enjoys a major share of the
profit and has a stronger pricing power than the follower. To illustrate this, a Retailer Stackelbeg
leader can manipulate the manufacturer’s price and in case of Manufacturer Stackelberg leader,
the manufacturer can manipulate the retailer’s price to maximize his profit.
The goal of this project is to observe whether the system comprising of the manufacturer’s
price, retailer’s price and quantity of soft drinks sold, follows a vertical-integrated system or a
Stackelberg leader model. This project will give insight into studying strategic interaction
between firms using causal discovery methods.

Dataset:
time series data set contains three variables namely QTY, RPRICE, and
MPRICE. The data was collected on a weekly basis at the Dominick’s Finer Foods supermarket in
the Chicago area and made available by the University of Chicago’s Kilts Center.

What i did:

1. In order to remove the interdependencies among the variables in the time series data
set, a vector autoregressive model (VAR model) is built. The Schwartz Information
Criterion will be used to choose the optimal time lag in the VAR model. (assumption : trend is absent in the model)
2. The residuals obtained from the VAR model for each variable will be tested using the
Augmented Dickey-Fuller test at a significance level of 0.05 to detect if the time series is
stationary or not.
3. Checked if the residuals follow a Gaussian distribution using the Kolmogorov-Smirnov test
at a significance level of 0.05.
4. Built two causal graphs using the PC algorithm and LiNGAM algorithm. For the PC
algorithm set the significance level to 0.1 and for the LiNGAM algorithm set the prune
factor to 1.