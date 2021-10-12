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


# Landing page --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


acknowledgement_of_Country <- "The Arid Zone Monitoring (AZM) project was undertaken across central Australia on the lands of many Indigenous groups and in collaboration with many Indigenous people. We acknowledge and respect the Traditional Custodians past, present and emerging of all the lands we worked on. We are committed to a collaborative and two-way approach to science and conservation."

image_permission <- "All people in the images have given permission to use their images on this website only. Do not use them without permission for other purposes."

acknowledgements <- "This project was made possible through the collaboration of over 40 Indigenous and non-Indigenous collaborators across the arid zone. Please see the logos below for all those involved. The project recieved funding from NESP TSR... ect."



intro_1.1 <- "The Arid Zone Monitoring (AZM) project is a collaboration between the National Environmental Science Program’s Threatened Species Recovery Hub (NESP TSR) and over 30 Indigenous ranger groups and Indigenous organisations, 8 NGOs and NRM groups, 5 government agencies and institutions, and individual researchers and consultants. "

intro_1.2 <- "Monitoring animal populations in Australia’s sandy deserts is challenging. Desert species can be patchily distributed, at low densities, and have boom-bust cycles. For this reason, in the last two or more decades, many individuals and groups across Australia’s deserts have collected data across the Australian desert using track-based methods. Track-based surveys include a range of sampling methods involving searching an area to record animal presence based on their tracks, scats, diggings, or other signs. Track-based surveys are carried out to meet many objectives. For example, data collected from track-based surveys can contribute to regional or national monitoring of native and feral species, improve our understanding of influential ecological processes operating across time and space, and allow us to evaluate the outcome of management actions. Importantly, track-based surveys also offer excellent opportunities for skills-sharing and inter-generational knowledge transfer."

intro_1.3 <- "Some of the information from track-based surveys has been collated, for example into state databases, although the majority was still widely dispersed across the many people and groups that gathered the data, and therefore inaccessible for national-scale analyses.  AZM has collated and analysed the existing track-based data currently held by organisations across Australia and established a national database for future data depositions."

intro_1.4 <- "The AZM national database includes almost 50,000 species presence records from over 5300 unique sites and almost 15,000 site visits, over the period from 1982 to 2021. The project showcases the collective work carried out by all groups working across the arid zone, and lays the groundwork for creating ongoing, national-scale monitoring for desert wildlife."

intro_1.5 <- "Use this website to see when and when the monitoring has happened and by which organisations. You can also look at specific species using the tabs at the top of the page."



intro_2.1 <- "This project aims to work with all groups that have collected track data, to pool these data into a single database. As well as provide advice to groups about whether their tracking surveys are telling them what they want to know, the collated data can be used to create contemporary distribution maps of species and their threats across the deserts."

intro_2.2 <- "The project also strengthens tracking protocols, promotes more widespread use of this valuable monitoring technique, aid species recovery programs, and showcase the work carried out by Indigenous and other groups in Australian deserts. The project also aims to lay the groundwork for an enduring national database for tracking surveys that can continue to collect and store future data, enable analysis of long-term population trends and allow evaluation of broadscale management actions. This project belongs to everyone who has been involved in tracking surveys over the years, and is being developed collaboratively with all the partners."

intro_2.3 <- "The specific aims of AZM are:"

intro_2.4 <- "•	Gather existing track and sign data from groups working in Australia’s deserts."

intro_2.5 <- "•	Use these data to map the distributions of desert species and look for trends in relative abundance or distribution over time."

intro_2.6 <- "•	Provide sampling design and data collection guidance to groups wishing to begin track-based surveys, or improve their existing practices."

intro_2.7 <- "•	Showcase the work being carried out in the deserts, especially by Indigenous ranger groups."

intro_2.8 <- "•	Lay the groundwork for creating ongoing, national-scale monitoring for desert wildlife. "


# Monitoring --------------------------------------------------------------


## track based srvey design
monitor_overview <- "Like all biological surveys, track-based surveys need to be designed carefully to provide data that can be used to answer questions about species distributions, habitat preferences, and trends. How common species are, how easily their sign is detected, and the objective all influence the most appropriate monitoring design. It is best to get advice for an experienced ecologist to design your survey, but general guidelines are:"

