###**********###
### Plotting ###
###**********###
# Project aim: Arid Zone Monitoring shiny app
#
# Author: Alys Young
#
# Collaborators:
#
# Date: Oct 2021
#
# Script aim: Creating the plotting and aesthetic elements fo


# Colours ------------------------------------------------------------------------------------------------------------------

## NESP TSR hub colours
# main green colour  #387469

## Shiny colours
# Blue colour of help text #587DA4 
# Grey of sidebar panel    #ECF0F1


## Plotting colours
# Background of Map #D8DAC9 
# Red around AZM    #A03A0A 
# Red colour points #A03A0A 
# Blue points       #1159CA

# # Data providers
# Government #FB0301
# Indigenous #014CA8
# Industry   #6FA900
# NGO        #9E9E9
# NRM        #8A5A44
# University #FFAE07



## Colour palette ------------------------------------------------------------------------------------------------------------------
# The spare colours are commented out
# if new categories are added in the data, need to add them to the colour palette

AZM_palette <- list(
  
  ## Data Providers
  `Providers`    = c(
    `Government` = "#FB0301",
    `Indigenous` = "#014CA8", 
    `Industry`   = "#6FA900", 
    `NGO`        = "#9E9E9E", 
    `NRM`        = "#8A5A44",
    `University` = "#FFAE07"),
  
  ## Data Providers
  `Plots` = c(
    `1`   = "#A03A0A", # Dark red for AZM boundary
    `2`   = "#014CA8", # Blue for detections
    `3`   = "#7A7A7A"), # black for non-detections
  
  ## Animal groups
  `Groups`              = c(
    `Mammal`            = "blue4",
    `Bird`              = "slateblue", 
    `Reptile`           = "green4", 
    `Invertebrate`      = "darkorchid4", 
    `Frog`              = "darkred",
    `Introduced mammal` = "dodgerblue2",
    `Selected`          = "yellow")
  
  # Other potentials:
  # Group of species - bird, mammal, reptile
  # Type of animal - invasive mammal, native mammal
)


# Change heat colour palette into a gradient
pal_provider <- colorFactor(AZM_palette$Providers, domain = partners)
pal_plot <- colorFactor(AZM_palette$Plots, domain = 1:3)


# CSS ----------------------------------------------------------------------------------------------------------------------

