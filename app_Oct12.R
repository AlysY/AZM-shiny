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
source("5_text_large.R")
source("6_plots.R")     
source("7_shiny_code.R")

# main green colour  387469

# 587DA4 blue colour of help text
# ECF0F1 grey of sidebar panel

css <- HTML("body {font-size: 20px;
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
            
            .form-control {font-size: 20px;}
            
            .nav-tabs {border-bottom: 3px solid #ecf0f1;}
            
            .help-block {color: #000000;}
            ")

#  .help-block {font-size: 15px;
##*******************##
## 2. User Interface ## -------------------------------------------------------------------------------------------------------------------------------
##*******************##

ui <- fluidPage(

  # Navigation bar
  navbarPage(title = "Arid Zone Monitoring", # title for the title bar, could add the logo or symbols Arid Zone Monitoring
             id = "nav", selected = NULL, collapsible = TRUE, 
             theme = shinytheme("flatly"), # TO DO - modify the colours
             windowTitle = "Arid Zone Monitoring",

             tags$head(tags$style(css)),
             
             ### 1. Home page -------------------------------------------------------------------------------------------------------------
             tabPanel("Home",
                      icon = icon("home"),
                      img(src = 'images/banner/IMG_1716.JPG', align = "left", width = '100%', height = 'auto'),
                      
                      h1("Arid Zone Monitoring"),
                      helpText(acknowledgement_of_Country),
                      div(helpText(image_permission), style = "font-size: 15px;"),
                      #### 1.1 Background
                      fluidRow(
                        column(8, 
                               br(),
                               strong("Project summary:"),
                               p(intro_1.2),
                               br(),
                               strong("Who was involved?"),
                               p(intro_1.1),
                               #br(),
                               #p(intro_1.3),
                               #br(),
                               #p(intro_1.4),
                               #br(),
                               #p(intro_1.5),
                               #br()
                               ),
                        column(4,  br(), br(), img(src = 'images/portrait/IMG_1783.JPG',  width = '100%', height = 'auto')) #align = "right",
                        
                        # column(4,  img(src = 'images/portrait/IMG_1783.JPG',  width = '100%', height = 'auto')) #align = "right",
                      ), # close fluidrow
                      
                      br(),
                      fluidRow(
                        
                        column(4, 
                               tags$video(width = "100%", height = "auto", id = "TSRhub_Video", type = "video/mp4", src = "video/TSR.mov", controls = "controls")
                               ), 
                        column(8, 
                               strong("Aims:"),
                               p(intro_2.1)
                      )
                      ), # close fluidrow
                      
                      
                      fluidRow(column(8, 
                                      p(intro_2.2)
                                      # p(intro_2.3),
                                      # p(intro_2.4),
                                      # p(intro_2.5),
                                      # p(intro_2.6),
                                      # p(intro_2.7),
                                      # p(intro_2.8)
                               ),
                               column(4, img(src = 'images/landscape/P5190742.JPG', align = "right", width = '100%', height = 'auto'))
                               
                      ), # close fluidrow
                      
                      br(),
                      p(intro_2.3),
                      p(intro_2.4),
                      p(intro_2.5),
                      p(intro_2.6),
                      p(intro_2.7),
                      p(intro_2.8),

                      br(),
                      fluidRow(
                        column(4, img(src = 'images/landscape/P5190742.JPG', align = "right", width = '100%', height = 'auto')),
                        column(8,
                               
                               strong("Acknowledgements"),
                               br(),
                               acknowledgements,)
                      ), # close fluidrow
                      
                      
                      #### 1.2 Logos, Funding, Collaborators
                      
                     
                      #p(paste0("Citation:", how_to_cite)),
                      br(),
                      # tags$iframe(width = "560", height = "300", src = "https://www.youtube.com/embed/i7CXhh88D-I", frameborder = "0", allow = "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen = NA),
                      div(tags$img(src = "Logos_Extended.png", width = "90%"), style = "text-align: center;")
             ), # close tabpanel
             
             
             
             
 
             
             
             
             
             
             ### 2. Survey sites  ---------------------------------------------------------------------------------------------------------
             tabPanel("What was surveyed?",
                      icon = icon("compass"),
                      img(src = 'images/banner/IMG_1716.JPG', align = "left", width = '100%', height = 'auto'),
                      
                    
                      tabsetPanel(id = "tab_survey",
                        
                        
                                  
                        #### 2.2 Where -------------------------------------------------------------------------------------------
                        
                        tabPanel(h3("Where did the surveys happen?"),
                                 
                                 #### Text
                                 strong("Defining the project area"),
                                 p("The project area was defined by using IBRA subregional boundaries, such that all sites in the contributed data were enclosed by the boundary. This resulting project area includes all of Australia’s sandy deserts, with an extension in the northwest to include the Pindanland subregion, in the Dampierland bioregion. A small extension was also made into the Augustus, Fortescue and Chichester subregions (Gascoyne and Pilbara bioregions), in order to include sites surveyed by Martu people and Kanyirninpa Jukurrpa. Defining the project boundary is necessary for setting the ‘environmental envelope’ used in distribution modelling."),
                                 
                                 div(img(src = 'images/figures/SpatialExtent.jpg',  width = '50%', height = 'auto'), style = "text-align: center;"),
                                 div(helpText("Figure 1: AZM project boundary (red) within Australia. Sandy land systems in Arid regions represented in light yellow. each red ellipsis is an AZM site, which is a record of one species detection per 1km2, from one date in the AZM National Dataset."), style = "text-align: center;"),
                                 
                                 br(),
                                 br(),
                                 
                                 strong("Creating the AZM National Dataset"),
                                 p("We received and collated 66 datasets from fauna monitoring surveys undertaken by 37 different data providers from across arid Australia. Data were collected by Indigenous rangers, government scientists, university scientists, NGOs and consultants, using a variety of survey methods over the period from 1982 to 2020 (Figure 2).  The datasets were collected to meet a range of objectives, from surveys that were aimed to describe occurrence of single species (and potentially changes over time) to general fauna surveys. Many datasets aimed to provide opportunities for on-country trips and knowledge exchange. Some data were collected using standardised observational methods, such as the 2 ha plot searches, or surveys of road transects. Other data with species detections were collected opportunistically or using specialised trapping equipment. "),
                                 
                                 div(img(src = 'images/figures/DataProviders.jpg',  width = '50%', height = 'auto'), style = "text-align: center;"),
                                 div(helpText("Figure 2: Map showing the locations of data providers within the AZM project boundary."), style = "text-align: center;"),
                                 
                                 br(),
                                 br(),
                                 
                                 strong("Summary of the AZM National Dataset"),
                                 p("This section summarises key descriptive statistics from the AZM National Dataset, after data cleaning and manipulation were completed. "),
                                 br(),
                                 
                                 strong("Number of presence and absence records and sites "),
                                 p("Most data in the National dataset are presence records from 2 ha plot surveys, with many records also derived from transect-based surveys. All absence data were collected from standardised 2 ha plot surveys (Table 2). Timed search and sign-based search data were collected by searching for animal detection signs withing a 2ha perimeter around live animal trapping sites. Other sign-based data were collated through timed search transects and either carried out on foot or by a slow-moving vehicle. "),
                                 br(),
                                 div(helpText("Table 2: Summary of records (N. records) contained in the AZM National Dataset by survey type. One site (n. sites) is a 1 km2 location. A site visit is a 1 km2 location visited (sampled) on one date. One record is one species detected in one site."), style = "text-align: center;"),
                                 div(img(src = 'images/figures/PArecords.png', width = '60%', height = 'auto'), style = "text-align: center;"),
                                 br(),
                                 br(),
                                 
                                 strong("Number of presence and absence records and sites "),
                                 p("Most records and sites were contributed from South Australia, followed by Western Australia (Table 5). Many of the South Australian records were collected by government, working with arid zone ecologists, using sandplot monitoring across large parts of the state to identify the distribution of species and locate rare species like dusky hopping mice and crest-tailed mulgara."),
                                 br(),
                                 div(helpText("Table 5: Number of contributors in each state, Number (N.) of sites and records and Number of site visits in the AZM National dataset."), style = "text-align: center;"),
                                 div(img(src = 'images/figures/JurisdictionRecords.png', width = '60%', height = 'auto'), style = "text-align: center;"),
                                 
                                 br(),
                                 br(),
                                 fluidRow(
                                   column(6, 
                                          div(img(src = 'images/figures/Site_jurisdiction.jpg',  width = '60%', height = 'auto'), style = "text-align: center;"),
                                          div(helpText("Figure 7: Number of sites and records in the presence (blue) and absence (red) in the AZM National Dataset , by jurisdiction. One site is a 1 km2 location."), style = "text-align: center;")
                                   ),
                                   column(6,
                                          div(img(src = 'images/figures/SiteVisits_jurisdiction.jpg',  width = '60%', height = 'auto'), style = "text-align: center;"),
                                          div(helpText("Figure 8: Number of site visit records in the presence (blue) and absence (red) in the AZM National Dataset , by jurisdiction. A site visit is a 1 km2 location sampled on one date."), style = "text-align: center;")
                                          
                                          )
                                 )
                                   
                        ), # close tabPanel
                        
                        
                        
                        
                        
                        #### 2.3 When -------------------------------------------------------------------------------------------
                        
                        tabPanel(h3("When did people go?"),
                                 br(),
                                 sidebarLayout(
                                   
                                   
                                   #### Sidebar 
                                   sidebarPanel(
                                     selectInput(inputId  = "temp_year",
                                                        label    = "When?",
                                                        choices  = decades,
                                                        selected =  decades[1]),
                                     
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
                        
                        
                        #### 2.1 How -------------------------------------------------------------------------------------------
                        
                        tabPanel(h3("Methods"),
                                 
                                 
                                 fluidRow(
                                   column(6,
                                          p("To assist with data summary and analysis, we attributed datasets with consistent metadata:"),
                                          br(),
                                          
                                          strong("Dataset Identifier:"),
                                          p("Datasets were given a unique identifier to keep track of the origin of each record."),
                                          br(),
                                          
                                          strong("Jurisdiction:"),
                                          p("The state or territory where surveys were carried out."),
                                          br()
                                   ),
                                   column(6, br(),img(src = 'images/figures/ClassifyingData_sample.png',  width = '100%', height = 'auto')),
                                 ),
                                 
                                 #div(img(src = 'images/figures/ClassifyingData_sample.png',  width = '50%', height = 'auto'), style = "text-align: center;"),
                                 
                                 
                                 strong("Data contributor:"),
                                 p("Datasets were received from across Australia from a range of data providers which we classified as either: Government (state government), Indigenous (including datasets that were jointly collected by Indigenous contributors with government or university contributors), Industry (consultancy, mining), NGO, Natural Resource Management group and University."),
                                 br(),
                                 
                                 strong("Dataset typology:"),
                                 p("Datasets varied in terms of the collection methods used, and therefore the sorts of analyses they can be used for. A key division was between observational surveys (standardised and non-standardised) and surveys using specialised equipment, because these two approaches detect non-overlapping species sets, and data from specialised surveys were only available for a very small proportion of the AZM study area."),
                                 br(),
                                 
                                 
                                 strong("Survey type:"),
                                 p("Datasets were classed into one of three survey types (Figure 3):"),
                                 p("o	Observational surveys based on standardised methods;"),
                                 p("o	Observational surveys that were not standardised (including incidental records); "),
                                 p("o	Surveys using specialised trapping equipment or specimen collection."),
                                 br(),
                                 
                                 strong("Sample type:"),
                                 p("Observational surveys using standardised methods were further classed into sample types as follows: 2 ha plots; 6 ha plots; sign-based transects (walking or driving); timed searches. Sample types for non-standardised surveys were classed as incidental, or unknown. Sample type for specialised surveys were classed as trapping or specimen collection (Figure 3).")
                                     
                        )

                        ) #close tabset panel
                      ), #close Tab panel
             
             
             ### 3. Specific species ------------------------------------------------------------------------------------------------
             tabPanel(("What animals did people find?"), icon = icon("paw"), value = "animals",
                      
                      
                      #### 3.1 Top of page -----------------------------------------------------------------------------------------------------------------
                      fluidRow(
                        
                        column(3, wellPanel(
                                 selectizeInput(inputId = "animal_species",
                                                label = "Pick an animal",
                                                choices =  list_sp)),
                               br(),
                               uiOutput("animal_mainimage")
                               ),
                        
                        #column(3, uiOutput("animal_mainimage")),
                        
                        column(8, h1(uiOutput("animal_name")),
                               p(uiOutput("animal_nameLamguage")),
                               
                               div(helpText(uiOutput("language_names_disclaimer")), style = "font-size: 15px;"),
                               br(),
                               uiOutput("animal_description"))
                      ), # close fluid row
                      
                      br(),
                      br(),
                      
                      ## Tabs on the main panel
                      tabsetPanel(id = "tab_detect",
                                  
                                  
                                  #### 3.2 Detection -----------------------------------------------------------
                                  tabPanel(h3("Where were they found?"), value = "detection",
                                           
                                           fluidRow(
                                             column(6,
                                                    h3("Overall:"),
                                                    
                                                    p(detectionRate_1),
                                                    br(),
                                                    br(),
                                                    uiOutput("animal_detectionRate_text")),
                                             column(6,
                                                    uiOutput("animal_dect"))
                                           ),
                                           br(),
                                           br(),
                                           h3("Change between years:"),
                                           p(detectionTime_1),
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
                                  
                                  
                                  #### 3.3 SDM -----------------------------------------------------------
                                  tabPanel(h3("Where else might they be?"), value = "SDM",
                                           
                                           fluidRow(
                                             column(6,
                                                    p(SDM_1),
                                                    br(),
                                                    br(),
                                                    uiOutput("animal_SDM_text")
                                             ),
                                             column(6, 
                                                    uiOutput("animal_SDM"),
                                                    uiOutput("animal_SDM_legend"))
                                           )
                                  ), # close tab panel
                                  
                                  #### 3.4 Tracks and scats -----------------------------------------------------------
                                  tabPanel(h3("Tracks, scat and signs"), value = "signs",
                                           uiOutput("animal_signs"),
                                           br(),
                                           fluidRow(
                                             column(3, uiOutput("animal_img1")),
                                             column(3, uiOutput("animal_img2")),
                                             column(3, uiOutput("animal_img3")),
                                             column(3, uiOutput("animal_img4"))
                                           )
                                  ), # close tab panel
                                  
                                  #### 3.5 Similar animals -----------------------------------------------------------
                                  tabPanel(h3("Similar  animals"), value = "similar",
                                           
                                           uiOutput("animal_similaranimals_text"),
                                           
                                           uiOutput("animal_similaranimals_img")
                                  ), # close tab panel
                                  
                                  
                                  #### 3.6 More info -----------------------------------------------------------
                                  tabPanel(h3("Do you want to know more?"), value = "information",
                                           p("Link to the PDF"),
                                           actionButton("download_factsheet", "Download animals factsheet"),
                                           p("Links to other pages e.g. ALA, recovery plan")
                                  ) # close tab panel
                      ), # close tabset
                      br(),
                      br(),
                      uiOutput("how_to_cite_species")
                      
                      
             ), # close tab
             
             
             
             ### 4. Monitoring -------------------------------------------------------------------------------------------------------------
             tabPanel("How to monitor?",
                      icon = icon("search"),
                      img(src = 'images/banner/IMG_1716.JPG', align = "left", width = '100%', height = 'auto'),
                      
                      
                      tabsetPanel(id = "tab_monitor",
                                  
                                  #### 4.1 Monitoring protocol ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Designing tracked-based surveys"),
                                           value = "monitor_method",
                                           monitor_overview,
                                           br(),
                                           br(),
                                           
                                           
                                           fluidRow(
                                             column(9,
                                                    strong("What do you want to know?"),
                                                    br(),
                                                    monitor_what,
                                                    br(),
                                             ),
                                             column(3, img(src = 'images/landscape/P5190742.JPG', align = "right", width = '100%', height = 'auto'))
                                           ),
                                           
                                           br(),
                                          
                                           
                                           fluidRow(
                                             column(3, img(src = 'images/portrait/IMG_1783.JPG', align = "left", width = '100%', height = 'auto')),
                                             
                                             column(9,
                                                    strong("Where to survey?"),
                                                    
                                                    br(),
                                                    monitor_where1,
                                                    br(),
                                                    monitor_where2,
                                                    br(),
                                                    monitor_where3
                                             )
                                             ),
                                           
                                           strong("How many sites are needed?"),
                                           br(),
                                           em("To detect trends over time:"),
                                           br(),
                                           monitor_quantity1,
                                           br(),
                                           br(),
                                           em("For a regional or national monitoring program:"),
                                           br(),
                                           monitor_quantity2,
                                           br(),
                                           br(),
                                           em("For a monitoring change at the property or IPA scale:"),
                                           br(),
                                           monitor_quantity3,
                                           br(),
                                           br(),
                                           em("To detect the effects of management"),
                                           br(),
                                           monitor_quantity4,
                                           br(),
                                           br(),
                                           strong("How often to survey?"),
                                           br(),
                                           monitor_times1,
                                           br(),
                                           br(),
                                           monitor_times2,
                                           br(),
                                           br(),
                                           monitor_times3,
                                           br(),
                                           br(),
                                           wellPanel(
                                             strong(helpText("Practical tips:")),
                                             helpText(monitor_tip)
                                           )
                                           
                                  ), # close tab panel
                                  
                                  #### 4.2 Choose site ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Data collection"),
                                           value = "monitor_datacol",
                                           br(),
                                           fluidRow(
                                             column(3, img(src = 'images/portrait/IMG_1783.JPG', align = "left", width = '100%', height = 'auto')),
                                             
                                             column(9,
                                                    datacol
                                             )
                                           ),
                                           br()
                                  ), # close tab panel
                                  
                                  
                                  #### 4.3 Track-based monitoring data sheets ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Track-based monitoring data sheets"),
                                           value = "monitor_datasheet",
                                           
                                           fluidRow(
                                             column(8,
                                                    monitor_datasheet1,
                                                    
                                                    br(),
                                                    br(),
                                                    monitor_datasheet2
                                             ),
                                             column(4, br(), img(src = 'images/landscape/P5190742.JPG', align = "right", width = '100%', height = 'auto'))
                                           ),
                                           
                                           br(),
                                           br(),
                                           monitor_datasheet3,
                                           br(),
                                           br(),
                                           monitor_datasheet4,
                                           br(),
                                           br(),
                                           monitor_datasheet5,
                                           br(),
                                           br(),
                                           helpText("two buttons to download the: the full report and data recording template"),
                                           br(),
                                           br()
                                           
                                  ), # close tab panel
                                  
                                  #### 4.4 Datasheet instructions ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Datasheet instructions"),
                                           value = "monitor_instructions",
                                           monitor_instruct1,
                                           br(),
                                           br(),
                                           strong("Who"),
                                           br(),
                                           monitor_instruct2.1,
                                           br(),
                                           br(),
                                           
                                           fluidRow(
                                             column(8, 
                                                    em("Number of trackers in the group"),
                                                    br(),
                                                    monitor_instruct2.2,
                                             br(),
                                             br(),
                                             strong("When"),
                                             br(),
                                             monitor_instruct3),
                                             column(4, img(src = 'images/portrait/IMG_1783.JPG', align = "right", width = '100%', height = 'auto'))
                                             
                                           ), # close fluidrow
                                           
                                           br(),
                                           strong("Where"),
                                           br(),
                                           monitor_instruct4.1,
                                           br(),
                                           br(),
                                           em("Recording location"),
                                           br(),
                                           monitor_instruct4.2,
                                           monitor_instruct4.3,
                                           monitor_instruct4.4,
                                           br(),
                                           br(),
                                           em("Photograph site"),
                                           br(),
                                           monitor_instruct4.5,
                                           br(),
                                           br(),
                                           strong("How"),
                                           br(),
                                           em("Sampling method"),
                                           br(),
                                           monitor_instruct5.1,
                                           br(),
                                           br(),
                                           
                                           #div(helpText("Table 5: Number of contributors in each state, Number (N.) of sites and records and Number of site visits in the AZM National dataset."), style = "text-align: center;"),
                                           div(img(src = 'images/figures/SamplingMethod.png', width = '50%', height = 'auto'), style = "text-align: center;"),
                                           
                                           br(),
                                           br(),
                                           em("A standard 2 ha sand plot survey"),
                                           br(),
                                           monitor_instruct5.2,
                                           br(),
                                           br(),
                                           monitor_instruct5.3,
                                           br(),
                                           br(),
                                           em("A standard road transect survey adjacent to the 2 ha sand plot"),
                                           
                                           br(),
                                           monitor_instruct5.4,
                                           br(),
                                           br(),
                                           em("Survey target"),
                                           br(),
                                           monitor_instruct5.5,
                                           br(),
                                           br(),
                                           strong("Fire"),
                                           br(),
                                           monitor_instruct6.1,
                                           br(),
                                           monitor_instruct6.2,
                                           br(),
                                           br(),
                                           
                                           
                                           strong("Data quality"),
                                           br(),
                                           monitor_instruct7.1,
                                           br(),
                                           monitor_instruct7.2,
                                           br(),
                                           monitor_instruct7.3,
                                           br(),
                                           br(),
                                           
                                           fluidRow(
                                             column(9,
                                                    
                                                    strong("Animal detections"),
                                                    br(),
                                                    monitor_instruct8,
                                                    br(),
                                                    br()
                                             ),
                                             column(3, img(src = 'images/landscape/P5190742.JPG', align = "right", width = '100%', height = 'auto'))
                                           ),
                                           
                                           
                                           strong("Age of tracks"),
                                           fluidRow( column(3, wellPanel(
                                             monitor_instruct9.1_fresh,
                                             br(),
                                             monitor_instruct9.1_old,
                                             br(),
                                             monitor_instruct9.1_veryold
                                           ))),
                                           br(),
                                           monitor_instruct9.2,
                                           br(),
                                           monitor_instruct9.3,
                                           br(),
                                           br(),
                                           
                                           fluidRow(
                                             column(8,
                                                    strong("Age of scats"),
                                                    br(),
                                                    monitor_instruct10,
                                                    br(),
                                                    br(),
                                                    
                                                    strong("Age of burrows"),
                                                    br(),
                                                    monitor_instruct11.1,
                                                    br(),
                                                    monitor_instruct11.2),
                                             column(4, 
                                                    wellPanel(
                                                      helpText(strong("Tracking tips:")),
                                                      helpText(monitor_instruct11.3),
                                                    ))
                                           )
                                           
                                  ) # close tab panel
                      ) # close tabset panel
                      
             ), # close the tab panel
             
             
             
             ### 5. More information --------------------------------------------------------------------
             tabPanel("More Information", icon = icon("info"),
                      img(src = 'images/banner/IMG_1716.JPG', align = "left", width = '100%', height = 'auto'),
                      
                      
                      br(),
                      br(),
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
                      fluidRow(
                        column(8,
                               h3("Citation"),
                               p("Please cite this work as:"),
                               how_to_cite
                               ),
                        column(4, img(src = 'images/landscape/P5190742.JPG', align = "right", width = '100%', height = 'auto'))
                      ),
                      
                      
                      
                      #### 5.4 Logos, Funding, Collaborators
                      
                      fluidRow(
                        column(4, img(src = 'images/portrait/IMG_1783.JPG', align = "right", width = '100%', height = 'auto')),
                        column(8,
                               strong("Acknowledgements"),
                               br(),
                               acknowledgements,)
                      ), # close fluidrow
                    
                      tags$img(src = "Logos_Extended.png", width = "100%"),
             ),
             
             navbarMenu(("Share"),

                        icon = icon("share-alt"),

                        # For other pages, use the format
                        # tabPanel(tags$a(href = "the url to the shar page", icon("social media icon for the other page"), "Page name" )),

                        # Facebook
                        # tabPanel(tags$a(href = paste0('https://www.facebook.com/sharer/sharer.php?u=', website_url), icon("facebook"), "Facebook" )),

                        # Twitter
                        tabPanel(tags$a(href = paste0('https://twitter.com/intent/tweet?url=', website_url , ' &text=', website_message), icon("twitter"), "Twitter" )),

                        # LinkedIn
                        tabPanel(tags$a(href = paste0('http://www.linkedin.com/shareArticle?mini=true&url=', website_url,' &title=', website_message), icon("linkedin"), "LinkedIn" ))

             )# close navbar2
             
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
    RV$path_similarspecies <- file.path("species", input$animal_species, "similar_species")
    RV$path_legend <- file.path("species", input$animal_species, "legend")
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
  
  # 4.5 Similar species ----------------------------------------------------------------------------------------------------------------------------------------
  
  ## Animal's name in language
  output$animal_similaranimals_text  <- renderUI({
    animal_data()$similar_species
  })
  
  ## Legend
  output$animal_similaranimals_img <- renderUI({
    # Required inputs
    req(input$animal_species, RV$title)
    
    # Files
    f <- list.files(file.path("www",  RV$path_similarspecies))[1]
    p <- file.path(RV$path_similarspecies, f)
    
    # Image
    tags$img(src = file.path(p), width = "100%")
  })
  
  
  # 4.5 Signs (tracks and scats) ----------------------------------------------------------------------------------------------------------------------------------------
  
  ## Animal's name in language
  output$animal_signs  <- renderUI({
    animal_data()$signs
  })
  
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


