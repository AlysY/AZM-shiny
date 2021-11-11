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
# Script aim: Functions to support shiny app

year_to_decade <- function(vect){
  if(vect <= 1989){
    d <- "1980s"
  } else if(vect > 1989 && vect < 2000){
    d <- "1990s"
  } else if(vect > 1999 && vect < 2010){
    d <- "2000s"
  } else if(vect > 2009) {
    d <- "2010s"
  } else {
    d <- NA
  }
}


#' Change plain text/url for the social media share message
#'
#' @description Takes normal text and the url that will be linked to the social media share buttons, and turns it into the correct syntax. 
#' @param message Character string with a message or url.
#'
#' @return A character string with the correct syntax to feed into href.
#'
#' @examples
#' text_to_code("Hello, here is your message")
#' text_to_code("www.google.com")
text_to_code <- function(message){
  
  replaced <- message %>%
    stringr::str_replace_all( ":", "%3A") %>%
    stringr::str_replace_all( "/", "%2F") %>%
    stringr::str_replace_all( " ", "%20")
  return(replaced)
}




#' List regions by their jurisdiction
#' @description Create a list of regions, seperated into the headings by their jurisdiction. The regions are sub-parts of the jurisdiction. 
#' This is can be used as the 'choices' argument in a shiny widget to create the jurisdiction are subheading when selecting a region.
#' If only one region occurs in a jurisdiction, the region is added twice so that the subheading still appears when fed into a shiny widget. 
#'
#' @param data The dataset containing the columns "jurisdiction" and "region".
#'
#' @return List where the names are the jurisidctions and the regions are within the relevant jurisdiction. This is can be used as the 'choices' argument in a shiny widget.
#'
#' @examples
#' df <- data.frame(region  = c("Melbourne", "Geelong", "Sydney"), jurisdiction = c("Victoria", "Victoria", "New South Wales"))
#' list_reg_by_jur(data  = df)
list_sp_by_category <- function(data){

  # empty list that the options will end up in
  sp_list_by_category <- c()
  
  # The unique jurisdictions
  j <- unique(sp_data$category)

    
    # For loop to create a list of the regions with the jurisdictions as the names
    for(i in 1:length(j)){
      
      # the categories
      sp_l <- unique(data$Common_name[data$category == j[i]])
      
      # in case there is only 1 element in the list
      if(length(sp_l)==1) {
        sp_l2 <-  c(sp_l, "-" = sp_l)
      } else {
        sp_l2 <- sp_l
      }
      sp_list <- list(sort(sp_l2))
      names(sp_list) <- j[i]

      # save the list
      sp_list_by_category <- c(sp_list_by_category, sp_list )
    }
  
  return(sp_list_by_category)
}


list_sp_by_category2 <- function(data, grouping_category, name_in_list){
  
  # empty list that the options will end up in
  sp_list_by_category <- c()
  
  # The unique groups
  j <- data %>%
    select(grouping_category) %>%
    distinct() %>%
    pull()
  
  #cats <- sort(gsub("_", " ", j))
  
  data2 <- data %>%
    rename(gc =  grouping_category,
           cn = name_in_list)
  
  
  # For loop to create a list of the regions with the jurisdictions as the names
  for(i in 1:length(j)){
    
    # the categories
    sp_l <- data2 %>%
      filter(gc == j[i]) %>%
      select(cn) %>%
      distinct() %>%
      pull()
      
      
    
    # in case there is only 1 element in the list
    if(length(sp_l) == 1) {
      sp_l2 <-  c(sp_l, "-" = sp_l)
    } else {
      sp_l2 <- sp_l
    }
    sp_list <- list(sort(sp_l2))
    names(sp_list) <- j[i]
    
    # save the list
    sp_list_by_category <- c(sp_list_by_category, sp_list )
  }
  names(sp_list_by_category) <- gsub("_", " ", j)
  
  sp_list_by_category = sp_list_by_category[order(names(sp_list_by_category))]
  return(sp_list_by_category)
}

#' Set the initial value of a shiny widget to be blank with a placeholder message
#'
#' @param variable A character string for the variable being selected in the widget. This will appear in the placeholder as "please select variable"
#'
#' @return list which is used in the options argument of a shiny widget
#'
#' @examples
#' start_empty("a region")
#' selectInput(inputId = "region",
#' label = "Select a region:",
#' choices = c("Melbourne", "Geelong", "Sydney"),
#' options = start_empty("antibiotic") )
start_empty <- function(variable){
  list(
    placeholder = paste('Please select', variable),
    onInitialize = I('function() { this.setValue(""); }')
  )
}
# 
# 
# empty_plot <- function(folder, image_path, image_number){
#   
# }
# # TO DO - turn this into a function
# if (length(list.files(folder)) < image_number) {
#   tags$img(src = "blank.png", width = "100%")
# } else if (length(list.files(folder)) == image_number) {
#   # Files
#   f <- list.files(folder)[image_number]
#   p <- file.path(RV$path_signs, f)
#   
#   # Image
#   tags$img(src = file.path(p), width = "100%") 
# }