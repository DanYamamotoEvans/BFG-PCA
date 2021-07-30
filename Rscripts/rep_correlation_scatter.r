#!/usr/bin/env Rscript
if(require("ggplot2")){
  print("ggplot2 is loaded correctly")
} else {
  print("trying to install ggplot2...")
  install.packages("ggplot2")
  if(require("ggplot2")){
    print("ggplot2 installed and loaded")
  } else {
    stop("could not install ggplot2")
  }
}
if(require("scales")){
  print("scales is loaded correctly")
} else {
  print("trying to install scales...")
  install.packages("scales")
  if(require("scales")){
    print("scales installed and loaded")
  } else {
    stop("could not install scales")
  }
}
if(require("cowplot")){
  print("cowplot is loaded correctly")
} else {
  print("trying to install cowplot...")
  install.packages("cowplot")
  if(require("cowplot")){
    print("cowplot installed and loaded")
  } else {
    stop("could not install cowplot")
  }
}
if(require("grid")){
  print("grid is loaded correctly")
} else {
  print("trying to install grid...")
  install.packages("grid")
  if(require("grid")){
    print("grid installed and loaded")
  } else {
    stop("could not install grid")
  }
}
if(require("gridExtra")){
  print("gridExtra is loaded correctly")
} else {
  print("trying to install gridExtra...")
  install.packages("gridExtra")
  if(require("gridExtra")){
    print("gridExtra installed and loaded")
  } else {
    stop("could not install gridExtra")
  }
}

if(require("GGally")){
  print("GGally is loaded correctly")
} else {
  print("trying to install GGally...")
  install.packages("GGally")
  if(require("GGally")){
    print("GGally installed and loaded")
  } else {
    stop("could not install GGally")
  }
}
if(require("plyr")){
  print("plyr is loaded correctly")
} else {
  print("trying to install plyr...")
  install.packages("plyr")
  if(require("plyr")){
    print("plyr installed and loaded")
  } else {
    stop("could not install plyr")
  }
}


library(plyr)
library(ggplot2)
library(scales) # for muted function
library(gridExtra)
library(grid)
library(reshape2)
library(egg)

args = commandArgs(trailingOnly=TRUE)


data = read.csv(file=args[1],header=TRUE)
out       = args[2]
width_cm  = as.numeric(args[3])
height_cm = as.numeric(args[4])
p_width   = as.numeric(args[5])
p_height  = as.numeric(args[6])

data$group = paste(data$Condition,data$Replicate)
r1 = max(data$Rep1)[1]
r2 = max(data$Rep2)[1]
li = ceiling(log10( max(c(r1,r2 ))) )*1.1 
scatter  = 
  ggplot(data=data,
         aes(x=log10(Rep1+1),y=log10(Rep2+1)),color="#000000")+ 
  geom_point(alpha=0.3,size=0.2) + 
  scale_x_continuous(expand=c(0,0),limits=c(-0.1,li)) +  
  scale_y_continuous(expand=c(0,0),limits=c(-0.1,li ))+ 
  theme(
    axis.title=element_text(size=9.5,color="#000000"), 
    legend.position='none',
    legend.key = element_blank(), 
    strip.background = element_rect(color="#FFFFFF",fill="#FFFFFF"),
    panel.grid.minor = element_blank(),panel.grid.major = element_blank(),
    panel.spacing = unit(0.75, "lines"),
    panel.background = element_blank(),
    aspect.ratio=1.0,
    axis.ticks =element_line(color = "#000000", size = 0.5),
    axis.text.x = element_text(color="#000000",size=9.5),
    axis.text.y = element_text(color="#000000",size=9.5) ,
    panel.border = element_rect(color="#000000", fill = NA,size=1) 
  )+
  xlab(bquote( Log[10]~(~s["Replicate 1"]+1)))+
  ylab(bquote( Log[10]~(~s["Replicate 2"]+1)))+
  facet_wrap(~Condition,nrow = 1, scales = "free")

p <-set_panel_size(scatter,width  = unit(width_cm, "cm"),height = unit(height_cm, "cm"))
grid.newpage()
grid.draw(p)
ggsave(plot=p,out,height=p_height,width=p_width,units = "cm")

print("Computing Pearson correlation for each group....")

func <- function(xx,f1,f2)
{
  return(data.frame(COR = cor(log10(xx$Rep1+1), log10(xx$Rep2+1))))
}

ddply(data, .(group), func)