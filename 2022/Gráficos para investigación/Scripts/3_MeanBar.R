#Mean bar

# Get the Data
library(tidytuesdayR)

# Or read in the data manually
#https://github.com/rfordatascience/tidytuesday/blob/master/data/2022/2022-01-18/readme.md
chocolate <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-18/chocolate.csv')

library(tidyverse)
library(jtools)
#Gráfico simple
# Por simplicidad es con sd y no con IC

chocolate %>% 
  group_by(company_location) %>% 
  mutate(M = mean (rating)) %>%  #Creo la media
  mutate(SD = sd(rating)) %>%  #Creo la SD
  mutate(total = n()) %>%  #Obtengo el total de ocurrencias por company location
  filter(total >=50) %>%  #me quedo solo con aquellos paises que tienen mas de 50 ocurrencias
  select(company_location, M, SD) %>%  #me quedo solo con las variables que voy a usar
  unique() %>%  #solo me quedo con las ocurrencias unicas
  ggplot(aes(x =  company_location, y = M)) +
  geom_point() +
  labs(x = "", 
       title = "Lugar de la compañia y valoración promedio", 
       subtitle = "Solo incluidas compañias con más de 50 ocurrencias", 
       y = "Media (1-5)", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  ylim(0,5) +
  theme_apa() 
  
ggsave(device= NULL, filename = "Figure16.png", width = 6, height = 4, scale =1.2)

# Cambiamos el tamaño del punto y añadimos texto
chocolate %>% 
  group_by(company_location) %>% 
  mutate(M = mean (rating)) %>%  #Creo la media
  mutate(SD = sd(rating)) %>%  #Creo la SD
  mutate(total = n()) %>%  #Obtengo el total de ocurrencias por company location
  filter(total >=50) %>%  #me quedo solo con aquellos paises que tienen mas de 50 ocurrencias
  select(company_location, M, SD) %>%  #me quedo solo con las variables que voy a usar
  unique() %>%  #solo me quedo con las ocurrencias unicas
  ggplot(aes(x =  company_location, y = M, label = round(M, 1))) +
  geom_point(size = 8) +
  geom_errorbar(aes(ymin = M - SD, ymax=M + SD), width=.2,
                position=position_dodge(.9))+
  geom_text(color = "white")+
  labs(x = "", 
       title = "Lugar de la compañia y valoración promedio", 
       subtitle = "Solo incluidas compañias con más de 50 ocurrencias", 
       y = "Media (1-5)", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  ylim(0,5) +
  theme_apa() 

ggsave(device= NULL, filename = "Figure17.png", width = 6, height = 4, scale =1.2)

