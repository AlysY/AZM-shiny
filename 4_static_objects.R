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

# Objects 
decades <- c("1982 - 1989" = 1989,
             "1990 - 1999" = 1999,
             "2000 - 2009" = 2009,
             "2010 - 2021" = 2020)

partners <- c("Government",
              "Indigenous",
              "Industry",
              "NGO",
              "NRM",
              "University")

list_sp <- list_sp_by_category(sp_data)

# Social media
website_url <- text_to_code(website_url_clean)
website_message <- text_to_code(website_message_clean)



# Images

# Videos

