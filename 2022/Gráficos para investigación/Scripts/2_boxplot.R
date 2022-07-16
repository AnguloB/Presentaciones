#Boxpot

# Get the Data
library(tidytuesdayR)

# Or read in the data manually
#https://github.com/rfordatascience/tidytuesday/blob/master/data/2022/2022-01-18/readme.md
chocolate <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-18/chocolate.csv')

library(tidyverse)
#Gráfico simple

chocolate %>% 
  ggplot(aes(y = rating)) +
  geom_boxplot()
ggsave(device= NULL, filename = "Figure12.png", width = 6, height = 4, scale =1.2)

#Modificamos el eje x
chocolate %>% 
  ggplot(aes(y = rating, x = "Valoración")) +
  geom_boxplot() +
  labs(x = "")
ggsave(device= NULL, filename = "Figure13.png", width = 6, height = 4, scale =1.2)


# Acabamos de dejar correcto
chocolate %>% 
  ggplot(aes(y = rating, x = "Valoración")) +
  geom_boxplot() +
  ylim(1,5) + 
  labs(x = "", 
       title = "Chocolate 100% cacao", 
       subtitulo = "Valoración chocolate", 
       y = "Valoración (1-5)", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  theme_bw()
ggsave(device= NULL, filename = "Figure14.png", width = 6, height = 4, scale =1.2)

# Ejemplo por grupos (la visualización es redundante)
chocolate %>% 
  mutate(valoracion = case_when(
    rating <= 2 ~ "malo", 
    rating <= 3.99 ~ "regular",
    rating >=4 ~ "excelente")) %>% 
  mutate(valoracion  = factor(valoracion, levels = c("malo", "regular", "excelente"))) %>% 
  ggplot(aes(x = valoracion, y = rating)) +
  geom_boxplot() +
  ylim(1,5) + 
  labs(x = "", 
       title = "Chocolate 100% cacao", 
       subtitulo = "Valoración chocolate", 
       y = "Valoración (1-5)", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  theme_bw()

ggsave(device= NULL, filename = "Figure15.png", width = 6, height = 4, scale =1.2)



