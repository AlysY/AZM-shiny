###**********************###
### Arid Zone Monitoring ###
###**********************###
# Project aim:
#
# Author: Namoi Indigo and Alys Young
#
# Collaborators: Sarah Legg, Naomi Indigo, Anja Skroblin, Darren Southwell
#
# Date: Sept 2021
#
# Script aim: Text within the shiny app

#   div(p("Image credit: Ellen Ryan Colton"), style = "font-size: 15px;"),

#   img(src = 'images/banner/Banner APY 2 ha plot tracking Anpuru-19_Ellen Ryan_Colton.jpg', align = "left", width = '100%', height = 'auto'),
#   div(p("Image credit: Ellen Ryan Colton"), style = "font-size: 15px;"),


# Landing page --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
acknowledgement_of_Country <- "This work was undertaken on the lands of many Indigenous groups and in collaboration with many Indigenous people. We acknowledge these Traditional Owners and their ongoing custodianship of Country, and pay respect to their past & present Elders."

image_permission <- "All people in the images have given permission to use their images on this website only. Please do not use them without permission for other purposes."

cultural_advice <- "Aboriginal and Torres Strait Islander viewers are advised that while we aim to remove images, videos and voices of people who have died, these may still be present. Please let us know if you are aware of an image that should be removed."

#acknowledgements1 <- "The Arid Zone Monitoring project is a collaboration between over 40 groups and individuals who work in the deserts. The concept of using track-based surveys as monitoring tool was pioneered by ecologists working in the deserts from the 1980s to today, particularly Katherine Moseby, Rick Southgate, Reece Pedler and Rachel Paltridge. The Arid Zone Monitoring Project builds upon their collective endeavours."

# acknowledgements2 <- "The data collation, analysis and reporting for the Arid Zone Monitoring Project was carried out by Naomi Indigo, Anja Skroblin, Tida Nou, Darren Southwell, Liam Grimmett, Taleah Watego, Steve Wilson, Mary Cryan, Jaana Dielenberg, Sarah Legge, with help from the project partners, and guidance from arid zone ecologists Katherine, Rick and Rachel. The website was built by Alys Young."

acknowledgements1 <- "The project was funded by the Australian Government’s National Environmental Science Program through the Threatened Species Recovery Hub. The Arid Zone Monitoring Project distils the very large collective effort of many people – Traditional Owners, Indigenous rangers, university researchers, consultants, and government staff - who live and work in Australia’s deserts."

acknowledgements2 <- "The data collation, analysis and reporting for the Arid Zone Monitoring Project was carried out by Naomi Indigo, Anja Skroblin, Darren Southwell, Tida Nou, Liam Grimmett, Taleah Watego, Steve Wilson, Mary Cryan, Jaana Dielenberg, Katherine Moseby, Rick Southgate, and Sarah Legge. The website was built by Alys Young. The project was guided by all the partners, too many to list here, but we would particularly like to acknowledge some individuals who have used, or advocated for, coordinated track-based monitoring for many years, and who provided valuable advice to the project. As well as Katherine and Rick, this includes Rachel Paltridge (Kiwirrkurra); Laurie Tait, Kim Webeck, Sam Rando and Thalie Paltridge (Central Land Council); Danae Moore (AWC); Joe Benshemesh (Maralinga); Dorian Moro (Wiluna Rangers); Martin Dziminski (WA DBCA); Chris Curnow (WA Rangelands); Peter See (10 Deserts, Country Needs People); Pete Copley, Cat Lynch and Dan Rogers (SA DENR); Rob Brandle (SAAL NRM Board). Many more people have made the project possible, by collecting and sharing data, supporting data collection by rangers, facilitating project communication, and by being sounding boards."

# What is the Arid Zone Monitoring project?
intro_1.1 <- "The Arid Zone Monitoring project is a collaboration between the Australian Government National Environmental Science Program’s Threatened Species Recovery Hub and over 40 partners. The partners are Indigenous ranger groups and Indigenous organisations, NGOs and NRM groups, government agencies and institutions, and individual researchers and consultants."


