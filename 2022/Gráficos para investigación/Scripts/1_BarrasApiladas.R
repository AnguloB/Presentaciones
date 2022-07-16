#Gráfico de barras apiladas

# Get the Data
library(tidytuesdayR)

# Or read in the data manually
#https://github.com/rfordatascience/tidytuesday/blob/master/data/2022/2022-01-18/readme.md
chocolate <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-01-18/chocolate.csv')

library(tidyverse)
#Gráfico de columnas/barras básico
chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  mutate(valoracion = case_when(
    rating <= 2 ~ "malo", 
    rating <= 3.99 ~ "regular",
    rating >=4 ~ "excelente")) %>% 
  group_by(company_location, valoracion) %>% 
  count() %>% 
  ggplot(aes(x = company_location, y = n, fill = valoracion)) +
  geom_col()

ggsave(device= NULL, filename = "Figure7.png", width = 6, height = 4, scale =1.2)



# Añadimos título(s)

chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  mutate(valoracion = case_when(
    rating <= 2 ~ "malo", 
    rating <= 3.99 ~ "regular",
    rating >=4 ~ "excelente")) %>% 
  group_by(company_location, valoracion) %>% 
  count() %>% 
  ggplot(aes(x =  reorder(company_location, -n), y = n, fill = valoracion)) +
  geom_col() +
  labs(title = "Chocolate 100% cacao", 
       subtitulo = "Número de chocolates según localización de la compañia", 
       x = "Lugar de la compañia", 
       y = "Total", 
       fill = "Valoración",
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa")

ggsave(device= NULL, filename = "Figure9.png", width = 6, height = 4, scale =1.2)

# Cambiar fondo y color

chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  mutate(valoracion = case_when(
    rating <= 2 ~ "malo", 
    rating <= 3.99 ~ "regular",
    rating >=4 ~ "excelente")) %>% 
  group_by(company_location, valoracion) %>% 
  count() %>% 
  ggplot(aes(x =  reorder(company_location, -n), y = n, fill = valoracion)) +
  geom_col() +
  labs(title = "Chocolate 100% cacao", 
       subtitulo = "Número de chocolates según localización de la compañia", 
       x = "Lugar de la compañia", 
       y = "Proporción", 
       fill = "Valoración",
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  scale_fill_manual(values = c("grey31", "grey70")) + 
  theme_bw()

ggsave(device= NULL, filename = "Figure10.png", width = 6, height = 4, scale =1.2)


# 

chocolate %>% 
  filter(cocoa_percent == "100%") %>% 
  mutate(valoracion = case_when(
    rating <= 2 ~ "malo", 
    rating <= 3.99 ~ "regular",
    rating >=4 ~ "excelente")) %>% 
  group_by(company_location, valoracion) %>% 
  summarise(n = n()) %>%
  mutate(freq = n / sum(n)) %>% 
  ggplot(aes(x =  reorder(company_location, -freq), y = freq, fill = valoracion)) +
  geom_col() +
  labs(title = "Chocolate 100% cacao", 
       subtitulo = "Número de chocolates según localización de la compañia", 
       x = "Lugar de la compañia", 
       y = "Total", 
       fill = "Valoración",
       caption = "@AnguloBrunet \n Taller para @RLadiesVhsa") +
  scale_fill_manual(values = c("grey31", "grey70")) + 
  theme_bw()

ggsave(device= NULL, filename = "Figure11.png", width = 7, height = 4, scale =1.2)

