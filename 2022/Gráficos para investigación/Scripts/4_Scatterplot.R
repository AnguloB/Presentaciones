# Scatterplot

# Get the Data
library(tidytuesdayR)

# Or read in the data manually
#https://github.com/rfordatascience/tidytuesday/blob/master/data/2022/2022-01-18/readme.md
chocolate <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-18/chocolate.csv')

library(tidyverse)
library(jtools)
#Gráfico simple con geom_point

chocolate %>% 
  ggplot(aes(x =  review_date, y = rating)) +
  geom_point() +
  labs(x = "", 
       title = "Valoración según año", 
       y = "Valoración (1-5)", 
       x = "Año de valoración", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  ylim(1,4) +
  theme_apa() 
  
ggsave(device= NULL, filename = "Figure18.png", width = 6,height = 4, scale =1.2)

#Gráfico simple con geom_jitter

chocolate %>% 
  ggplot(aes(x =  review_date, y = rating)) +
  geom_jitter() +
  labs(x = "", 
       title = "Valoración según año", 
       y = "Valoración (1-5)", 
       x = "Año de valoración", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  ylim(1,4) +
  theme_apa() 

ggsave(device= NULL, filename = "Figure19.png", width = 6, height = 4, scale =1.2)

# Improving visualization 

chocolate %>% 
  mutate(classificacion  = as.numeric(str_remove(cocoa_percent, "%"))) %>% 
  mutate(classificacion = case_when(
    classificacion <=49 ~ "<50%", 
    classificacion <=59 ~ "<60%", 
    classificacion <=69 ~ "<70%", 
    classificacion <=79 ~ "<80%", 
    classificacion <=89 ~ "<90%", 
    classificacion <=100 ~ "90% a 100%")) %>% 
  ggplot(aes(x =  review_date, y = rating, color = classificacion)) +
  geom_jitter() +
  labs(x = "", 
       title = "Valoración según año y pureza del chocolate", 
       y = "Valoración (1-5)", 
       x = "Año de valoración", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  ylim(1,4) +
  theme_apa() +
  scale_color_manual(values = c("#ede0d4","#e6ccb2","#ddb892","#b08968","#7f5539","#997761"))
ggsave(device= NULL, filename = "Figure20.png", width = 6, height = 4, scale =1.2)

