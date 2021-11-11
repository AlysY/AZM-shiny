

## FOR NAOMI ------------------------------------------------------------------------------------------------------------------------
library(dplyr)
library(ggplot2)

df_P_nodate <- read.csv("www/data/AZM_NationalData_P_per1km.csv")

df_result_sp <- df_P_nodate %>%
  select(CommonName, Group_class) %>%
  mutate(invasive = ifelse(Group_class ==  "Introduced_mammal", 1, 0)) %>%
  group_by(CommonName) %>%
  summarise(n = n(),
            invasive_mam = unique(invasive)) %>%
  arrange(invasive_mam, desc(n))

df_result_sp$CommonName <- factor(df_result_sp$CommonName, levels = rev(unique(df_result_sp$CommonName)))

ggplot() +
  geom_bar(stat = "identity", data = df_result_sp, aes(x = CommonName, y = n, fill = "Normal")) +
  scale_fill_manual(name = "area", values = c("#387469")) +
  coord_flip() +
  theme(text = element_text(size = 15),
        legend.position = "none") +
  labs( y = "Number of detections in total", x = "Native animal")