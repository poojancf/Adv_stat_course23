library(tidyverse)
data("iris")
View(iris)

##convert wide data to long data
#also separate columns for part and measurement

long_iris<-iris %>% pivot_longer(cols = -Species, names_to = "variable", values_to = "value") %>% 
  separate_wider_delim(variable, ".", names = c("part", "measurement"))
 #separate(variable, into = c("part", "measurement"))
head(long_iris)


## produce mean, se and confidence interval for each species, part and measurement
iris_sum<- long_iris %>%  group_by(Species,part, measurement) %>% 
  summarise(mean= mean(value), std.err= mean_se(value), n= n())
iris_sum

