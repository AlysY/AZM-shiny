###**********************###
### Arid Zone Monitoring ###
###**********************###
# Project aim:
#
# Author: Alys Young
#
# Collaborators: Sarah Legg, Naomi Indigo
# Others involved in the wider project: Anja Skroblin, Tida Nou, Darren Southwell
#
# Date: Sept 2021
#
# Script aim: Create a shiny app to display the results of the monitoring including the species model outputs and monitoring effort
# Target audience: Land council, ranger groups, NGOs, Gov, NRM
# Communication features: Plain language, images, symnols



##***********##
## 1. Set up ## -------------------------------------------------------------------------------------------------------------------------------
##***********##

# rm(list=ls())

## Read in the other files
# static objects must be after data and optional edits
source("1_functions.R" )      
source("2_setup_and_data.R")         
source("3_optional_edits.R")
source("4_objects_and_code.R")
source("5_text.R")
source("6_plots_and_aesthetics.R")



##*******************##
## 2. User Interface ## -------------------------------------------------------------------------------------------------------------------------------
##*******************##

ui <- fluidPage(
  
  # Navigation bar
  navbarPage(#title = "Arid Zone Monitoring", # title for the title bar
             
             title = actionLink("page_title", "Arid Zone Monitoring"),
             id = "nav", selected = NULL, collapsible = TRUE, 
             theme = shinytheme("flatly"), # theme - edited using css
             windowTitle = "Arid Zone Monitoring", # title for the website  in the internet browser
             
             tags$head(tags$style(css)),
             
             ### 1. Home page -------------------------------------------------------------------------------------------------------------
             tabPanel("Home",
                      icon = icon("home"),
                      img(src = 'images/banner/P5200815_Naomi Indigo.jpg', align = "left", width = '100%', height = 'auto'),
                      div(p("APY lands. Image credit: Naomi Indigo"), style = "font-size: 12px;"),
                      
                      
                      
                      #### 1.1 Background
                      fluidRow(
                        column(9, 
                               h1("Arid Zone Monitoring"),
                               h3("What is the Arid Zone Monitoring project?"),
                               p(intro_1),
                               fluidRow(
                                 column(11, offset = 1,
                                        intro_1.1,
                                        br(),
                                        intro_1.2,
                                        br(),
                                        intro_1.3,
                                        br(),
                                        intro_1.4,
                                        br(),
                                        intro_1.5
                                 )
                               ),
                               br(),
                               h3("Who is the Arid Zone Monitoring project?"),
                               p(intro_2),
                               br()
                        ),
                        
                        column(3, 
                               wellPanel( div(helpText(acknowledgement_of_Country), style = "font-size: 15px;"),
                                          br(),
                                          div(helpText(image_permission), style = "font-size: 15px;"),
                                          br(),
                                          div(em(helpText(cultural_advice)), style = "font-size: 15px;")
                               )
                        )
                        
                      ), # close fluidrow
                      
                      
                      fluidRow(
                        column(3,
                               img(src = 'images/landscape/_DX20096 copy.jpg', align = "left", width = '100%', height = 'auto'),
                               div(p("Karajarri ranger. Image credit: Nicolas Rakotopare"), style = "font-size: 12px;")
                               
                        ),
                        column(3,
                               img(src = 'images/landscape/DJI_0110 copy.jpg', align = "left", width = '100%', height = 'auto'),
                               div(p("Image credit: Nicolas Rakotopare"), style = "font-size: 12px;")
                        ),
                        column(3,
                               
                               img(src = 'images/landscape/Arid Zone Monitoring 2_Nico.jpg', align = "left", width = '100%', height = 'auto'),
                               div(p("Kiwirrkurra rangers. Image credit: Nicolas Rakotopare"), style = "font-size: 12px;")
                               
                        ),
                        column(3,
                               img(src = 'images/landscape/Tracks_Credit Jaana Dielenberg copy.jpg', align = "right", width = '100%', height = 'auto'),
                               div(p("Image credit: Jaana Dielenberg"), style = "font-size: 12px;")
                        )
                        
                        
                      ),
                      h3("Why do we need the Arid Zone Monitoring project?"),
                      p(intro_3.1),
                      br(),
                      p(intro_3.2),
                      br(),
                      p(intro_3.3),
                      br(),
                      
                      
                      ## Video
                      tags$iframe(width = "580", height = "360", src = "https://www.youtube.com/embed/e1ArcUncZCU", frameborder = "0", allow = "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"), # allowfullscreen = NA ; fullscreen
                      br(),
                      
                      ## acknowledgements
                      h3("Acknowledgements"),
                      acknowledgements1,
                      p("The full acknowledgements are available in the “More Information” tab."),
                      br(),
                      div(tags$img(src = "Logos_Extended.jpg", width = "90%"), style = "text-align: center;")
                      
             ), # close tabpanel
             
             
             
             
             
             
             
             
             
             
             ### 2. Survey sites  ---------------------------------------------------------------------------------------------------------
             tabPanel("What was surveyed?",
                      icon = icon("compass"),
                      img(src = 'images/banner/P5200812_Naomi Indigo.jpg', align = "left", width = '100%', height = 'auto'),
                      div(p("Antara-Sandy Bore Indigenous Protected Area. Image credit: Naomi Indigo"), style = "font-size: 12px;"),
                      fluidRow(
                        column(7, survey_overview),
                        
                        column(2, 
                               #actionButton("survey_report", h4("Read the full report (coming soon)"))
                               actionButton(inputId = 'survey_report', label = h4("Read the full report"),  onclick ="window.open('https://www.nespthreatenedspecies.edu.au/publications-and-tools/arid-zone-monitoring-project-report', '_blank')")
                               
                               ),
                        
                        column(2,
                               #actionButton("survey_report2", h4("Read the summary report (coming soon)"))
                               actionButton(inputId = 'survey_sumreport', label = h4("Read the summary report"),  onclick ="window.open('https://www.nespthreatenedspecies.edu.au/publications-and-tools/arid-zone-monitoring-project-summary', '_blank')")
                        
                               ),
                        column(1)
                      ),
                      br(),
                      
                      
                      tabsetPanel(id = "tab_survey",
                                  
                                  
                                  
                                  
                                  #### 2.1 Where -------------------------------------------------------------------------------------------
                                  
                                  tabPanel(h3("Where?"),
                                           
                                           
                                           fluidRow(
                                             column(9, 
                                                    h3(strong(HTML(survey_where_summary))),
                                                    br(),
                                                    
                                                    h3("Project area"),
                                                    survey_area
                                             ),
                                             column(3, 
                                                    img(src = 'images/portrait/Gary Njamme, Jermason Galova, Clifford Sunfly.jpg', align = "right", width = '100%', height = 'auto'),
                                                    div(p("Ngururrpa IPA rangers"), style = "font-size: 12px;")
                                             )
                                           ),
                                           
                                          
                                           
                                           h3("Bringing the data together"),
                                           survey_dataset,
                                           br(),
                                           
                                           div(img(src = 'images/figures/DataProviders.jpg',  width = '60%', height = 'auto'), style = "text-align: center;"),
                                           div(helpText("The locations of data providers within the Arid Zone Monitoring project boundary (red line)."), style = "text-align: center;"),
                                           
                                           br(),
                                           br(),
                                           # survey_providers,
                                           # br(),
                                           
                                           div(img(src = 'images/figures/SpatialExtent.jpg',  width = '50%', height = 'auto'), style = "text-align: center;"),
                                           div(helpText("The locations of all the surveyed sites (red dots) in the Arid Zone Monitoring National Dataset. Some sites have been surveyed several times. Sandy land systems are shown in light yellow."), style = "text-align: center;"),
                                           
                                           br(),
                                           
                                           h3("Where is the data from?"),
                                           survey_jur,
                                           br(),
                                           br(),
                                           #div(helpText("Number of contributors in each state, Number (N.) of sites and records and Number of site visits in the AZM National dataset."), style = "text-align: center;"),
                                           #div(img(src = 'images/figures/Data_By_jurisdiction.jpg', width = '80%', height = 'auto'), style = "text-align: center;"),
                                           
                                           br(),
                                           fluidRow(
                                             column(4, 
                                                    plotOutput("NumberOfSites",  width = '90%'),
                                                    #div(img(src = 'images/figures/Site_jurisdiction.jpg',  width = '60%', height = 'auto'), style = "text-align: center;"),
                                                    div(helpText(HTML(paste0("Number of sites in the Arid Zone Monitoring National Dataset, by jurisdiction. A site is a 1 km",tags$sup("2")," location."))), style = "text-align: center;")
                                                    
                                             ),
                                             column(4,
                                                    
                                                    plotOutput("NumberOfSiteVisits",  width = '90%'),
                                                    #div(img(src = 'images/figures/SiteVisits_jurisdiction.jpg',  width = '60%', height = 'auto'), style = "text-align: center;"),
                                                    
                                                    div(helpText(HTML(paste0("Number of surveys in the Arid Zone Monitoring National Dataset, by jurisdiction. A survey is a visit to a 1 km",tags$sup("2")," site, on one date."))), style = "text-align: center;")
                                                    
                                             ),
                                             column(4,
                                                    plotOutput("NumberOfSpeciesDetections",  width = '90%'), 
                                                    div(helpText("Number of species detections in the Arid Zone Monitoring National Dataset, by jurisdiction. This is the sum of all the species that were observed during each survey."), style = "text-align: center;")
                                             ) # close fluid row
                                           )
                                           
                                  ), # close tabPanel
                                  
                                  #### 2.2 What -------------------------------------------------------------------------------------------
                                  
                                  tabPanel(h3("What?"),
                                           
                                           #div(helpText(survey_effort), style = "font-size: 25px;"),
                                          
                                           br(),
                                           fluidRow(
                                             column(9,
                                                    h3(strong(survey_effort)),
                                                    h3("Survey effort and records"),
                                                    #br(),
                                                    survey_effort_1,
                                                    br(),
                                                    br(),
                                                    survey_effort_2,
                                                    br(),
                                                    survey_effort_3
                                                    
                                             ),
                                             column(3, 
                                                    img(src = 'images/portrait/Karajarri Ranger Jacko points out tracks_Credit Nicholas Rakotopare.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Jacko Shovellor, Karajarri ranger. Image credit: Nicolas Rakotopare"), style = "font-size: 12px;")
                                             )
                                             
                                             
                                           ),
                                           br(),
                                           div(img(src = 'images/figures/Number_Of_Records.jpg', width = '80%', height = 'auto'), style = "text-align: center;"),
                                           div(helpText(HTML(paste0("Summary of survey effort and animal detections in the Arid Zone Monitoring National Dataset. A site is a 1 km",tags$sup("2")," location, so the number of sites shows the number of unique 1 km",tags$sup("2")," locations that have been sampled. The number of surveys tells us how many discrete surveys have taken place. It is higher than the number of sites, because the same site can be revisited over time. The number of species detections is the sum of all the species that were observed during each survey."))), style = "text-align: center;"),
                                           
                                           br(),
                                           
                                           fluidRow(
                                             column(3,
                                                    img(src = 'images/landscape/P5200838_Naomi Indigo copy.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("APY lands. Image credit: Naomi Indigo"), style = "font-size: 12px;")
                                             ),
                                             column(3,
                                                    img(src = 'images/landscape/Martu child Dakato pointing at Mankarr tracks and digging_CREDIT KJ copy.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Martu child pointing at Mankarr tracks. Image credit: KJ"), style = "font-size: 12px;")
                                             ),
                                             column(3,
                                                    img(src = 'images/landscape/Punmu Rangers Recording Data_CREDIT KJ.jpg', align = "right", width = '100%', height = 'auto'),
                                                    div(p("Punmu Rangers. Image credit: KJ"), style = "font-size: 12px;")
                                                    
                                             ),
                                             column(3,
                                                    img(src = 'images/landscape/P5200777_Naomi Indigo copy.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("APY lands. Image credit: Naomi Indigo"), style = "font-size: 12px;")
                                             )
                                           ),
                                           br()
                                           
                                  ), # close tabpanel
                                  
                                  
                                  #### 2.3 When -------------------------------------------------------------------------------------------
                                  
                                  tabPanel(h3("When?"),
                                           
                                           fluidRow(
                                             column(9, 
                                                    h3(strong(survey_when)),
                                                    br(),
                                                    survey_when1
                                             ),
                                             column(3, 
                                                    img(src = 'images/landscape/P5200793_Naomi Indigo.jpg', align = "right", width = '100%', height = 'auto'),
                                                    div(p("Image credit: Naomi Indigo"), style = "font-size: 12px;")
                                             )
                                           ),
                                           
                                           fluidRow(
                                             column(3, 
                                                    wellPanel(
                                                      sliderInput(
                                                        inputId = "sur_year_slider",
                                                        label = "Which decade?",
                                                        min = 1980,
                                                        max = 2010,
                                                        post = "s",
                                                        sep = "",
                                                        value = 1980,
                                                        step = 10,
                                                        animate = animationOptions(interval = 2500, loop = TRUE)),
                                                      div(helpText("To play an animation, click the play button on the right of this box under 2010."), style = "font-size: 12px;")
                                                      
                                                    ) # close well panel
                                             ),
                                             column(9,
                                                    leafletOutput("sur_map_decade", height = 500),
                                                    helpText("Location of sites in the Arid Zone Monitoring National Dataset by decade from 1980s. The number of unique sites sampled each decade is 1982-1989 = 87, 1990-1999 = 847, 2000-2009 = 3517, 2010-2021 = 4387. Note that 418 records were submitted without date meta-data and thus were omitted. 42 records from 2020 are included in 2010-2020 survey count.")
                                             )
                                           ),
                                           br(),
                                           
                                           fluidRow(
                                             column(3,
                                                    img(src = 'images/landscape/SANDPLOT_2.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Image credit: Nicolas Rakotopare"), style = "font-size: 12px;")
                                             ),
                                             column(3,
                                                    
                                                    img(src = 'images/landscape/Ngurrara recording data_Hamsini Biljani copy.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Ngurrara rangers. Image credit: Hamsini Biljani"), style = "font-size: 12px;")
                                                    # img(src = 'images/landscape/Arid Zone Monitoring 2_Nico.jpg', align = "left", width = '100%', height = 'auto'),
                                                    # div(p("Image credit: Nicolas Rakotopare"), style = "font-size: 12px;")
                                             ),
                                             column(3,
                                                    
                                                    img(src = 'images/landscape/P1100315 copy.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Image credit: Jaana Dielenberg"), style = "font-size: 12px;")
                                                    
                                             ),
                                             column(3,
                                                    img(src = 'images/landscape/Arid Zone Monitoring 3_Nico.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Image credit: Nicolas Rakotopare"), style = "font-size: 12px;")
                                             )
                                           ),
                                           br(),
                                           br()
                                  ),
                                  
                                  #### 2.4 Who -------------------------------------------------------------------------------------------
                                  
                                  tabPanel(h3("Who?"),
                                           fluidRow(
                                             column(9, 
                                                    h3(strong(survey_partner)),
                                                    br(),
                                                    survey_partner1
                                             ),
                                             column(3, 
                                                    img(src = 'images/landscape/IMG_5205_Tracks-game_SarahLegge.jpg', align = "right", width = '100%', height = 'auto'),
                                                    div(p("Umuwa, APY Lands, May 2021. Image credit: Sarah Legge"), style = "font-size: 12px;")
                                             )
                                           ),
                                           fluidRow(
                                             column(3, wellPanel(
                                               
                                               ## Select the decade to view
                                               selectInput(inputId  = "sur_year",
                                                           label    = "When?",
                                                           choices  = decades,
                                                           selected =  decades[4]),
                                               
                                               ## Select the partner
                                               checkboxGroupInput(inputId = "sur_partner",
                                                                  label = "Who?",
                                                                  choices = partners,
                                                                  selected = partners) 
                                             )),
                                             column(9, 
                                                    leafletOutput("sur_map_providers", height = 500),
                                                    helpText("Location of sites in the AZM National Dataset by decade from 1980s. Forty-two records from 2020 are included in 2010-2020 site visit count. The number of unique sites sampled each decade is 1982-1989 = 87, 1990-1999 = 847, 2000-2009 = 3517, 2010-2021= 4387. Note that 418 records were submitted without date and were omitted from these maps.")
                                                    
                                             ) # close column
                                           ), # close FluidRow
                                           
                                           br(),
                                           br()
                                  ) # close tabPanel      
                      ) # Close tabset
             ), # close Tab panel
             
             
             
             
             
             
             
             
             ### 3. Results ---------------------------------------------------------------------------------------------------------
             tabPanel("What did we find?",
                      icon = icon("paw"),
                      
                      img(src = 'images/banner/IMG_5230_Traking near Umuwa.jpg', align = "left", width = '100%', height = 'auto'),
                      div(p("Tracking near Umuwa. Image credit: Naomi Indigo"), style = "font-size: 12px;"),
                      
                      tabsetPanel(id = "tab_results",
                                  
                                  
                                  #### 3.1 Search by place ------------------------------------------------------------------------------------------------
                                  
                                  tabPanel(h3("Search by a place"), value = "result_place",
                                           
                                           
                                           h3(strong(uiOutput("resultPlace_title"))),
                                           uiOutput("resultPlace_subtitle"),
                                           fluidRow(
                                             column(6, 
                                                    br(),
                                                    leafletOutput("resultPlace", height = 600),
                                                    br(),
                                                    h3(uiOutput("resultPlace_listtitle")),
                                                    
                                                    DT::dataTableOutput("resultPlace_spList")
                                             ),
                                             column(6, 
                                                    
                                                    h3(uiOutput("resultPlace_plottitle")),
                                                    
                                                    plotOutput("resultPlace_hist", height = 800)
                                             )
                                             
                                           ),
                                           br()
                                  ),
                                  
                                  #### 3.2 Animals records of detections ------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Animal records"), value = "result_all",
                                           
                                           br(),
                                           
                                           
                                           fluidRow(
                                             column(3, 
                                                    wellPanel(
                                                      
                                                      selectizeInput(inputId = "result_spgroup",
                                                                     label = "Pick a group",
                                                                     choices =  list_sp_types), 
                                                      
                                                      selectizeInput(inputId = "result_sp",
                                                                     label = "Pick an animal",
                                                                     choices =  list_sp_all)
                                                    )
                                             ),
                                             column(9,
                                                    h3(strong(animal_results_1)),
                                                    animal_results_2,
                                                    br(),
                                                    animal_results_3
                                             )
                                           ),
                                           br(),
                                           
                                           fluidRow(
                                             
                                             column(6, 
                                                    
                                                    h1(uiOutput("result_sp_map_title")),
                                                    uiOutput("result_sp_map_subtitle"),
                                                    leafletOutput("result_sp_map", height = 600)
                                             ),
                                             
                                             column(6, 
                                                    br(),
                                                    plotOutput("result_sphist", height = 1000)
                                             )
                                           )
                                           
                                           
                                           
                                  ), # close tab panel
                                  
                                  
                                  #### 3.3 Factsheets ------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Animal factsheets"), value = "animals",
                                           
                                           br(),
                                           
                                           ##### 3.3.1 Top of page -----------------------------------------------------------------------------------------------------------------
                                          
                                           fluidRow(
                                             
                                             column(4, wellPanel(
                                               selectizeInput(inputId = "animal_spgroup",
                                                              label = "Pick a group",
                                                              choices =  list_sp_types), 
                                               
                                               selectizeInput(inputId = "animal_species",
                                                              label = "Pick an animal",
                                                              choices =  list_sp_factsheet)
                                               
                                               
                                             )
                                             ),
                                             
                                             column(8,
                                                    uiOutput("animal_mainimage")
                                                    )
                                           ), # close fluid row
                                           
                                           h1(uiOutput("animal_name"), style = "margin-top: 0px;"), ## HEERE-
                                           p(uiOutput("animal_nameLamguage")),
                                           
                                           div(helpText(uiOutput("language_names_disclaimer")), style = "font-size: 12px;"),
                                           br(),
                                           uiOutput("animal_description"),
                                           
                                           br(),
                                           
                                           ## Tabs on the main panel
                                           tabsetPanel(id = "tab_detect",
                                                       
                                                       
                                                       ##### 3.3.2 Detection -----------------------------------------------------------
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
                                                                
                                                                fluidRow(
                                                                  column(6,
                                                                         h3("Detections over time:"),
                                                                         detectionTime_1,
                                                                         br(),
                                                                         br(),
                                                                         uiOutput("animal_detectionTime_text")
                                                                  ),
                                                                  
                                                                  column(6,
                                                                         uiOutput("animal_dectgif"),
                                                                         uiOutput("animal_dect1980"),
                                                                         uiOutput("animal_dect1990"),
                                                                         uiOutput("animal_dect2000"),
                                                                         uiOutput("animal_dect2010"),
                                                                         uiOutput("animal_detect_legend")
                                                                  )
                                                                )
                                                       ),
                                                       
                                                       
                                                       ##### 3.3.3 SDM -----------------------------------------------------------
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
                                                                ),
                                                                wellPanel(
                                                                  p(SDM_2)
                                                                )
                                                       ), # close tab panel
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       ##### 3.3.4 Tracks and scats -----------------------------------------------------------
                                                       tabPanel(h3("Tracks and signs"), value = "signs",
                                                                uiOutput("animal_signs"),
                                                                br(),
                                                                fluidRow(
                                                                  column(3, uiOutput("animal_img1")),
                                                                  column(3, uiOutput("animal_img2")),
                                                                  column(3, uiOutput("animal_img3")),
                                                                  column(3, uiOutput("animal_img4"))
                                                                ),
                                                                br(),
                                                                br()
                                                       ), # close tab panel
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       ##### 3.3.5 Similar animals -----------------------------------------------------------
                                                       tabPanel(h3("Similar animals"), value = "similar",
                                                                
                                                                uiOutput("animal_similaranimals_text"),
                                                                
                                                                uiOutput("animal_similaranimals_img")
                                                       ), # close tab panel
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       
                                                       ##### 3.3.6 More information -----------------------------------------------------------
                                                       tabPanel(h3("Learn more"), value = "information",
                                                                
                                                                htmlOutput("factsheet_link_species"),
                                                                br(),
                                                                htmlOutput("ALA_link_species"),
                                                                br()
                                                       ) # close tab panel
                                           ), # close tabset
                                           br(),
                                           br(),
                                           uiOutput("how_to_cite_species"),
                                           br(),
                                           br()
                                           
                                  ) # close tab panel    
                      ) # close tab set
             ), # close tab
             
             
             
             
             
             
             
             
             
             ### 4. Monitoring -------------------------------------------------------------------------------------------------------------
             tabPanel("How to monitor?",
                      icon = icon("search"),
                      
                      img(src = 'images/banner/Karajarri WA_OCT 2019_ANN JONES-201_banner.jpg', align = "right", width = '100%', height = 'auto'),
                      div(p("Karajarri. Image credit: Ann Jones"), style = "font-size: 12px;"),
                      
                      tabsetPanel(id = "tab_monitor",
                                  
                                  #### 4.1 Designing track-based surveys  ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Designing track-based surveys"),
                                           value = "monitor_method",
                                           #helpText(monitor_overview),
                                           
                                           
                                           fluidRow(
                                             column(9,
                                                    monitor_intro1,
                                                    br(),
                                                    br(),
                                                    monitor_intro2,
                                                    br(),
                                                    br(),
                                                    h3("Monitoring objectives"),
                                                    monitor_intro3,
                                                    br()
                                             ),
                                             column(3,
                                                    img(src = 'images/landscape/Yukultji Napangati looking for tracks_Credit Jaana Dielenberg.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Yukultji Napangati. Image credit: Jaana Dielenberg"), style = "font-size: 12px;")
                                             )
                                           ),
                                           
                                           div(helpText(monitor_table), style = "text-align: center;"),
                                           div(img(src = 'images/figures/MonitoringObjectives.jpg', width = '60%', height = 'auto'), style = "text-align: center;"),
                                           
                                           
                                           fluidRow(
                                             column(3,
                                                    br(),
                                                    img(src = 'images/portrait/Martu kids Kaylene and Dakato learning Mankarr sign watched by Marita_CREDIT KJ.jpg', align = "right", width = '100%', height = 'auto'),
                                                    div(p("Martu kids with Marita. Image credit: KJ"), style = "font-size: 12px;")
                                             ),
                                             
                                             column(9,
                                                    h3("Overall rules of thumb for monitoring programs at local, regional and national scales"),
                                                    #br(),
                                                    monitor_rules1,
                                                    br(),
                                                    br(),
                                                    em("For a monitoring program at the property or IPA scale,"),
                                                    monitor_rules2,
                                                    br(),
                                                    br(),
                                                    em("For a regional monitoring program,"),
                                                    monitor_rules3,
                                                    br()
                                                    
                                                    
                                             )
                                           ),
                                           br()
                                           
                                  ), # close tab panel
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  
                                  #### 4.2 Data collection ----------------------------------------------------------------------------------------------------
                                  tabPanel(h3("Data collection"),
                                           value = "monitor_data",
                                           
                                           fluidRow(
                                             
                                             column(3, br(),
                                                    
                                                    img(src = 'images/landscape/DX20164.jpg', align = "left", width = '100%', height = 'auto'),
                                                    div(p("Karajarri rangers. Image credit: Nicolas Rakotopare"), style = "font-size: 12px;"),
                                                    
                                                    br(),
                                                    img(src = 'images/landscape/Punmu Rangers and elders at an active Mankarr burrow _CREDIT KJ.jpg', align = "right", width = '100%', height = 'auto'),
                                                    div(p("Punmu Rangers. Image credit: KJ"), style = "font-size: 12px;")
                                                    
                                             ),
                                             column(9,
                                                    h3("There are different ways of collecting track-based data:"),
                                                    br(),
                                                    fluidRow(
                                                      column(12,
                                                             monitor_meth1,
                                                             br(),
                                                             monitor_meth2,
                                                             br(),
                                                             p(monitor_meth3, tags$a(href = "https://onlinelibrary.wiley.com/doi/full/10.1111/emr.12543", " E.g. by the Kanyirninpa Jukurrpa Indigenous rangers.")), # Link to Anja's paper
                                                             br()
                                                      )
                                                    ),# close fluid row
                                                    
                                                    
                                                    h3("Looking for animal signs on the road/driving track:"),
                                                    #br(),
                                                    monitor_road1,
                                                    br(),
                                                    br(),
                                                    monitor_datacol1
                                                    
                                             ) # close column
                                           ), # close fluid row
                                           br(),
                                           fluidRow(
                                             column(6,
                                                    br(),
                                                    h3("More information on this topic:"),
                                                    p("To download the standard data recording sheet with instructions, ", tags$a(href = "https://www.nespthreatenedspecies.edu.au/media/15cjoilx/azm-data-recording-sheet-and-instructions.pdf", "click here.", target = "_blank")), #Link to data collection template and instructions
                                                    p("To read the full report that details tracking experts’ perspectives on the data collection template, ", tags$a(href = "https://www.nespthreatenedspecies.edu.au/media/zcbdqsec/azm-report-on-perspectives-on-tracking-data.pdf", "click here.", target = "_blank")), # Anja's report?
                                                    p("To download the preferred data entry templates to store your data, ", tags$a(href = "https://www.nespthreatenedspecies.edu.au/media/3xmbkgjw/azm-data_entry_templates.xlsx", "click here.", target = "_blank")), # Link to data collection template and instructions
                                                    br()
                                                    
                                             ),
                                             column(6,
                                                    wellPanel(
                                                      strong(helpText("Practical tips:")),
                                                      helpText(monitor_tip)
                                                    ) # close wellPanel
                                                    
                                             ) # close cloumn
                                           ), # close fluid row
                                           
                                           monitor_datacol2,
                                           br(),
                                           br()
                                  ) # close tab panel
                                  
                                  
                      ) # close tabset panel
                      
             ), # close the tab panel
             
             
             
             
             
             
             
             ### 5. More information --------------------------------------------------------------------
             tabPanel("More Information", icon = icon("info"),
                      img(src = 'images/banner/P1100031_banner Janna.jpg', align = "left", width = '100%', height = 'auto'),
                      div(p("Looking for tracks near Uluru. Image credit: Jaana Dielenberg"), style = "font-size: 12px;"),
                      br(),
                      
                      ## tagged text
                      # p(tags$a(href = "hyperlink", "Linked text"), "Other text"),
                      # p("Other text", tags$a(href = "hyperlink", "Linked text")),
                      
                      
                      #### 5.1 Reports and outputs
                      h3("Links and reports"),
                      p("The resources available on the", tags$a(href = "https://www.nespthreatenedspecies.edu.au/projects/arid-zone-monitoring-surveys-for-vertebrates-across-arid-and-semi-arid-zones", "National Environmental Science Programme (NESP) Threatened Species Recovery (TSR) hub website ", target = "_blank"), "are:"),
                      
                      
                      strong("Reports:"),
                      fluidRow(
                        column(11, offset = 1,
                               p("•	AZM Project Report"),
                               p("•	AZM Project Summary"),
                               p("•	APY Lands field trip report")
                        )
                      ),
                      br(),
                      
                      
                      strong("Species Profiles:"),
                      fluidRow(
                        column(11, offset = 1,
                               p("•	For 44 species or groups")
                        )
                      ),
                      br(),
                      
                      
                      strong("Monitoring design guidance:"),
                      fluidRow(
                        column(11, offset = 1,
                               p("•	AZM Monitoring design for track-based surveys"),
                               p("•	AZM Summary - Designing a monitoring program for South Australia"),
                               p("•	Detailed example of how to design a regional monitoring program (coming soon)"),
                               p("•	Detailed example of the design of a national monitoring program (coming soon)"),
                               p("•	Detailed analysis of features that affect detectability (coming soon)")
                        )
                      ),
                      br(),
                      
                      strong("Data collection guidance and templates:"),
                      fluidRow(
                        column(11, offset = 1,
                               p("•	AZM Report on perspectives on tracking data"),
                               p("•	AZM Data recording sheet and instructions"),
                               p("•	AZM Data entry templates")
                        )
                      ),
                      br(),
                      
                      
                      
                      #### 5.2 Publications and more infor
                      h3("Further reading"),
                      p(tags$a(href = "https://doi.org/10.1111/cobi.13373", "Skroblin, A., Carboon, T., Bidu, G., Chapman, N., Miller, M., Taylor, K., Taylor, W., Game, E.T. and Wintle, B.A., (2021)."),"Including indigenous knowledge in species distribution modeling for increased ecological insights. Conservation Biology, 35(2), 587-597."),
                      p(tags$a(href = "https://books.google.com.au/books/about/Tales_in_the_Sand.html?id=ts-MQQAACAAJ&redir_esc=y", " Moseby, K.E., Nano, T. and Southgate, R. (2009)."),"Tales in the Sand: A guide to identifying arid zone fauna using spoor and other signs. Ecological Horizons, South Australia."),
                      p(tags$a(href = "https://books.google.com.au/books?hl=en&lr=&id=n1lHDwAAQBAJ&oi=fnd&pg=PP1&dq=Monitoring+Threatened+Species+and+Ecological+Communities&ots=WiUBiVtimB&sig=S3sEYUTaKMEcs7vjZscVIwtYdeA&redir_esc=y#v=onepage&q=Monitoring%20Threatened%20Species%20and%20Ecological%20Communities&f=false", "Legge, S., Lindenmayer, D. B., Robinson, N., Scheele, B., Southwell, D., and Wintle, B. (2018)."),"'Monitoring Threatened Species and Ecological Communities.' CSIRO Publishing: Melbourne, Australia."),
                      p(tags$a(href = "https://doi.org/10.1111/cobi.13178", "Leiper, I., Zander, K. K., Robinson, C. J., Carwadine, J., Moggridge, B. J., and Garnett, S. T. (2018)."), "Quantifying current and potential contributions of Australian indigenous peoples to threatened species management. Conservation Biology 32, 1038-1047."),
                     
                      br(),
                      
                      
                      
                      #### 5.3 Contact
                      h3("Contact us"),
                      p(paste("For more information or enquiries, please contact", contact_name, "on", contact_email)),
                      
                      
                      
                      
                      #### 5.4 Logos, Funding, Collaborators
                      
                      fluidRow(
                        column(3,
                               br(),
                               img(src = 'images/portrait/P5200833_Naomi Indigo.jpg', align = "right", width = '100%', height = 'auto'),
                               div(p("Antara-Sandy Bore Indigenous Protected Area. Image credit: Naomi Indigo"), style = "font-size: 12px;")
                        ),
                        column(9,
                               
                               h3("Acknowledgements"),
                               acknowledgements1,
                               br(),
                               br(),
                               acknowledgements2,
                               br(),
                               br(),
                               acknowledgements3)
                      ), # close fluidrow
                      br(),
                      br(),
                      
                      div(tags$img(src = "Logos_Extended.jpg", width = "90%"), style = "text-align: center;")
             ),
             
             navbarMenu(("Share"),
                        
                        icon = icon("share-alt"),
                        
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
  
  observeEvent(input$page_title, {
    updateNavbarPage(session, "nav", "Home")
  })
  
  # Data --------------------------------------------------------------------
  # sur_df <- reactive({
  #   
  #   df_PA
  # })
  # 
  
  # Plots -------------------------------------------------------------------
  output$NumberOfSites <- renderPlot({
    Num1
  })
  
  output$NumberOfSiteVisits <- renderPlot({
    Num2
  })
  
  output$NumberOfSpeciesDetections <- renderPlot({
    Num3
  })
  
  
  
  
  # Surveys -----------------------------------------------------------------
  output$sur_map_decade <- renderLeaflet({
    l 
  })
  
  observeEvent(input$sur_year_slider, {
    p <- get(paste0("sf_decade_", input$sur_year_slider))
    
    leafletProxy("sur_map_decade") %>%
      clearMarkers() %>%
      addCircleMarkers(data = p,
                       radius = 4,
                       color = "#000000",
                       weight = 1,
                       fillColor = "#1159CA", # pal_provider(p$Group)
                       fillOpacity = 0.9)
    
    
    
  })
  
  
  ## Map - by providers and time
  output$sur_map_providers <- renderLeaflet({
    
    #Required inputs
    req(input$sur_year)
    
    
    
    if(is.null(input$sur_partner)) {
      df_dect_dec <- data.frame()
    } else {
      
      df_dect_dec <- df_PA %>%
        dplyr::select(Year, Decade, Long.cell, Lat.cell, Group) %>%
        filter(Group %in% input$sur_partner) %>%
        filter(Decade == input$sur_year) %>%
        distinct()
    }
    
    if (nrow(df_dect_dec) == 0){
      l %>% 
        addLegend("bottomright", 
                  title = "No data available",
                  colors = "#FFFFFF",
                  labels = "Select other inputs",
                  opacity = 1)
      
    } else if(nrow(df_dect_dec) > 0){
      data_partners <- sort(unique(df_dect_dec$Group))
      # turn into spatial points
      sf_dect_dec <- st_as_sf(df_dect_dec, coords = c("Long.cell", "Lat.cell"), crs = st_crs(Aus))
      
      l  %>%
        addLegend("bottomright", 
                  pal = pal_provider, 
                  values = data_partners,
                  title = "Survey partners",
                  opacity = 1,
                  labFormat = function(type, cuts, p) { 
                    paste0(data_partners) }) %>%
        addCircleMarkers(data = sf_dect_dec,
                         radius = 4,
                         color = "#000000",
                         weight = 1,
                         fillColor = pal_provider(sf_dect_dec$Group),
                         fillOpacity = 0.9,
                         label = sf_dect_dec$Group,
                         popup = paste0('<strong>Partner: </strong>', sf_dect_dec$Group, '</br><strong>Year: </strong>', sf_dect_dec$Year))
      
      
    }
  })
  
  
  # Results by place --------------------------------------------------------
  output$resultPlace <- renderLeaflet({
    img <- paste0("www/images/logos/", AZM_provider$Polygon_name,".jpg")
    
    l %>%
      setView(lng = 132,  lat = -25, zoom = 5) %>%
      addPolygons(data = AZM_provider,
                  opacity = 0.7,
                  layerId = ~AZM_provider$NAME,
                  color = "#1159CA",
                  group = "AZM_provider", 
                  label = AZM_provider$providers_list) %>%
      addPopupImages(img, group = "AZM_provider",
                     width = 300 # height has issues
      )
  })  
  
  
  
  output$resultPlace_title <- renderText({
    if (is.null(input$resultPlace_shape_click$id)){
      t  <- "Click on the map to select a place and see all the animals recorded there."
    } else {
      df_PA2 <- dataprov %>%
        filter(AZM_Poly == input$resultPlace_shape_click$id)
      
      data_name <- df_PA2 %>%
        select(Polygon_name) %>%
        unique() %>%
        pull()
      
      t <- paste0("Animals found in ", data_name)
    }
    t
    
  })
  
  output$resultPlace_subtitle <- renderText({
    req(input$resultPlace_shape_click$id)
    
    
    df_PA2 <- dataprov %>%
      filter(AZM_Poly == input$resultPlace_shape_click$id)
    
    data_name <- df_PA2 %>%
      select(Polygon_name) %>%
      unique() %>%
      pull()
    
    data_collab <- df_PA2 %>%
      select(providers_list) %>%
      unique() %>%
      pull()
    
    t <- paste0("The animals found in ", data_name, " by ", data_collab, ".")
    
    t
    
  })
  
  output$resultPlace_listtitle <- renderText({
    req(input$resultPlace_shape_click$id)
    
    t <- paste0("List of animals")
    
    t
  })
  
  
  output$resultPlace_plottitle <- renderText({
    req(input$resultPlace_shape_click$id)
    
    t <- paste0("Number of detections of animals")
    
    t
  })
  
  output$resultPlace_spList <- DT::renderDataTable({
    req(input$resultPlace_shape_click$id)
    
    df_PA2 <- dataprov %>%
      filter(AZM_Poly == input$resultPlace_shape_click$id)
    
    data_name <- df_PA2 %>%
      select(Polygon_name) %>%
      unique() %>%
      pull()
    
    col_to_name <- paste0("Animals found in ", data_name)
    
    data <- df_PA2 %>%
      select(CommonName) %>%
      unique() %>%
      arrange(CommonName) %>%
      rename(!!purrr::set_names("CommonName", col_to_name))
    
    dt <- DT::datatable(data       = data, 
                        rownames   = FALSE,
                        class      = 'cell-border hover compact',
                        extensions = c('Buttons'),
                        options    = list(scrollX = TRUE,
                                          pageLength = 25,
                                          buttons   = c('copy', 'csv', 'excel', 'pdf', 'print'),
                                          dom       = 'ltpB'))
    dt
  })
  
  
  
  output$resultPlace_hist <- renderPlot({
    
    ## required inputs
    req(input$resultPlace_shape_click$id)
    
    df_PA2 <- df_P_nodate %>%
      filter(AZM_Poly == input$resultPlace_shape_click$id) %>%
      select(CommonName, Group_class) %>%
      mutate(invasive = ifelse(Group_class ==  "Introduced_mammal", 1, 0)) %>%
      group_by(CommonName) %>%
      summarise(n = n(),
                invasive_mam = unique(invasive),
                Group_class = unique(Group_class)) %>%
      arrange( desc(n)) #invasive_mam,
    
    
    
    df_PA2$CommonName <- gsub("_", " ", df_PA2$CommonName)
    df_PA2$CommonName <- gsub("\\.", " ", df_PA2$CommonName)
    df_PA2$CommonName <- factor(df_PA2$CommonName, levels = rev(unique(df_PA2$CommonName)))
    df_PA2$Group_class[df_PA2$Group_class == "Introduced_mammal"] <- "Introduced mammal"
    pal <- AZM_palette$Groups[unique(df_PA2$Group_class)]
    
    g_result_place +
      geom_bar(data     = df_PA2,
               aes(x    = CommonName,
                   y    = n,
                   fill = Group_class),
               stat     = "identity")  +
      scale_fill_manual(values = pal)
  })
  
  
  
  
  
  
  
  # Results - detections  -----------------------------------------------------------------------------------
  
  # Update the list of animal by the group selected
  observeEvent(input$result_spgroup, {
    
    resulting_group <- input$result_spgroup
    
    if(input$result_spgroup == "Native mammal"){
      resulting_group <- "Mammal"
    }
    
    # Data
    data <- df_P_nodate %>%
      filter(GroupClass == resulting_group) %>%
      select(CommonName) %>%
      distinct() %>%
      arrange(CommonName) %>%
      pull()
    
    # Update inputs
    updateSelectizeInput(session,
                         inputId = "result_sp",
                         label = "Pick an animal",
                         choices = data)
    
    
  })
  
  
  ## Title
  output$result_sp_map_title <- renderUI({
    req(input$result_sp)
    t <- paste0("Detection of the ", input$result_sp)
  })
  
  ## Subtitle
  output$result_sp_map_subtitle <- renderUI({
    req(input$result_sp)
    t <- paste0("Detections (blue) and non-detections (grey) of the ", input$result_sp, " at AZM sites")
  })
  
  ## Map
  output$result_sp_map <- renderLeaflet({
    # Required input
    req(input$result_sp)
    
    # clean the dataframe
    df_animal <- df_P_nodate %>% 
      dplyr::filter(CommonName == input$result_sp) %>%
      dplyr::select(Year, Decade, Long.cell, Lat.cell, CommonName, Scientific.name, GroupClass, Group) %>%
      distinct() # remove repeated locations
    
    # turn into a spatial object
    sf_animal <- st_as_sf(df_animal, coords = c("Long.cell", "Lat.cell"), crs = st_crs(Longlat_crs))
    
    # Labels for the legend
    labels <- c("AZM boundary", "Detection sites", "Non-detection sites")
    
    # plot
    l %>%
      setView(lng = 132,  lat = -25, zoom = 4) %>%
      addLegend("bottomright", 
                pal = pal_plot, 
                values = 1:3,
                title = "Arid Zone Monitoring areas",
                opacity = 1,
                labFormat = function(type, cuts, p) { 
                  paste0(labels) }) %>%
      addCircleMarkers(data = sf_sites,
                       radius = 3,
                       color = "#7A7A7A",
                       weight = 1,
                       fillColor = "#7A7A7A",
                       fillOpacity = 1) %>%
      addCircleMarkers(data = sf_animal,
                       radius = 7,
                       color = "#FFFFFF",
                       weight = 1,
                       fillColor = pal_plot(2),
                       fillOpacity = 1,
                       label = df_animal$Year,
                       popup = paste0('<strong>', df_animal$CommonName, '</strong></br><strong>Type of animal: </strong>',  df_animal$GroupClass, '</br><strong>Year: </strong>', df_animal$Year))
    
    
  })
  
  
  ## Histogram
  output$result_sphist  <- renderPlot({
    req(input$result_sp)
    
    df  <- df_result_sp
    df$Group_class[df$CommonName == input$result_sp] <- "Selected"
    df$Group_class[df$Group_class == "Introduced_mammal"] <- "Introduced mammal"
    
    g_result_sp +
      geom_bar(stat     = "identity",
               data     = df, 
               aes(x    = CommonName,
                   y    = n, 
                   fill = Group_class)) +
      labs( y = "Number of detections in total", x = "Animals", fill = "Type of animal")
  })
  
  
  
  
  
  
  # 4. Results factsheets ---------------------------------------------------------------------------------------------------------------------
  
  # citation
  output$how_to_cite_species  <- renderUI({
    how_to_cite_species <- paste0("NESP Threatened Species Recovery Hub, 2021. Arid Zone Monitoring Species Profile: ", input$animal_species, ", Project 3.2.5 findings factsheet. ")
    
  })
  
  
  ## Filter the data
  animal_data <- reactive({
    data <- sp_data %>% filter(Common_name == input$animal_species)
  })
  
  observeEvent(input$animal_spgroup, {
    
    l <- list_sp_factsheet[names(list_sp_factsheet) == input$animal_spgroup]
    l2 <- unlist(l, use.names = FALSE)
    
    # Update inputs
    updateSelectizeInput(session,
                         inputId = "animal_species",
                         label = "Pick an animal",
                         choices = l2)
  })
  
  
  
  
  ## 4.1 Reactive values ---------------------------------------------------------------------------------------------------------------------
  RV <- reactiveValues(title = NULL, gif = TRUE) 
  
  observeEvent(input$animal_species, {
    RV$title <- input$animal_species
    RV$path <- file.path("species", input$animal_species)
    RV$path_image <- file.path("species", input$animal_species, "main_image")
    RV$path_signs <- file.path("species", input$animal_species, "signs")
    RV$path_similarspecies <- file.path("species", input$animal_species, "similar_species")
    RV$path_SDMlegend <- file.path("species", input$animal_species, "SDM", "legend")
    RV$path_SDM <- file.path("species", input$animal_species, "SDM")
    RV$path_detect <- file.path("species", input$animal_species, "detection")
    
    RV$path_detectlegend <- file.path("species", input$animal_species, "detection", "time", "legend")
    RV$path_factsheet <-  file.path("species", input$animal_species, "factsheet", list.files(file.path("www", "species", input$animal_species, "factsheet"))[1])
    
    RV$gif <- (length(list.files(file.path("www",  RV$path_detect, "time"), pattern = "gif")) < 1)
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
    # tags$img(src = file.path(p), width = "105%", height = "auto")
    tags$img(src = file.path(p), width = "auto", height = "200px")
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
  
  observeEvent(input$animal_species, {
    f <- list.files(file.path("www",  RV$path_detect, "time"))
    
    RV$detection_plots <- ifelse(length(f) > 0, TRUE, FALSE)
  })
  
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
    img(src = file.path(p), width = "90%")
  })
  
  
  ## Images
  ## 1980
  output$animal_dect1980 <- renderUI({
    req(RV$gif)
    
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "1980")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  ## 1990
  output$animal_dect1990 <- renderUI({
    req(RV$gif)
    
    
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "1990")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  ## 2000
  output$animal_dect2000 <- renderUI({
    req(RV$gif)
    
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "2000")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  ## 2010
  output$animal_dect2010 <- renderUI({
    req(RV$gif)
    
    # Files
    f <- list.files(file.path("www",  RV$path_detect, "time"), pattern = "2010")
    p <- file.path(RV$path_detect, "time", f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
  })
  
  
  ## Legend
  output$animal_detect_legend <- renderUI({
    # Required inputs
    req(input$animal_species, RV$title, RV$detection_plots)
    
    f <- list.files(file.path("www",  RV$path_detectlegend))[1]
    p <- file.path(RV$path_detectlegend, f)
    
    # Image
    tags$img(src = file.path(p), width = "80%")
    
  })
  
  # 4.4 SDM -----------------------------------------------------------------------------------------------------------------
  # ## Ideally have a show/hide depending if information is available, however it didnt work this way
  # observeEvent(input$animal_species, {
  #   f <- list.files(file.path("www",  RV$path_SDM), pattern = "jpg")
  #   
  #   RV$SDM_plots_T <- ifelse(length(f) > 0, TRUE, FALSE)
  #   RV$SDM_plots_F <- ifelse(length(f) > 0, FALSE, TRUE)
  # })
  # 
  # observeEvent(input$animal_species, {
  #   req(RV$SDM_plots_T)
  #   showTab(inputId = "tab_detect", target = "SDM")
  # })
  # 
  # observeEvent(input$animal_species, {
  #   req(RV$SDM_plots_F)
  #   hideTab(inputId = "tab_detect", target = "SDM")
  # })
  
  ## Animal specific text
  output$animal_SDM_text  <- renderUI({
    animal_data()$SDM_description
  })
  
  ## Plot/image
  output$animal_SDM <- renderUI({
    
    # Files
    f <- list.files(file.path("www",  RV$path_SDM), pattern = "jpg")
    p <- file.path(RV$path_SDM, f)
    
    # Image
    tags$img(src = file.path(p), width = "100%")
  })
  
  ## Legend
  output$animal_SDM_legend <- renderUI({
    # Required inputs
    req(input$animal_species, RV$title)
    
    f <- list.files(file.path("www",  RV$path_SDMlegend))
    p <- file.path(RV$path_SDMlegend, f)
    
    # Image
    tags$img(src = file.path(p), width = "100%")
    
  })
  
  
  # 4.5 Similar species ----------------------------------------------------------------------------------------------------------------------------------------
  
  ## Animal's name in language
  output$animal_similaranimals_text  <- renderUI({
    animal_data()$similar_species
  })
  
  ## Legend
  output$animal_similaranimals_img <- renderUI({
    # Required inputs
    req(input$animal_species, RV$title, RV$path_similarspecies)
    
    # Files
    files <- list.files(file.path("www",  RV$path_similarspecies))
    f <- files[1]
    p <- file.path(RV$path_similarspecies, f)
    
    
    
    if (length(files) == 0 ) {
      tags$img(src = "blank.png", width = "20%")
    } else if (length(files) >= 1) {
      tags$img(src = file.path(p), width = "50%")
    }
    
  })
  
  
  
  
  
  # 4.5 Signs (tracks and scats) ----------------------------------------------------------------------------------------------------------------------------------------
  
  ## Animal's name in language
  output$animal_signs  <- renderUI({
    animal_data()$signs
  })
  
  output$animal_img1  <- renderUI({
    ## Files
    files <- list.files(file.path("www",  RV$path_signs))
    
    
    if (length(files) < 1) {
      tags$img(src = "blank.png", width = "100%")
    } else {
      # Files
      f <- list.files(file.path("www",  RV$path_signs))[1]
      p <- file.path(RV$path_signs, f)
      
      # Image
      tags$img(src = file.path(p), width = "100%") 
    }
  })
  
  output$animal_img2 <- renderUI({
    ## Files
    files <- list.files(file.path("www",  RV$path_signs))
    
    if (length(files) < 2) {
      tags$img(src = "blank.png", width = "100%")
    } else {
      # Files
      f <- list.files(file.path("www",  RV$path_signs))[2]
      p <- file.path(RV$path_signs, f)
      
      # Image
      tags$img(src = file.path(p), width = "100%") 
    }
  })
  
  
  output$animal_img3 <- renderUI({
    ## Files
    files <- list.files(file.path("www",  RV$path_signs))
    
    if (length(files) < 3) {
      tags$img(src = "blank.png", width = "100%")
    } else {
      # Files
      f <- list.files(file.path("www",  RV$path_signs))[3]
      p <- file.path(RV$path_signs, f)
      
      # Image
      tags$img(src = file.path(p), width = "100%") 
    }
    
  })
  
  
  output$animal_img4 <- renderUI({
    files <- list.files(file.path("www",  RV$path_signs))
    
    
    if (length(files) < 4) {
      tags$img(src = "blank.png", width = "100%")
    } else {
      # Files
      f <- list.files(file.path("www",  RV$path_signs))[4]
      p <- file.path(RV$path_signs, f)
      
      # Image
      tags$img(src = file.path(p), width = "100%") 
    }
  })
  
  
  # .# download factsheet ----------------------------------------------------------------------------------
  
  
  ## When the factsheets are uploaded, add the url to the species table
  output$factsheet_link_species <- renderUI({
    
    t <- sp_data %>%
      filter(Common_name == input$animal_species) %>%
      select("Factsheet URL") %>%
      pull()
    t3 <- paste0("<p> To see the full factsheet created by the Arid Zone Monitoring project for the ", t, "</p>")
    
    HTML(t3)
  })
  
  output$ALA_link_species <- renderUI({
    
    t <- sp_data %>%
      filter(Common_name == input$animal_species) %>%
      select("ALA URL") %>%
      pull()
    
    # t2 <- p("To learn more about the ")
    t3 <- paste0("<p> To see the Atlas of Living Australia page for the ", t, "</p>")
    HTML(t3)
  })
  
  
  
} # close server function







##**************##
## 4. Shiny App ## ---------------------------------------------------------------------------------------------------
##**************##
shinyApp(server = server, ui = ui)