# Why do we need the Arid Zone Monitoring project?
intro_1.2 <- "Monitoring animal populations in Australia’s sandy deserts is challenging. Many animal populations are at low density, have patchy distributions, and boom-bust population cycles, making it hard to understand patterns when working at single site, or for short periods of time."

intro_1.3.1 <- "Many individuals and groups across Australia’s deserts have collected data using track-based methods (i.e. searching an area to record animal presence based on their tracks, scats, diggings, or other signs). Surveys have mainly been carried out to describe the species present in an area. Track-based surveys are also excellent opportunities for people to get out on Country, share skills and pass knowledge between generations."

intro_1.3.2 <- "If the local-scale data collected by many independent groups were collated into a single dataset, the combined dataset could be used to describe species distributions and changes over time, across Australia’s deserts. Collaborative track-based monitoring could contribute to regional or national monitoring of native and feral species, improve our understanding of environmental processes, and allow us to monitor the outcome of fire and feral animal management, and other actions."

# What does the The Arid Zone Monitoring (AZM) project do?
intro_1.4 <- "Some of the information from past track-based surveys had been collated, but most was still dispersed across the many groups that gathered the data, and therefore inaccessible for national-scale analyses. "


# Aims
intro_2 <- "The project works with desert groups to:"

intro_2.1 <- "•	Gather existing track and sign data into a single dataset."

intro_2.2 <- "•	Explore whether this dataset could be used to map the distributions of desert species and look for trends in abundance over time."

intro_2.3 <- "•	Understand what guidance would support future sampling design and data collection."

intro_2.4 <- "•	Showcase the work being carried out in the deserts, especially by Indigenous ranger groups."

intro_2.5 <- "•	Lay the groundwork for creating ongoing, national-scale monitoring for desert wildlife."


# intro_1.5 <- "The AZM national database includes almost 50,000 species presence records from over 5300 unique sites and almost 15,000 site visits, over the period from 1982 to 2021. The project showcases the collective work carried out by all groups working across the arid zone, and lays the groundwork for creating ongoing, national-scale monitoring for desert wildlife."

# Tips
# intro_3.1 <- "Use this website to see when and when the monitoring has happened and by which organisations. You can also look at specific species using the tabs at the top of the page."

# Surveys  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
survey_overview <- "This section summarises key descriptive statistics from the National Dataset. For full details on how data were gathered, cleaned and processed, download the Arid Zone Monitoring Project National Data Collation report." #the National Data Collation Report. 

# Where did the surveys happen?
survey_where_summary <- "The Arid Zone Monitoring project covers 3,273,140 km2 of Australia’s arid and semi-arid regions. This area is looked after by Traditional Owners and Indigenous Rangers, NGOs, and government agencies. Many of these groups, as well as independent ecologists and consultants, have carried out wildlife surveys by searching for tracks, scats and diggings using standardised methods."

# Defining the project area
survey_area <- "The project area includes all of Australia’s sandy desert bioregions, with an extension in the northwest to include the Pindanland subregion (Dampierland bioregion), and another extension into the Gascoyne and Pilbara bioregions. Defining the project boundary is necessary for setting the ‘environmental envelope’ used in distribution modelling."

# Brining the data together
survey_dataset <- "The Arid Zone Monitoring National Dataset is a collation of 69 datasets, shared by 37 different groups and individuals who have carried out track-based surveys across Australia."

# data providers
# survey_providers <- "Data were collected by Indigenous rangers, government scientists, university scientists, NGOs and consultants. The data were collected to meet a range of objectives, from surveys focussed on single species to general fauna surveys. Many datasets arose from programs that aimed to provide opportunities for on-country trips and knowledge exchange."





## What - the data. survey effort

survey_effort <- "Overall, the project partners detected almost 50,000 species records, from almost 15,000 surveys, carried out at over 5300 unique sites across the desert."

survey_effort_1 <- "Records of animals were made using several different survey methods. The most common method was a 2 ha sand plot survey (sometimes called a sign survey, track survey, 2 hectaresand plot, cybertracker survey or Tracks App survey). In a 2 ha sand plot survey, observers search a 2 ha area for signs of animal presence and record information about the habitat or tracking conditions."

