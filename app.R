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
# Script aim: Create a shiny app to display the results of the monitoring including the species model outputs and monitoring effort
# Target audience: Land council, ranger groups, NGOs, Gov, NRM
# Communication features: Plain language, images, symnols




##***********##
## 1. Set up ## -------------------------------------------------------------------------------------------------------------------------------
##***********##

# Deploy app
# if (!require(rsconnect)) install.packages('rsconnect')
# rsconnect::deployApp(account = 'anti-microbe-res')


## Install packages
# if(!require(shiny)) install.packages('shiny')
# if(!require(shinythemes)) install.packages('shinythemes')
# if(!require(tidyverse)) install.packages('tidyverse')
# if(!require(plotly)) install.packages('plotly')
# if(!require(leaflet)) install.packages('leaflet')

## Load packages
library(shiny)       # to run Shiny
library(shinythemes) # pre-made themes
library(tidyverse)   # load other tidy packages: dplyr, tidyr, stringr, ggplot2
#library(plotly)      # interactive plots
#library(leaflet)    # maps


## Read in the other files
  # static objects must be after data and optional edits
source("1_functions.R" )      
source("2_data.R")         
source("3_optional_edits.R")
source("4_static_objects.R")
source("5_text.R")
source("6_plots.R")     
source("7_shiny_code.R")

##*******************##
## 2. User Interface ## -------------------------------------------------------------------------------------------------------------------------------
##*******************##

