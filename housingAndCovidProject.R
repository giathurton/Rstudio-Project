data = read.csv("housingAndCovidData.csv")
data$period_begin <- as.Date(data$period_begin, format = "%Y-%m-%d")
data$period_end <- as.Date(data$period_end, format = "%Y-%m-%d")

# This is to create a histogram from manipulated redfin housing data only focusing on the pittsburgh area
# This is compared to the data from manipulated new york times covid data also focusing on the pittsburgh area
# The data begins on March 9th of 2020 and ends on November 8th of 2020

library(ggplot2)
ggplot(mapping = aes(x, y)) +
  geom_bar(data = data.frame(x = data$period_begin, y = data$median_price_mapped), stat = 'identity', fill = "black") +
  geom_bar(data = data.frame(x = data$period_begin, y = data$cases_mapped), stat = 'identity', fill = 'yellow', width = 3) +
  theme_classic() + scale_y_continuous(expand = c(0, 0))

# We decided to use ggplot because it has the best tools for comparing two peices inforamtion of one graph
# The built in aes funciton or aesthetic mapping tool helped us to put the data against each other


ccf(data$cases, data$median_sale_price)
# we used the ccf function to make an autocorrelation graph that states that there is a correlation between covid cases and median sale prices 