monitor_what <- "Define the monitoring objective early, because this directly influences decisions about where to survey, how many sites to establish, and how often to sample them. If the objective is intergenerational knowledge transfer, then simply go to the places that can support that experience. The data collected could be very useful, especially if collated with other data from other programs."

monitor_where1 <- "If the monitoring objective is to survey or monitor trends in a common and widespread species, then put sites across a wide area, possibly spread between vegetation types, fire histories and levels of management. To survey or monitor trends in species that are less common or have small distributions, concentrate some sites within the range of this species, but make sure some other sites are also located outside the range. This is so you can pick up shifts or range expansions. "

monitor_where2 <- "If the monitoring objective is to learn about how fire influences presence of species, then sites should be split across regions of different fire frequencies or severities, to allow for comparison. "

monitor_where3 <- "To follow trends over time, and in some designs that aim to understand management effectiveness, you need to revisit the same sites over time. "

monitor_quantity1 <- "This depends on how common species are, and how sensitive you want the monitoring program to be. More sites will be needed to detect smaller declines or to detect declines in rarer species, while fewer sites will be needed to detect larger declines, or declines in more common species."

monitor_quantity2 <- "About 200 sites are needed overall to have a high chance at detecting moderate (~30%) declines for most species. These sites could be spread across several IPAs, national parks, and other properties, so that any one group doesn’t need to do all the work."

monitor_quantity3 <- "Sampling at least 30 sites (but preferably 50), stratified across the main habitat types, should pick up changes in the detections of most species. If there are rare species that are targets for the survey, you may need extra sites clustered in the area where that species occurs – your team may use exiting species distribution maps to determine where this is in the survey area."

monitor_quantity4 <- "The number of sites needed depends on how big an effect you expect the management to make: fewer sites will be needed to detect a bigger effect."



monitor_times1 <- "To describe trends over time, or across management contrasts, you should revisit the same sites. If you keep going to different places each year, changes between years could be something to do with the change in sites, and not related to time or management."

monitor_times2 <- "Monitoring your sites every year is ideal but is rarely feasible, so aim to revisit sites at least twice in 5 years. If you are interested in changes of a species with a small population, you should survey sites in its range more often than that. A rotating sampling design can be useful, for example, where you sample 30 sites each year from a larger set of 60 sites, so every individual site gets sampled once every two years. "

monitor_times3 <- "For the most powerful analyses of trends, you need to estimate ’detectability’, which is the chance of missing sign that is present at sites. Even experienced observers will sometimes miss signs during 2-ha plot surveys. Failing to account for detectability will bias the analysis and in some cases may lead to false conclusions that a population is changing when in fact it is not. To estimate detectability, you need replicate observations from at least some monitoring sites. Replicates can be collected by multiple independent observers at the same time, or by revisiting the site a few days or weeks later. For most species, sites only need to be re-visited twice within a survey year to ensure that sign present has a very high chance of being detected. Visiting sites three times has relatively little additional benefit; the time and effort saved is probably better spent on additional sites. In practice it may not be feasible to survey all sites more than once within a year; if so, re-surveying only a small subset (e.g. 20 out of 200) should be enough to account for detectability."


monitor_tip <- "How easily a sign is detected varies greatly between species and the age of the sign, but is influenced most by the tracking conditions. This is why it is important to set up sites in places where the tracking surface is good, and to collect data when weather and light conditions are best. Surveys should not be conducted immediately after rain or disturbance events that may remove or obscure tracks or sign. Detectability is also affected by the experience of the observer, which is why training in track and sign recognition is so important."


## data collection
datacol <- "There are several variations of track-based surveys being used across Australia, although the most common standardised method is a 2 ha sand plot survey (sometimes called a sign survey, track survey, 2 hectare plot, cybertracker survey or Tracks App survey). The 2 ha sand plot survey consists of observers searching a 2 ha area for signs of animal presence and recording information about the habitat or tracking conditions. Over time, the method of 2 ha sand plot tracking has been altered by several groups to fit with regional or local monitoring objectives. As a result, there are now several variations on the method being used across Australia. These inconsistencies in data recording hinder the collation of data regionally and nationally. Streamlining data collection will improve the utility and application of these data collected by track-based survey efforts."


