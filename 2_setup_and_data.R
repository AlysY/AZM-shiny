###**********************###
### Arid Zone Monitoring ###
###**********************###
# Project aim:
#
# Author: Alys Young
#
# Collaborators: Sarah Legg, Naomi Indigo, Anja Skroblin, Darren Southwell
#
# Date: Sept 2021
#
# Script aim: Load data


## Install packages
# if(!require(shiny)) install.packages('shiny')
# if(!require(shinythemes)) install.packages('shinythemes')
# if(!require(tidyverse)) install.packages('tidyverse')
# if(!require(plotly)) install.packages('plotly')
# if(!require(leaflet)) install.packages('leaflet')
# if(!require(sf)) install.packages('sf')
# if(!require(ggplot2)) install.packages('ggplot2')
# if(!require(DT)) install.packages('DT')

# must install leafpop


# Set up ------------------------------------------------------------------

## Load packages
library(shiny)       # to run Shiny
library(shinythemes) # pre-made themes
library(tidyverse)   # load other tidy packages: dplyr, tidyr, stringr, ggplot2
#library(dplyr)
#library(tidyr)
#library(stringr)
#library(ggplot2)
library(purrr) ## for set_names
#library(plotly)      # interactive plots
library(leaflet)    # maps
library(sf)
library(leafpop)

# Set the coordinate reference system
# required to plot with leaflet
Longlat_crs <- st_crs("+proj=longlat +datum=WGS84")


## get the crs
# this should not be in use
# AZM_crs <- st_crs(Aus)



# Data --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


## National PA dataset - cleaned
# created in another script from the Presence only AZM data
# The following steps were done:
  # Change date to a date format
  # create column for the year and decade from the data
  # Clean the common name, group class to remove _ and . from the names
  # double check there are no absences

df_P_nodate <- read.csv("www/data/AZM_Pdata_CleanedForShiny.csv")

df_PA <- df_P_nodate %>%
  filter(Year > 1970)

## Animal data from the factsheets
sp_data <- read.csv("www/data/species_information.csv")
#colnames(sp_data)[1] <- "Common_name"

## Clean the data
sp_data <- sp_data %>%
  mutate("ALA URL" = paste0("<a href='",  ALA,"'>", Common_name, ", click here. </a>"),
         "Factsheet URL" = paste0("<a href='",  Factsheet,"'>", Common_name, ", click here. </a>")
         )
# mutate("Factsheet URL" = paste0("<a href='",  factsheet,"'>", Common_name, ", click here. </a>"))

## Data  providers
dataprov <- read.csv("www/data/DataProvider_SpeciesList.csv")




# Spatial data ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Australia
Aus <- st_read("www/data/spatial/Aus.gpkg") %>%
  st_transform(Longlat_crs)

States <- st_read("www/data/spatial/States.gpkg") %>%
  st_transform(Longlat_crs)

## Bioregions
Bioregions <- st_read("www/data/spatial/IBRA7.gpkg") %>%
  st_transform(Longlat_crs)

## AZM boundaries
AZM_bounds <- st_read("www/data/spatial/AZM_bounds.gpkg") %>%
  st_transform(Longlat_crs)

## data providers map
AZM_provider <- st_read("www/data/spatial/AZM_Polygons_data.gpkg") %>%
  st_transform(Longlat_crs)

## Location of the sites
sf_sites <- st_read("www/data/spatial/AZM_survey_sites.gpkg") %>%
  st_transform(Longlat_crs)


## detections over time
# sf_decade_80 <- st_read("www/data/AZM_survey_decade_80.gpkg")
# sf_decade_8090 <- st_read("www/data/AZM_survey_decade_80_90.gpkg")
# sf_decade_809000 <- st_read("www/data/AZM_survey_decade_80_90_00.gpkg")
# sf_decade_80900010 <- st_read("www/data/AZM_survey_decade_80_90_00_10.gpkg")

sf_decade_1980 <- st_read("www/data/spatial/AZM_survey_decade_80.gpkg")
sf_decade_1990 <- st_read("www/data/spatial/AZM_survey_decade_90.gpkg")
sf_decade_2000 <- st_read("www/data/spatial/AZM_survey_decade_00.gpkg")
sf_decade_2010 <- st_read("www/data/spatial/AZM_survey_decade_10.gpkg")