survey_effort_2 <- "Transect surveys, where observers search for tracks along a linear path, were also common. Timed searches are when observers look for animal signs for a set length of time. This includes searches carried out on foot or by a slow-moving vehicle. Some records were ‘incidental’, where observers noticed and recorded the track, scat or digging, but they were not carrying out a formal survey."

survey_effort_3 <- "In some surveys, observers recorded which species were absent, as well as those that were present. This absence information can be very useful is some types of analyses. Information on absence data is summarised in the Arid Zone Monitoring Project report."



# Data by jurisdiction
survey_jur <- "South Australian partners shared data from the greatest number of sites and surveys, followed by Western Australia and the Northern Territory.  The number of partners that shared data varied from 16 for WA, 14 for the NT, one for Qld and six for SA."


## TAB 3 - WHEN

survey_when <- "Track-based surveys were pioneered by ecologists working with Traditional Owners in the 1980s, but the method spread, and is now used by many different groups working in the deserts."

survey_when1 <- "The Arid Zone Monitoring National Dataset contains records for the period 1982 to 2021, although there are few records in the first decade or so. Early data were mostly from South Australia. Data began to accumulate in Western Australia and Northern Territory starting from early 2000s."


## TAB 4 - WHO
survey_partner <- "Track-based surveys were pioneered by ecologists working with Traditional Owners in the 1980s, but the method spread, and is now used by many different groups working in the deserts."

survey_partner1 <- "Over time the types of organisations or individuals carrying out surveys has shifted. The data shared by the South Australian government is based on work by several ecologists, consultants and others who developed the 2 ha plot method in the 1980s. More recently, Indigenous groups, NGOs and NRM groups began using the method more widely."



# Animals that we found  --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

animal_results_1 <- "The AZM National Dataset contains records of 76 species: 27 native mammal species, 11 introduced mammal species, 4 bird species and 34 reptile species."

animal_results_2 <- "The dataset also contains records where sign was not attributed to a species, but was identified to genus level (3 mammal and 5 reptile genera), or a higher group level (3 mammal groups, 1 bird group, 5 reptile groups, 1 frog group and 1 invertebrate group)."

animal_results_3 <- "The maps summarise the detections of this species in the AZM dataset. Each blue dot shows a survey site where the species was records; the grey dots show all the other sites that were surveyed, but where the species was not recorded. These records were made by Indigenous Ranger groups, land councils, NGOs, government agencies and university researchers. It is possible that extra surveys have been carried out that have not yet been shared. If you see ‘gaps’ in the maps that you could fill by sharing your data, let us know."

#animal_results_4 <- "The maps summarise the detections of this species in the AZM dataset. Each blue dot shows a survey site where the species was records; the grey dots show all the other sites that were surveyed, but where the species was not recorded. These records were made by Indigenous Ranger groups, land councils, NGOs, government agencies and university researchers. The overall distribution of the species is shown in the map background."



# Animals with more info --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

language_names_disclaimer <- "These are the names that we have collected during the project. There are many more names. If you would like to include other names, please email us."

detectionTime_1 <- "The maps summarise the detections of the animal over time in the AZM dataset. Each blue dot shows a survey site where the animal was recorded in that decade. The grey dots show all the other sites that were surveyed, but where the animal was not recorded in that decade. "

detectionRate_1 <- "The map shows the average animal detection rate across all surveys carried out in each bioregion, since the 1980s. Detection rates for the animal have been highest in bioregions with the darkest blue shading."

SDM_1 <- "The habitat suitability model can tell us about where the animal is most likely to be found. The analysis considered climate factors like annual, seasonal and daily temperature and rainfall; landform factors like elevation and slope; soil factors; and habitat factors like the amount of green vegetation (NDVI) and fire frequency."

SDM_2 <- "Caveats: The map only shows habitat suitability inside the Arid Zone Monitoring project boundary, but some desert species are also found outside this area, and may even be more common away from the deserts. The habitat suitability model does not predict well in areas where there has not been any sampling, for example in parts of the Great Sandy Desert and the Great Victoria Desert; getting more survey data from these areas would improve the models."






# Monitoring --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


## track based survey design
monitor_overview <- "Where to survey, how many sites, and do you need to revisit sites?"