css <- HTML("body {font-size: 18px;
            color: #387469;
            line-height: 2;}
            
            a {color: #000000;}
            
            .nav-tabs>li.active>a, .nav-tabs>li.active>a:hover, .nav-tabs>li.active>a:focus {color: #387469;
            border: 3px solid #ecf0f1;
            }
            
            .navbar-default .navbar-nav>.active>a, .navbar-default .navbar-nav>.active>a:hover, .navbar-default .navbar-nav>.active>a:focus {background-color: #000000;}
            
            .navbar-default {background-color: #387469;}
            .navbar-nav {float: none !important;}
            .navbar-nav > li:nth-child(7) {float: right;}
            
            .form-control {font-size: 18px;}
            
            .nav-tabs {border-bottom: 3px solid #ecf0f1;}
            
            .help-block {color: #000000;}
            ")

#  .help-block {font-size: 15px;

# Base map -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Set the ggplot theme
theme_set(theme_classic())

## GGPlot - 
# g <- ggplot() +
#   geom_sf(data = Aus, fill = "#D8DAC9", color = "#000000") +
#   geom_sf(data = States, color = "#000000") +
#   geom_sf(data = AZM_bounds, fill = NA, color = "#A03A0A")
# 

## Leaflet
l <- leaflet() %>% 
  setView(lng = 132,  lat = -25, zoom = 5) %>%
  addProviderTiles(providers$CartoDB.Positron,
                   options = providerTileOptions(minZoom = 4, maxZoom = 5)) %>%
  addPolygons(data = AZM_bounds,
              fill = FALSE,
              opacity = 0.9,
              color = ~pal_plot(1))











# Histogram by animal selected --------------------------------------


df_result_sp <- df_P_nodate %>% 
  select(CommonName, Group_class) %>%
  mutate(invasive = ifelse(Group_class ==  "Introduced_mammal", 1, 0)) %>%
  group_by(CommonName) %>%
  summarise(n = n(),
            invasive_mam = unique(invasive),
            Group_class = unique(Group_class)) %>%
  filter(n > 1) %>%
  arrange(invasive_mam, desc(n))

df_result_sp$CommonName <- factor(df_result_sp$CommonName, levels = rev(unique(df_result_sp$CommonName)))


## plot and then add later
g_result_sp <- ggplot() +
  coord_flip() +
  scale_fill_manual(values = AZM_palette$Groups) +
  theme(text = element_text(size = 12),
        #legend.position = "none"
  )




# Histogram by place --------------------------------------

g_result_place <- ggplot() +
  labs(y = "Number of detections", x = "Animal", fill = "Type of animal") +
  coord_flip() +
  theme(text = element_text(size = 14))





# Data by jurisdiction ----------------------------------------------------
# All histograms/bar plots by state

# Figure 1 - number of sites
# Figure 2 - number of site visits
# Figure 3 - number of species detection

## Figure 1
# unique site by 1km cell
df_f1 <- df_P_nodate %>%
  select(Cell.ID.1km, State) %>%
  unique() %>%
  group_by(State) %>%
  mutate(total = n()) %>%
  select(State, total) %>%
  unique() %>%
  arrange(State)

s_NT <- df_f1$total[df_f1$State == "NT"]
s_QLD <- df_f1$total[df_f1$State == "QLD"]
s_SA <- df_f1$total[df_f1$State == "SA"]
s_WA <- df_f1$total[df_f1$State == "WA"]

Num1 <- ggplot(data = df_f1, aes(x = State, y = total)) +
  geom_bar(stat = "identity", fill = "#1159CA") +
  coord_cartesian(ylim = c(0, 4000)) + 
  labs(y = "Number of sites", x = "") +
  theme(text = element_text(size = 20)) +
  annotate("text", x = 1, y = s_NT + 100, label = s_NT, size = 5) +
  annotate("text", x = 2, y = s_QLD + 100, label = s_QLD, size = 5) +
  annotate("text", x = 3, y = s_SA + 100, label = s_SA, size = 5) +
  annotate("text", x = 4, y = s_WA + 100, label = s_WA, size = 5)



## Figure 2
df_f2 <- df_P_nodate %>%
  select(Cell.ID.1km, Date, State) %>%
  unique() %>%
  group_by(State) %>%
  mutate(total = n()) %>%
  select(State, total) %>%
  unique() %>%
  arrange(State)

sv_NT <- df_f2$total[df_f2$State == "NT"]
sv_QLD <- df_f2$total[df_f2$State == "QLD"]
sv_SA <- df_f2$total[df_f2$State == "SA"]
sv_WA <- df_f2$total[df_f2$State == "WA"]

Num2 <- ggplot(data = df_f2, aes(x = State, y = total)) +
  geom_bar(stat = "identity", fill = "#1159CA") +
  coord_cartesian(ylim = c(0, 10000)) + 
  labs(y = "Number of site visits", x = "") +
  theme(text = element_text(size = 20)) +
  annotate("text", x = 1, y = sv_NT + 400, label = sv_NT, size = 5) +
  annotate("text", x = 2, y = sv_QLD + 400, label = sv_QLD, size = 5) +
  annotate("text", x = 3, y = sv_SA + 400, label = sv_SA, size = 5) +
  annotate("text", x = 4, y = sv_WA + 400, label = sv_WA, size = 5)


## Figure 3
df_f3 <- df_P_nodate %>%
  select(State) %>%
  group_by(State) %>%
  mutate(total = n()) %>%
  select(State, total) %>%
  unique() %>%
  arrange(State)

n_NT <- df_f3$total[df_f3$State == "NT"]
n_QLD <- df_f3$total[df_f3$State == "QLD"]
n_SA <- df_f3$total[df_f3$State == "SA"]
n_WA <- df_f3$total[df_f3$State == "WA"]

Num3 <- ggplot(data = df_f3, aes(x = State, y = total)) +
  geom_bar(stat = "identity", fill = "#1159CA") +
  coord_cartesian(ylim = c(0, 25000)) + 
  labs(y = "Number of animal detections", x = "") +
  theme(text = element_text(size = 20)) +
  annotate("text", x = 1, y = n_NT + 1000, label = n_NT, size = 5) +
  annotate("text", x = 2, y = n_QLD + 1000, label = n_QLD, size = 5) +
  annotate("text", x = 3, y = n_SA + 1000, label = n_SA, size = 5) +
  annotate("text", x = 4, y = n_WA + 1000, label = n_WA, size = 5)

