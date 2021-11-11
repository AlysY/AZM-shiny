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
# Script aim: Load static object, images and videos

library(dplyr)

# Objects 
decades <- c( #"All" = "All",
             "1982 - 1989" = "1980s",
             "1990 - 1999" = "1990s",
             "2000 - 2009" = "2000s",
             "2010 - 2021" = "2010s")

partners <- c("Government",
              "Indigenous",
              "Industry",
              "NGO",
              "NRM",
              "University")

# lists of animals for the select input
animal_dect_options <- sort(unique(df_PA$CommonName))
# list_sp <- list_sp_by_category(sp_data) # OLD
list_sp_factsheet <- list_sp_by_category2(data = sp_data, grouping_category = "category", name_in_list = "Common_name")
list_sp_all <- list_sp_by_category2(data = df_PA, grouping_category = "Group_class", name_in_list = "CommonName")


list_sp_types <- sort(unique(sp_data$category))



# results_sp # <-  Presence absence dataset, common.name
# unique(df_PA$common.name) # need to replace all . and _ with a space when loading in as the options

# Social media
website_url <- text_to_code(website_url_clean)
website_message <- text_to_code(website_message_clean)



# Images

# Videos