# What do you want to know?
monitor_intro1 <- "Track-based surveys are great for detecting species that live in sandy deserts, but not as good for species that prefer rocky habitats, or species with distributions that are mostly outside the central deserts. Other survey methods will be better for these types of animals."

monitor_intro2 <- "The method also works best for larger-bodied animals with tracks that are easily identified, such as mulgara, goannas, bilby, cats, dingoes, and camels. If you want to monitor smaller animals, like small mice and dasyurids (e.g. dunnarts), small reptiles, and small birds, then there are better survey methods to use."

monitor_intro3 <- "Like all surveys, track-based surveys need to be designed carefully to record data that are useful for answering the questions your team is interested in. It is best to get advice from an experienced ecologist to design your survey, but general guidelines are:"

monitor_intro4 <- "Decide why you are monitoring early (this is called the monitoring objective). Knowing your monitoring objective affects decisions about where to survey, how many sites to survey, and how often to re-visit them."

monitor_table <- "The table below shows some examples of monitoring objectives and the different needs required for where to put sites, and whether you need to revisit them over time to achieve the monitoring objective:"

## Overall rules of thumb for monitoring programs at local, regional and national scales

monitor_rules1 <- "Try to keep sites more than 4-5 km apart from each other, so that your samples are ‘independent’, and it’s unlikely that the same individual animals are leaving prints across the sites."

# For a monitoring program at the property or IPA scale
monitor_rules2 <- "sampling 30 sites (from a set of about 60 sites) each year, split across the main habitat types, should pick up changes in the detections rates or occupancy of most species. If you increase the number of sites sampled in a year, you will have a greater chance of picking up change, especially if the change is small. If there are rare species that are targets for the survey, you may need extra sites clustered in the area where that species occurs – your team may use exiting species distribution maps, AZM maps or local knowledge to find where this is in the survey area."

# For a regional or national monitoring program
monitor_rules3 <- "about 200 sites are needed to have a high chance at detecting moderate (~30%) declines for most species (based on analysis of South Australian data). These sites could be spread across several IPAs, national parks, and other properties, so that any one team is sampling only part of the whole set of sites."

monitor_tip <- "How easily a sign is detected varies greatly between species and the age of the sign, but is influenced most by the tracking conditions. It is important to set up sites in places where the tracking surface is good, and to collect data when weather and light conditions are best. Surveys should not be conducted immediately after rain or disturbance events that may remove or obscure tracks or sign. Detectability is also affected by the experience of the observer, so training in track and sign recognition is important."


## Data collection
monitor_meth1 <- "•	2 ha plot – observers search a 2 ha area for signs of animal presence, ideally for a set period of time, or with a set period of effort. Sometimes called a sign survey, track survey, 2 hectare plot, cybertracker survey or Tracks App survey."

monitor_meth2 <- "•	Transect searches – a stretch of track is searched systematically."

monitor_meth3 <- "•	Timed searches – trackers wander through an area in any direction for a set amount of time."

## Looking for animal signs on the road/driving track:
monitor_road1 <- "If the 2 ha plot is near a track, keep the search area off the track itself, by at least 30 m. This is because some animals (such as dingoes and foxes) prefer to use roads, and other animals avoid them. The sign along roads is a biased sample of what is present. To get a good sample of all animals present, set up a 100m transect along the track near to the 2 ha plot, and record the sign on this transect as well as the sign in the 2 ha plot. It is very important to keep the data from the plot and the road transect separate in your datasheet, so that biases can be taken into account during analysis."

monitor_datacol1 <- "Different methods (2 ha plot vs transect) can be accommodated in analyses that collate data from many people and groups, but differences in data recording fields, and inconsistencies in data quality, can be a real problem. Streamlining data collection to a core set of fields that are recorded consistently makes it much easier to combine track-based data from many different people and groups. To that end, the Arid Zone Monitoring project worked with several tracking experts to design a standard data recording sheet that could be used nationally, regardless of the track-based survey method used."

monitor_datacol2 <- "For inquiries or information about where to send datasheets and photos, please contact Arid Zone Monitoring by emailing AridZoneMonitoring@gmail.com ."