## dataset

monitor_datasheet1 <- "If you would like to assist with recording valuable information about desert animals, you should collect data using the track-based datasheet. These data fields are relevant nationally and represent key variables that can be collected consistently at a high quality. It records both site and sign information. Site information includes habitat type, location details, date, time etc. Sign information includes tracks scats and burrows recorded for each species as well as the age of the signs."

monitor_datasheet2 <- "The supplementary datasheet has examples of additional data fields that are not relevant for national or regional monitoring, but may also be completed when the survey has locally specific objectives, such as understanding whether a focal species like bilby is always associated with certain plant species. This datasheet is a guide only, the actual data fields required will depend on the species and questions being asked."

monitor_datasheet3 <- "For inquiries or information about where to send datasheets and photos, please contact Animal Tracking Australia by emailing trackingaustralia@gmail.com or the Atlas of Living Australia. Your data can then be added to the national database on arid zone fauna."

monitor_datasheet4 <- "We worked with tracking experts to develop a standard data recording template for track-based surveys, with advice on data collection, that can be used anywhere across Australia. We used 2 ha sand plots and other standardised sampling types, as well as incidental observations. This report may support the development of coordinated regional and national monitoring programs on your country."

monitor_datasheet5 <- "Below we provide some brief instructions for using the AZM national standard data recording template for track-based surveys. More detailed information can be found in the full report ‘What data to collect during track-based surveys? Combining expert experience to develop a data collection template’."


## datasheet instructions
monitor_instruct1 <- "The data collection template suits a standard 2 ha sand plot survey and a standard road transect adjacent to the 2 ha sand plot – however the same template could be used for other standardised methods, as well as for incidental (non-standardised) recordings of signs."

# who
monitor_instruct2.1 <- "Noting who made the records is useful in case details of observations need to be checked."

# Number of trackers in the group
monitor_instruct2.2 <- "For standardized surveys, the same amount of effort should be spent searching each site or transect. In reality, the group size when carrying out tracking surveys is variable, and if there are more people searching, they may record more sign than a smaller group searching for the same amount of time. Larger groups could compensate for this by surveying for shorter periods than smaller groups to try and even out the effort. Another complication is that people spend more time at sites when they see more animals - each record involves identifying tracks, discussing with other group members, and entering data, all of which takes time away from searching. The rule of thumb is – try and keep the search effort at each site or transect similar, given the group size, and the interruptions for recording data or discussing finds. It is good to make a note of the length of survey time and number of trackers used in your survey design, that why the same effort can be repeated when returning to the same sites over time."

# when
monitor_instruct3 <- "The date is essential for allowing analysis of trends in detections over time, and for showing that records at the same site were made on different visits."

# where
monitor_instruct4.1 <- "The coordinate information is essential, and the property or IPA name is very useful for checking that the coordinates have been correctly recorded. You may wish to give sites unique names if you plan to revisit them over time."

# Recording location
monitor_instruct4.2 <- "•	Ensure this record is accurate to within 50m if you are, or plan to, revisit sites."
monitor_instruct4.3 <- "•	A geographic coordinate system using latitude and longitude should be used rather than projected coordinate system, for instance UTMs. If using UTMs, record relevant metadata (such as the Zone setting)."
monitor_instruct4.4 <- "•	When multiple GPS devices are used make sure they are set to use the same datum (e.g. AGD84, WGS84, GDA2020) which provides the frame of reference for measuring locations on the Earth’s surface. Using multiple GPS devices with different datums creates misalignment in the location of sites when mapping (this may not cause issues if the scale of the analysis is coarse – for instance 1 km2). "

# Photograph site
monitor_instruct4.5 <- "If possible, take a photo of the quadrat to provide a permanent record of the vegetation. Store the photo with the datasheet. "