ui <- fluidPage(
  
  # HTML code to modify the layout
    # this code causes the "share" tab in the navigation bar to be on the right hand side
  tags$head(tags$style(HTML("
                           .navbar-nav {float: none !important;}
                           .navbar-nav > li:nth-child(6) {float: right;}"))),
  
  
 
  # Navigation bar
  navbarPage(title = "", # title for the title bar, could add the logo or symbols Arid Zone Monitoring
             id = "nav", selected = NULL, collapsible = TRUE, 
             theme = shinytheme("flatly"), # TO DO - modify the colours
             # header = img(src = 'images/banner/IMG_1779_Naomi Indigo copy.jpeg', align = "left", width = '100%', height = 'auto'),
             # 
             # footer = img(src = "Logos_Extended.png", width = "100%"),
             # 
             # 

             
             ### 1. Home page -------------------------------------------------------------------------------------------------------------
             tabPanel("Home",
                      icon = icon("home"),
                      img(src = 'images/banner/IMG_1779_Naomi Indigo copy.jpeg', align = "left", width = '100%', height = 'auto'),
                      
                      h1("Arid Zone Monitoring"),
                      
                      #### 1.1 Backgound
                      fluidRow(
                        column(9, 
                               h2("Exec summary"),
                               h4(intro_1.1),
                               h4(intro_1.2),
                               h4(intro_1.3),
                               br(),
                               h4(intro_2.2)),
                        
                        column(3, img(src = 'landing_page/KJ Martu ranger and elder Kanu Taylor from Parnngurr points out bilby sign copy.jpg', align = "right", width = '100%', height = 'auto'))
                      ), # close fluidrow
                      
                      br(),
                      fluidRow(
                        column(4, img(src = 'landing_page/KJ Martu rangers find bilby burrow copy.JPG', align = "left", width = '100%', height = 'auto')),
                        column(8, 
                               h4(intro_2.1),
                               br(),
                               h4(intro_3.1)) 
                      ), # close fluidrow
                      
                      
                      br(),
                      fluidRow(
                        column(4, tags$iframe(width = "100%", height = "450", src = "https://ictv.com.au/video/item/9257", frameborder = "0", allow = "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen = NA)),
                        column(8, 
                               h2("What we have achieved:"),
                               h4("•	 example 1"),
                               h4("•	 Redesigned the monitoring program for South Australia (link to Darren's work)"),
                               h4("•	 Analysed the trends of detection rates for specific animals and places (Link to Liam's work)"),
                               br(),
                              p("Other info:"),
                               p("Who is the TSR hub, link"),
                               p("Collaborators"),
                               p("Funding"))
                      ), # close fluidrow
                      
                      
                      #### 1.2 Logos, Funding, Collaborators
                      # tags$iframe(width = "560", height = "300", src = "https://www.youtube.com/embed/i7CXhh88D-I", frameborder = "0", allow = "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen = NA),
                      tags$img(src = "Logos_Extended.png", width = "100%"),
                      br(),
                      p(paste0("Citation:", how_to_cite))
             ), # close tabpanel
             
             
             
             
 
             
             
             ### 2. Monitoring -------------------------------------------------------------------------------------------------------------
             tabPanel("Monitor",
                      icon = icon("search"),
                    
                      
                      tabsetPanel(id = "tab_monitor",
                                  
                                  #### 2.1 Monitoring protocol ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("How to do monitoring"),
                                           value = "monitor_method",
                                           p("Steps of how to monitor"),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br()
                                  ), # close tab panel
                                  
                                  #### 2.2 Choose site ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("How to choose sites"),
                                           value = "monitor_site",
                                           p("What to considering when choosing a site"),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br(),
                                           br()
                                  ), # close tab panel
                                  
                                  
                                  #### 2.3 Other information ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Other options"),
                                           value = "monitor_other",
                                           p("Other things here about monitoring"),
                                           p("•	 information about 2ha plots,"),
                                           p("•	 links to standardised survey template."),
                                           p("•	 AZM video"),
                                           p("•	 Contacts etc"),
                                           br(),
                                           br(),
                                           br(),
                                           br()
                                           
                                  ) # close tab panel
                      ), # close tabset panel
                      
                      img(src = 'images/banner/IMG_1779_Naomi Indigo copy.jpeg', align = "left", width = '100%', height = 'auto')
                      
             ), # close the tab panel
             
             
             
             
             ### 3. Survey sites  ---------------------------------------------------------------------------------------------------------
             tabPanel("Survey sites",
                      icon = icon("compass"),
                      
                    
                      tabsetPanel(id = "tab_survey",
                        
                        
                        #### 3.1 Where -------------------------------------------------------------------------------------------
                        
                        tabPanel(h3("Where did the surveys happen?"),
                                 
                                 #### Text
                                 p("Description of the locations"),
                                 p("IBRA regions"),
                                 p("Map"),
                                 
                                 p("AZM project boundary (red) within Australia. Sandy land systems in Arid regions represented in light yellow. each red ellipsis is an AZM site, which is a record of one species detection per 1km2, from one date in the AZM National Dataset."),
                                 fluidRow(
                                   column(6,
                                 img(src = 'SpatialExtent.jpg', align = "left", width = '100%', height = 'auto')
                                 )),
                                 br(),
                                 br(),
                                 #### Images
                                 fluidRow(
                                   column(6,img(src = 'Detection_number.jpg', align = "left", width = '80%', height = 'auto')),
                                   column(6, img(src = 'Detection_state.png', align = "left", width = '80%', height = 'auto'))
                                 ) # close fluid row 
                                 
                        ), # close tabPanel
                        
                        
                        
                        
                        
                        #### 3.2 When -------------------------------------------------------------------------------------------
                        
                        tabPanel(h3("When did people go?"),
                                 
                                 sidebarLayout(
                                   
                                   
                                   #### Sidebar 
                                   sidebarPanel(
                                     checkboxGroupInput(inputId  = "temp_year",
                                                        label    = "When?",
                                                        choices  = decades,
                                                        selected =  decades),
                                     
                                     checkboxGroupInput(inputId = "temp_partner",
                                                        label = "Who?",
                                                        choices = partners,
                                                        selected = partners) # close checkbox
                                   ), # close sidebar panel
                                   
                                   
                                   
                                   
                                   
                                   
                                   
                                   #### Main Panel 
                                   
                                   mainPanel(
                                     
                                     #### Text
                                     p("Map showing how the number and spread of detections over time has increased"),
                                     p("Using the inputs of the left, the data will appear and disappear"),
                                     p("Potentially using ggplot, tmap or leaflet"),
                                     p("This will be interactive so people can click on the dots"),
                                     br(),
                                     p("Consider making it an animation"),
                                     
                                     #### Image
                                     img(src = 'Monitoring.jpg', align = "left", width = '80%', height = 'auto')
                                     
                                     
                                   ) # close main panel
                                 ) # close sidebar layout
                        ), # close tabPanel
                        
                        #### 3.3 How -------------------------------------------------------------------------------------------
                        
                        tabPanel(h3("How did people survey?"),
                                 p("The types of contributed data classified by survey and sample type. "),
                                 img(src = 'Survey_how.png', align = "left", width = '50%', height = 'auto')
                                 
                                 )
                        ) #close tabset panel
                      ), #close Tab panel
             
             
             ### 4. Specific species ------------------------------------------------------------------------------------------------
             tabPanel(("What animals did people find?"), icon = icon("paw"), value = "animals",
                      
                      
                      #### 4.1 Top of page -----------------------------------------------------------------------------------------------------------------
                      fluidRow(
                        
                        column(2, wellPanel(
                                 selectizeInput(inputId = "animal_species",
                                                label = "Pick an animal",
                                                choices =  list_sp))),
                        
                        column(3, uiOutput("animal_mainimage")),
                        
                        column(7, h1(uiOutput("animal_name")),
                               h4(uiOutput("animal_nameLamguage")),
                               helpText(uiOutput("language_names_disclaimer")),
                               br(),
                               uiOutput("animal_description"))
                      ), # close fluid row
                      
                      br(),
                      br(),
                      
                      ## Tabs on the main panel
                      tabsetPanel(id = "tab_detect",
                                  
                                  
                                  #### 4.2 Detection -----------------------------------------------------------
                                  tabPanel(h4("Where were they found?"), value = "detection",
                                           
                                           fluidRow(
                                             column(6,
                                                    h4("Overall:"),
                                                    helpText(detectionRate_1),
                                                    br(),
                                                    br(),
                                                    uiOutput("animal_detectionRate_text")),
                                             column(6,
                                                    uiOutput("animal_dect"))
                                           ),
                                           br(),
                                           br(),
                                           h4("Change between years:"),
                                           helpText(detectionTime_1),
                                           br(),
                                           br(),
                                           uiOutput("animal_detectionTime_text"),
                                           column(12, uiOutput("animal_dectgif")),
                                           br(),
                                           br(),
                                           fluidRow(
                                             column(4, uiOutput("animal_dect1980")),
                                             column(4, uiOutput("animal_dect1990"))
                                           ),
                                           fluidRow(
                                             column(4, uiOutput("animal_dect2000")),
                                             column(4, uiOutput("animal_dect2010"))
                                           )
                                  ),
                                  
                                  
                                  #### 4.3 SDM -----------------------------------------------------------
                                  tabPanel(h4("Where else might they be?"), value = "SDM",
                                           
                                           fluidRow(
                                             column(6,
                                                    helpText(SDM_1),
                                                    br(),
                                                    br(),
                                                    uiOutput("animal_SDM_text")
                                             ),
                                             column(6, 
                                                    uiOutput("animal_SDM"),
                                                    uiOutput("animal_SDM_legend"))
                                           )
                                  ), # close tab panel
                                  
                                  #### 4.4 Tracks and scats -----------------------------------------------------------
                                  tabPanel(h4("Tracks, scat and signs"), value = "signs",
                                           p("Text here"),
                                           fluidRow(
                                             column(3, uiOutput("animal_img1")),
                                             column(3, uiOutput("animal_img2")),
                                             column(3, uiOutput("animal_img3")),
                                             column(3, uiOutput("animal_img4"))
                                           )
                                  ), # close tab panel
                                  
                                  
                                  #### 4.5 More info -----------------------------------------------------------
                                  tabPanel(h4("Do you want to know more?"), value = "information",
                                           p("Link to the PDF"),
                                           actionButton("download_factsheet", "Download animals factsheet"),
                                           p("Links to other pages e.g. ALA, recovery plan")
                                  ) # close tab panel
                      ), # close tabset
                      br(),
                      br(),
                      uiOutput("how_to_cite_species")
                      
                      
             ), # close tab
             
             
             
             
             ### 5. More information --------------------------------------------------------------------
             tabPanel("More Information", icon = icon("info"),
                      img(src = 'images/banner/IMG_1779_Naomi Indigo copy.jpeg', align = "left", width = '100%', height = 'auto'),
                      
                      
                      #### 5.1 Contact
                      
                      h3("Contact us"),
                      p(paste("For more information or enquiries, please contact", contact_name, "on", contact_email)),
                      br(),
                      
                      
                      #### 5.2 Publications
                      h3("Publications and reports"),
                      p(tags$a(href = "https://doi.org/10.1111/cobi.13373", "Skroblin, A., Carboon, T., Bidu, G., Chapman, N., Miller, M., Taylor, K., Taylor, W., Game, E.T. and Wintle, B.A., (2021)."),"Including indigenous knowledge in species distribution modeling for increased ecological insights. Conservation Biology, 35(2), 587-597."),
                      p(tags$a(href = "https://doi.org/10.1111/cobi.13373", "Skroblin, A., Carboon, T., Bidu, G., Chapman, N., Miller, M., Taylor, K., Taylor, W., Game, E.T. and Wintle, B.A., (2021)."),"Including indigenous knowledge in species distribution modeling for increased ecological insights. Conservation Biology, 35(2), 587-597."),
                      p(tags$a(href = "https://doi.org/10.1111/cobi.13373", "Skroblin, A., Carboon, T., Bidu, G., Chapman, N., Miller, M., Taylor, K., Taylor, W., Game, E.T. and Wintle, B.A., (2021)."),"Including indigenous knowledge in species distribution modeling for increased ecological insights. Conservation Biology, 35(2), 587-597."),
                      p(tags$a(href = "https://doi.org/10.1111/cobi.13373", "Skroblin, A., Carboon, T., Bidu, G., Chapman, N., Miller, M., Taylor, K., Taylor, W., Game, E.T. and Wintle, B.A., (2021)."),"Including indigenous knowledge in species distribution modeling for increased ecological insights. Conservation Biology, 35(2), 587-597."),
                      
                      br(),
                      
                      #### 5.3 Citation
                      h3("Citation"),
                      p("Please cite this work as:"),
                      how_to_cite,
                      
                      #### 5.4 Logos, Funding, Collaborators
                      tags$img(src = "Logos_Extended.png", width = "100%")
             )
             
             # navbarMenu(("Share"),
             #            
             #            icon = icon("share-alt"),
             #            
             #            # For other pages, use the format
             #            # tabPanel(tags$a(href = "the url to the shar page", icon("social media icon for the other page"), "Page name" )),
             #            
             #            # Facebook
             #            # tabPanel(tags$a(href = paste0('https://www.facebook.com/sharer/sharer.php?u=', website_url), icon("facebook"), "Facebook" )),
             #            
             #            # Twitter
             #            tabPanel(tags$a(href = paste0('https://twitter.com/intent/tweet?url=', website_url , ' &text=', website_message), icon("twitter"), "Twitter" )),
             #            
             #            # LinkedIn 
             #            tabPanel(tags$a(href = paste0('http://www.linkedin.com/shareArticle?mini=true&url=', website_url,' &title=', website_message), icon("linkedin"), "LinkedIn" ))
             #            
             # )# close navbar2
             
  ) # close navbar
) # close fluidpage









##***********##
## 3. Server ## ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##***********##

server <- function(input,output, session){
  
  # testing
  output$how_to_cite_species  <- renderUI({
    how_to_cite_species <- paste0("NESP Threatened Species Recovery Hub, 2021. Arid Zone Monitoring Species Profile: ", input$animal_species, ", Project 3.2.5 findings factsheet. ")
    
  })
  
  
  

# 4. Specific species page ---------------------------------------------------------------------------------------------------------------------

  ## Filter the data
  animal_data <- reactive({
    data <- sp_data %>% filter(Common_name == input$animal_species)
  })
  
  
  ## 4.1 Reactive values ---------------------------------------------------------------------------------------------------------------------
  RV <- reactiveValues(title = NULL) 
  
  observeEvent(input$animal_species, {
    RV$title <- input$animal_species
    RV$path <- file.path("species", input$animal_species)
    RV$path_image <- file.path("species", input$animal_species, "main_image")
    RV$path_signs <- file.path("species", input$animal_species, "signs")
    RV$path_SDM <- file.path("species", input$animal_species, "SDM")
    RV$path_detect <- file.path("species", input$animal_species, "detection")
    RV$path_factsheet <-  file.path("species", input$animal_species, "factsheet", list.files(file.path("www", "species", input$animal_species, "factsheet"))[1])
    
  })
  
  
  ## 4.2 Top of page ---------------------------------------------------------------------------------------------------------------------
  
  ## Main image
  output$animal_mainimage  <- renderUI({
    # Files
      # listing the file needs to have the www folder
    f <- list.files(file.path("www",  RV$path_image))[1]
    p <- file.path(RV$path_image, f)
    
    # Image
      # when printing the image, need to start at the species folder
    tags$img(src = file.path(p), width = "105%", height = "auto")
  })
  
  ## Animals name
  output$animal_name  <- renderUI({
    input$animal_species
  })
  
  ## Animal's name in language
  output$animal_nameLamguage  <- renderUI({
    animal_data()$Language_names
  })
  
  ## Disclaimer about the language words
  output$language_names_disclaimer  <- renderUI({
    
    if(nchar(animal_data()$Language_names) == 0){
      t <- ""
    } else if(nchar(animal_data()$Language_names) > 1){
      t <- language_names_disclaimer
    }
    t
  })
  
  ## Animal description
  output$animal_description  <- renderUI({
    animal_data()$species_description
  })
  
  
  
  
  
  ## 4.3 Detections ---------------------------------------------------------------------------------------------------------------------
  
  
  
  
  ### 4.3.1 Over all -------------------------------------------------------------------------------
  
  ## Animal specific text
  output$animal_detectionRate_text  <- renderUI({
    animal_data()$detectionRate_description
  })
  
  ## Image
  output$animal_dect <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_detect), pattern = "jpg")
    p <- file.path(RV$path_detect, f)
    
    # Image
    tags$img(src = file.path(p), width = "100%")
  })
  
  
  
  
  ### 4.3.2 Over time -------------------------------------------------------------------------------
  
  ## Animal specific text
  output$animal_detectionTime_text  <- renderUI({
    animal_data()$detectionTime_description
  })
  
  ## Gif
  output$animal_dectgif <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "gif")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    img(src = file.path(p), width = "50%")
  })
  
  
  ## Images
  ## 1980
  output$animal_dect1980 <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "1980")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  ## 1990
  output$animal_dect1990 <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "1990")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  ## 2000
  output$animal_dect2000 <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "2000")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  ## 2010
  output$animal_dect2010 <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "2010")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  
  
  
  # 4.4 SDM -----------------------------------------------------------------------------------------------------------------
  
  ## Animal specific text
  output$animal_SDM_text  <- renderUI({
    animal_data()$SDM_description
  })
  
  ## Plot/image
  output$animal_SDM <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_SDM))[1]
    p <- file.path(RV$path_SDM, f)
    
    # Image
    tags$img(src = file.path(p), width = "100%")
  })
  
  ## Legend
  output$animal_SDM_legend <- renderUI({
    # Required inputs
    req(input$animal_species, RV$title)
    
    # Image
    tags$img(src = "SDM_legend.jpg", width = "80%")
  })
  
  # 4.5 Signs (tracks and scats) ----------------------------------------------------------------------------------------------------------------------------------------
  
  output$animal_img1  <- renderUI({
    # Files
    # listing the file needs to have the www folder
    f <- list.files(file.path("www",  RV$path_signs))[1]
    p <- file.path(RV$path_signs, f)
    
    # Image
    # when printing the image, need to start at the species folder
    tags$img(src = file.path(p), width = "100%") #, height = "120")
  })

  output$animal_img2 <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_signs))[2]
    p <- file.path(RV$path_signs, f)
    
    # Image
    tags$img(src = file.path(p), width = "100%") #, height = "120")
  })
  
  
  output$animal_img3 <- renderUI({
    # Files
    f <- list.files(file.path("www",  RV$path_signs))[3]
    p <- file.path(RV$path_signs, f)
    # Image
    tags$img(src = file.path(p), width = "100%")  #, height = "120")
  })
  
  
  output$animal_img4 <- renderUI({
    files <- list.files(file.path("www",  RV$path_signs))
    
    # TO DO - turn this into a function
    if (length(files) < 4) {
      tags$img(src = "blank.png", width = "100%")
    } else if (length(files) == 4) {
      # Files
      f <- list.files(file.path("www",  RV$path_signs))[4]
      p <- file.path(RV$path_signs, f)
      
      # Image
      tags$img(src = file.path(p), width = "100%") 
    }
  })
  
  
  # .# download factsheet -----------------------------------------------------------------------------------
  # output$download_factsheet <- downloadHandler(
  #   filename = paste0("Factsheet", input$animal_species, ".pdf"),
  #   content = function(file) {
  #     file.copy(RV$path_factsheet, file)
  #   }
  # )
  
  
} # close server function







##**************##
## 4. Shiny App ## ---------------------------------------------------------------------------------------------------
##**************##
shinyApp(server = server, ui = ui)