monitor_tip <- "How easily a sign is detected varies between species and the age of the sign, and also with the tracking conditions. It is important to set up sites in places where the tracking surface is good, and to collect data when weather and light conditions are best. Don’t survey immediately after rain or strong winds that may remove or obscure tracks or sign. How easily signs are detected is also affected by the experience of the observer, so training in track and sign recognition (learning from experienced trackers) is very important. Walk into the sun as tracks are easier to see. Only record sign when you are sure of the identification, as recording the presence of species incorrectly is a much bigger problem than missing some records."


# # Where to survey?
# monitor_where1 <- " If the monitoring objective is to survey or monitor trends in a common and widespread species, then put sites across a wide area. To survey or monitor trends in species that are less common or have small distributions, concentrate some sites within the range of this species, but make sure some other sites are also located outside the range. "
# 
# monitor_where2 <- " If the monitoring objective is to learn about how fire influences presence of species, then sites should be split across regions of different fire frequencies or severities, to allow for comparison. "
# 
# monitor_where3 <- " To follow trends over time, and in some designs that aim to understand management effectiveness, you need to revisit the same sites over time. "
# 
# # How many sites are needed?
# # To detect trends over time
# monitor_quantity1 <- " This depends on how common species are, and how sensitive you want the monitoring program to be. More sites will be needed to detect smaller declines or to detect declines in rarer species, while fewer sites will be needed to detect larger declines, or declines in more common species."
# 
# # For a regional or national monitoring program
# monitor_quantity2 <- "About 200 sites are needed overall to have a high chance at detecting moderate (~30%) declines for most species. These sites could be spread across several IPAs, national parks, and other properties, so that any one group doesn’t need to do all the work."
# 
# # For a monitoring change at the property or IPA scale
# monitor_quantity3 <- "Sampling at least 30 sites (but preferably 50), stratified across the main habitat types, should pick up changes in the detections of most species. If there are rare species that are targets for the survey, you may need extra sites clustered in the area where that species occurs – your team may use exiting species distribution maps to determine where this is in the survey area."
# 
# # To detect the effects of management
# monitor_quantity4 <- " The number of sites needed depends on how big an effect you expect the management to make: fewer sites will be needed to detect a bigger effect."
# 
# 
# # How often to survey?
# 
# monitor_times1 <- " To describe trends over time, or across management contrasts, you should revisit the same sites. If you keep going to different places each year, changes between years could be something to do with the change in sites, and not related to time or management."
# 
# monitor_times2 <- " Monitoring your sites every year is ideal but is rarely feasible, so aim to revisit sites at least twice in five years. If you are interested in changes of a species with a small population, you should survey sites in its range more often than that. A rotating sampling design can be useful, for example, where you sample 30 sites each year from a larger set of 60 sites, so every individual site gets sampled once every two years. "
# 
# monitor_times3 <- " If you would like to know more about how to design your own track-based survey, head to the AZM report."
# 
# 
# 
# 
# ## data collection
# monitor_datasheet1 <- "There are several variations of track-based surveys being used across Australia, although the most common standardised method is a 2 ha sand plot survey (sometimes called a sign survey, track survey, 2 hectare plot, cybertracker survey or Tracks App survey). The 2 ha sand plot survey consists of observers searching a 2 ha area for signs of animal presence and recording information about the habitat or tracking conditions."
# 
# monitor_datasheet2 <- "If you would like to assist with recording valuable information about desert animals, you should collect data using the track-based datasheet. These data fields are relevant nationally and represent key variables that can be collected consistently at a high quality."
# 
# monitor_datasheet3 <- "For inquiries or information about where to send datasheets and photos, please contact Arid Zone Monitoring by emailing trackingaustralia@gmail.com or the Atlas of Living Australia. Your data can then be added to the national database on arid zone fauna."
# 
# monitor_datasheet4 <- " We worked with tracking experts to develop a standard data recording template for track-based surveys, with advice on data collection, that can be used anywhere across Australia. We used 2 ha sand plots and other standardised sampling types, as well as incidental observations. This report may support the development of coordinated regional and national monitoring programs on your country. "
# 

