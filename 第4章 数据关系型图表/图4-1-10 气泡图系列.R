
#EasyCharts团队出品，
#如有问题修正与深入学习，可联系微信：EasyCharts

library(ggplot2)
library(RColorBrewer)
library(ggrepel)
attach(mtcars)

head(mtcars)

 #-------------------------------(c) 带数据标签的气泡图-------------------------------------------------------------

 ggplot(data=mtcars, aes(x=wt,y=mpg))+
   geom_point(aes(size=disp,fill=disp),shape=21,colour="black",alpha=0.8)+
   scale_fill_gradient2(low="#377EB8",high="#E41A1C",midpoint = mean(mtcars$disp))+
   geom_text_repel(label = disp )+
   scale_size_area(max_size=12)+
   guides(size = guide_legend((title="Value")),
          fill = guide_legend((title="Value")))+
   theme(
     legend.text=element_text(size=10,face="plain",color="black"),
     axis.title=element_text(size=10,face="plain",color="black"),
     axis.text = element_text(size=10,face="plain",color="black"),
     legend.position = "right"
   )

#--------------------------(d) 方块状的气泡图--------------------------------------------------
ggplot(mtcars, aes(wt,mpg))+
  geom_point(aes(size=disp,fill=disp),shape=22,colour="black",alpha=0.8)+
  scale_fill_gradient2(low=brewer.pal(7,"Set1")[2],high=brewer.pal(7,"Set1")[1],
                       midpoint = mean(mtcars$disp))+
  scale_size_area(max_size=12)+
  guides(fill = guide_legend((title="Value")),
         size =  guide_legend((title="Value")))+
  theme(
    text=element_text(size=15,color="black"),
    plot.title=element_text(size=15,family="myfont",face="bold.italic",color="black")#,
    #legend.position=c(0.9,0.05)
  )


#-------------------------------(c) 带数据标签的气泡图，有拟合-------------------------------------------------------------
# 要对repel进行配置：https://mran.microsoft.com/snapshot/2017-08-20/web/packages/ggrepel/vignettes/ggrepel.html
# 图例的要水平摆放，且放进图片中。

ggplot(data=mtcars, aes(x=wt,y=mpg))+
  geom_point(aes(size=disp,fill=disp),shape=21,colour="white",alpha=0.8)+
  
  geom_smooth(method="lm", se=FALSE, formula=y ~ log(x), colour="#728893", linetype = "dashed")+
  
  scale_fill_gradient2(low="#E7C68C", mid="#AED0BD", high="#1F4F70", midpoint = mean(mtcars$disp))+ # 汽泡填充颜色的范围

  geom_text_repel(
    label = disp, 
    fontface = 'plain', 
    color = '#626160', 
    # box.padding = unit(0.5, "lines"),
    point.padding = unit(6, "lines"),
    size = 3)+ # 汽泡文字
  scale_size_area(max_size=8)+ # 汽泡面积最大值
  scale_y_continuous(position = "right")+ # Y轴的刻度放置在右边
  guides(size = guide_legend((title="Value")), fill = guide_legend((title="Value")))+ # 图例
  theme(
    legend.text = element_text(size=10, face="plain", color="black"),
    axis.title = element_text(size=10, face="plain", color="black"),
    axis.text = element_text(size=10, face="plain", color="black"),
    axis.line = element_line(size = 0.5, linetype = "solid", colour = "#CCCCCD"),
    panel.background = element_rect(fill = "white"),
    legend.position = "right",
    panel.grid.major = element_line(colour = "#CCCCCD"),
    panel.grid.minor = element_line(colour = "white")
  )













