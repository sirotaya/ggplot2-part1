# titanic is avaliable in your workspace
getwd( )
setwd("~/Desktop/Spingboard")
## Download the dataset and take care of the missing values
titanic = read.csv("titanic_original.csv", header = TRUE, na.strings = c("NA", ""), blank.lines.skip = TRUE)
titanic = titanic[1:1309, ] ## removing empty line nro 1310 in the end
library(ggplot2)

# Check out the structure of titanic
str(titanic)

# Using ggplot() for exploring the distribution of sexes within the classes of the ship
ggplot(titanic, aes(x = factor(pclass), fill = factor(sex))) + 
  geom_bar(position = "dodge")

# Using ggplot() to estimated the chances of survival
ggplot(titanic, aes(x = factor(pclass), fill = factor(sex))) + 
  geom_bar(position = "dodge") + 
  facet_grid(". ~ survived")


# Position jitter 
posn.j <- position_jitter(0.5, 0)

# Adding Age on y axis and making the scatter plot easier to read with geom_jitter() and coloring the Sex
ggplot(titanic, aes(x = factor(pclass), y = age, col = factor(sex))) + 
  geom_jitter(size = 3, alpha = 0.5, position = posn.j) + 
  facet_grid(". ~ survived")