# How
# Sampling method
monitor_instruct5.1 <- "Record whether detections were made during standardised surveys, or via incidental observations (Fig. 1). In standardised surveys, the sample method also needs to be recorded (e.g. 2 ha sand plot, road transect, timed search etc). "

# A standard 2 ha sand plot survey
monitor_instruct5.2 <- "For a 2 ha sandplot, mark out the area based on landmarks or with a GPS as you walk (100m x 200m). Trackers should spend the time needed to thoroughly search this area. If there are more people who are spread out, it may be quicker to search the area, but aim to keep the search effort similar across survey sites."

monitor_instruct5.3 <- "Try and cover most of the 2 ha area by zig zagging up one side and back down the other. Record all tracks, burrows, diggings, sightings or scats of each species. If the sandy substrate is along narrow sand dunes you can reduce the width of the search area and increase the length providing the total area is 2 ha. "

# A standard road transect survey adjacent to the 2 ha sand plot
monitor_instruct5.4 <- "Some species such as cats, dogs and foxes may walk along roads and be more detectable there. Detections on roads adjacent to 2 ha sand plots can be included as data from a standardised survey if these road sections are checked systematically during a survey of the adjacent 2 ha sand plot. However, records from 2 ha sand plots and adjacent roads should be separated and clearly identified to avoid introducing biases, especially if adjacent road searches are not carried out for every 2 ha plot survey. This is because the propensity of predators to use roads may vary between regions, roads may not be representative of the study area, and lumping detections from roads with 2 ha sand plot data could elevate the occupancy of road species. "

# Survey target
monitor_instruct5.5 <- "In standardised surveys, note whether the survey recorded information on all species detected, or whether it targeted a focal species and information on other species could have been missed. Surveys could record all species present even if they have species targets. This information will allow surveys with good quality ‘absence’ data to be separated from other surveys. Absence data is valuable because it indicates the environmental conditions that are unsuitable for a species, at least during the time surveys are undertaken. Absence data, in tandem with presence data, can help narrow down our understanding of what drives species occurrence, and improve estimates of change over time. In general, the quality of absence information improves if the same sites are re-sampled over a relatively short time (e.g. 6 months). This is because repeat visits help to separate out ‘true’ absence from imperfect detection. Imperfect detection happens when tracks are missed by chance. By revisiting sites, we can estimate how often trackers detect a species when we know it really has passed through the plot."


# Fire
monitor_instruct6.1 <- "In general, most environmental information such as landform, soil, elevation, vegetation type, and time since the last fire, can be gleaned from publicly available national datasets if the site coordinates are recorded. However, information on fire at the site – the time of the last fire, and how severe it was – can be useful for understanding variation in species presence at finer scales. In addition, fire history data collection is engaging - particularly for individuals involved with fire programs, and most groups want to observe and discuss the fire status at survey sites. Data field entry options should relate to Indigenous fire categories for that area, and trackers need to record this information consistently; data templates could include a picture card with time since fire categories relevant for the region. "

monitor_instruct6.2 <- "Alternatively take a photograph of the site, in a standard way (for example, always pointing in a particular direction), but photographs need to be clearly labelled and stored to be useful. Or leave this field blank. "

# Data quality
monitor_instruct7.1 <- "Sites should be positioned in places that are good for tracking, with the right type of soft sand or soils for animals to leave tracks behind (not hard rocky soils), and not completely covered in thick vegetation, or leaf-litter, as it will be hard to find tracks. The quality of the tracking surface is another factor that influences accurate identification of tracks. If the surface of the sand is soft, powdery, dry and comprised of fine-grained sand then it is possible to distinguish tracks of even the smallest insects. Conversely if the sand is coarse, wet, compacted or wind driven it may only be possible to distinguish tracks of large animals such as camels."

monitor_instruct7.2 <- "Data quality will be better if there is slanting sunlight (in the morning of afternoon), it is not raining, the ground is not wet, and it is not or has not been very windy in the past few days. In general, the more shadow the easier it is to see tracks and track detail. "

