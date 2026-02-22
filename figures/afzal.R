library(ggplot2)
library(dplyr)

raw <- read.csv('fig1.csv',header=TRUE)
data <- tibble(raw)
fig1 <- ggplot(data)+
     geom_point(aes(x=t_s,y=y_m,color=type))+
     xlab('$t$, \\unit{\\second}')+
     ylab('$y$, \\unit{\\meter}')



raw2 <- read.csv('fig2.csv',header=TRUE)
data2 <- tibble(raw2)
fig2 <- ggplot(data2)+
     geom_point(aes(x=t_s,y=y_m,color=type))+
     xlab('$t$, \\unit{\\second}')+
     ylab('$y$, \\unit{\\meter}')


# format graphs
# do stats on if velocities are different for air versus no air

# what is strange here is that in no air, the penny slowed down to be as slow
# as the feather (not that the feather sped up to be as fast as the penny)?
# are these data correct?
