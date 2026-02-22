library(ggplot2)
library(dplyr)

raw <- read.csv('fig1.csv',header=TRUE)
data <- tibble(raw)
fig1 <- ggplot(data)+
     geom_point(aes(x=t_s,y=y_m,color=type))+
     geom_abline(intercept=0.99,slope=-2,color='cyan')+
     geom_abline(intercept=1.07,slope=-0.53,color='pink')+
     xlab('$t$, \\unit{\\second}')+
     ylab('$y$, \\unit{\\meter}')+
     theme_bw(base_size=8)+
     theme(legend.position="inside",
	legend.position.inside=c(0.95,0.95),
	legend.justification.inside=c("right","top"),
	legend.key.size=unit(4,"pt"),
	legend.title=element_blank())
ggsave('fig1.svg',plot=fig1,width=3.4167,height=2,units="in")



penny <- filter(tibble(read.csv('fig1pruned.csv',header=TRUE)),
      type=='penny')
feather <- filter(tibble(read.csv('fig1pruned.csv',header=TRUE)),
      type=='feather')
modelp = lm(y_m~t_s,penny)
modelf = lm(y_m~t_s,feather)
print(summary(modelp))
print(summary(modelf))
      


raw2 <- read.csv('fig2.csv',header=TRUE)
data2 <- tibble(raw2)
fig2 <- ggplot(data2)+
     geom_point(aes(x=t_s,y=y_m,color=type))+
     geom_abline(intercept=1.007,slope=-0.808,color='black')+
     xlab('$t$, \\unit{\\second}')+
     ylab('$y$, \\unit{\\meter}')+
     theme_bw(base_size=8)+
     theme(legend.position="inside",
	legend.position.inside=c(0.95,0.95),
	legend.justification.inside=c("right","top"),
	legend.key.size=unit(4,"pt"),
	legend.title=element_blank())
ggsave('fig2.svg',plot=fig2,width=3.4167,height=2,units="in")

# do stats on if velocities are different for air versus no air
model21 = lm(y_m~t_s,data2)
model22 = lm(y_m~t_s:type,data2)
print(anova(model21,model22))
print(summary(model21))





# what is strange here is that in no air, the penny slowed down to be as slow
# as the feather (not that the feather sped up to be as fast as the penny)?
# are these data correct?

# stats
pruned = tibble(read.csv('fig1pruned.csv',header=TRUE))
model11 = lm(y_m~t_s,pruned)
model12 = lm(y_m~t_s:type,pruned)
print(anova(model11,model12))