monitor_instruct7.3 <- "Recording the tracking conditions at the site can help with interpreting the data. However, bear in mind that if tracking conditions are poor, the best option is not to carry out the survey…wait for better conditions. Nothing can make up for missing species occurrence data because the conditions were poor for tracking."

#  Animal detections
monitor_instruct8 <- "Training to ensure that trackers are recognising animal sign correctly before recording surveys is essential. Only record when certain of identification. E.g. ‘Large hooved mammal’ is better than recording ‘donkey’ if the detection is incorrect (e.g. it was really a horse). If you are unsure then do not make any record. Appending lists with the local animals and photos of their sign will help with training and identification of signs in the field."

#  Age of tracks
monitor_instruct9.1_fresh <- "Fresh (1-2 days)"
monitor_instruct9.1_old <- "Old (3 days to 1 week)"
monitor_instruct9.1_veryold <- "Very Old (> 1 week)"

monitor_instruct9.2 <- "It can be difficult to age sign. None-the-less it is important to estimate how much time has elapsed since the animal passed and a range of clues need to be used to judge track age. Generally, very fresh tracks in good substrate have crisp edges and you can make out the individual pads and their features or see distinct claw marks. "

monitor_instruct9.3 <- "Fresh sign is most obvious but separating “old” and “very old” is more challenging. Tracks from heavier animals remain longer than from small animals. As they age, the details of the track become blurred and finally only the general gait can be determined with none of the track detail. The condition of tracks from small, common animals such as insects and mice can be used to benchmark last night’s activity and compare with older looking tracks and sometimes these tracks may pass over an existing track. Another tip is to look at the other tracks in the quadrat and see if you can see any tracks that look fresher. "

# Age of scats
monitor_instruct10 <- "Fresh scats are usually dark, moist, soft, smelly and often will have some sand grains stuck to them. As they age they become lighter in colour and harder, very old scats will crumble easily and have little or no smell.  Only record scats as age score “Fresh” if you are sure they are VERY fresh."


# Age of burrows
monitor_instruct11.1 <- "Active burrows that are being used by animals can still look old. However, generally, active burrows have fresh tracks and/or scats outside their entrance and have a clean hole that is not blocked by spiderwebs or vegetation. Always search for multiple entrances to a burrow as some entrances may be fresh and others old in the same warren system. "

monitor_instruct11.2 <- "Photos can be a good way of verifying tracks or other sign, and provide a permanent record for future use. When photographing tracks, it is important to remember that shadow is needed to give the track depth and allow you to see detail. Do not use a flash as it removes the shadow. Angle the camera to get the best and deepest shadow on the track, often an angled shot rather than one taken from directly above can work best. Look at the position of the sun and take the photo towards the sun if possible.  The most important thing to remember is to include a scale in your photograph. A matchbox is ideal but you can use a ruler, coin or credit card. Your hand or boot-print can also be used as a last resort. "

monitor_instruct11.3 <- "Try to walk into the sun as tracks are easier to see with your shadow behind you. Don’t depend on a single print for identification of a species, look at multiple tracks of an animal and follow it until you are certain of your ID. Look for large areas of good substrate, this allows you to see more than one track of an animal at a time and helps with accurate identification. If in doubt, take a photo, draw the tracks with distinguishing features and measure the track imprints on the sheet provided"


# species specific --------------------------------------------------------------------

language_names_disclaimer <- "These are the names that we have collected during the project. There are many more names. If you would like to include other names, please email us."

detectionTime_1 <- "The maps summarise the detections of the animal over time in the AZM dataset. Each blue dot shows a survey site where the animal was recorded in that decade. The grey dots show all the other sites that were surveyed, but where the animal was not recorded in that decade. "

detectionRate_1 <- "The map shows the average animal detection rate across all surveys carried out in each bioregion, since the 1980s. Detection rates for the animal have been highest in bioregions with the darkest blue shading."

SDM_1 <- "The habitat suitability model can tell us about where the animal is most likely to be found. The analysis considered climate factors like annual, seasonal and daily temperature and rainfall; landform factors like elevation and slope; soil factors; and habitat factors like the amount of vegetation (NDVI) and fire frequency."

