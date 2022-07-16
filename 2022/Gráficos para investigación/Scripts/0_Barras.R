#Gráfico de barras

# Get the Data
library(tidytuesdayR)

# Or read in the data manually
#https://github.com/rfordatascience/tidytuesday/blob/master/data/2022/2022-01-18/readme.md
chocolate <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-18/chocolate.csv')

library(tidyverse)
#Gráfico de columnas/barras básico
chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  group_by(company_location) %>% 
  count() %>% 
  ggplot(aes(x = company_location, y = n)) +
  geom_col()

ggsave(device= NULL, filename = "Figure1.png", width = 6, height = 4, scale =1.2)


#Cambiamos el orden reorder
chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  group_by(company_location) %>% 
  count() %>% 
  ggplot(aes(x = reorder(company_location, -n), y = n)) +
  geom_col() 
ggsave(device= NULL, filename = "Figure2.png", width = 6, height = 4, scale =1.2)


# Añadimos título(s)
chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  group_by(company_location) %>% 
  count() %>% 
  ggplot(aes(x = reorder(company_location, -n), y = n)) +
  geom_col() +
  labs(title = "Chocolate 100% cacao", 
       subtitulo = "Número de chocolates según localización de la compañia", 
       x = "Lugar de la compañia", 
       y = "Total", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa")

ggsave(device= NULL, filename = "Figure3.png", width = 6,height = 4, scale =1.2)

# Como personalizar el fondo predefinido (1)
chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  group_by(company_location) %>% 
  count() %>% 
  ggplot(aes(x = reorder(company_location, -n), y = n)) +
  geom_col() +
  labs(title = "Chocolate 100% cacao", 
       subtitulo = "Número de chocolates según localización de la compañia", 
       x = "Lugar de la compañia", 
       y = "Total", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  theme_bw()

ggsave(device= NULL, filename = "Figure4.png", width = 6, height = 4, scale =1.2)

# Como personalizar el fondo predefinido (2)
chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  group_by(company_location) %>% 
  count() %>% 
  ggplot(aes(x = reorder(company_location, -n), y = n)) +
  geom_col() +
  labs(title = "Chocolate 100% cacao", 
       subtitulo = "Número de chocolates según localización de la compañia", 
       x = "Lugar de la compañia", 
       y = "Total", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  theme_light()

ggsave(device= NULL, filename = "Figure5.png", width = 6, height = 4, scale =1.2)

# Otros themes que se pueden instalar
library(jtools)

chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  group_by(company_location) %>% 
  count() %>% 
  ggplot(aes(x = reorder(company_location, -n), y = n)) +
  geom_col() +
  labs(title = "Chocolate 100% cacao", 
       subtitulo = "Número de chocolates según localización de la compañia", 
       x = "Lugar de la compañia", 
       y = "Total", 
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  theme_apa()

ggsave(device= NULL, filename = "Figure6.png", width = 6, height = 4, scale =1.2)

