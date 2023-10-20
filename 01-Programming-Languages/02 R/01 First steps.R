
# setwd("C:/Users/LocalAdmin/Dropbox/Uni/Rosenheim/01 Lehre/04 Data Engineering/thro-de/r")


# Libraries ---------------------------------------------------------------
# Database
library(RSQLite)
library(DBI)

# Data Wrangling & Plotting
library(data.table)
library(tidyverse)


# Basics ------------------------------------------------------------------
1+1

my_var <- 1
my_var <- "shpm"

my_vec <- c(1,2,3,4,5)
class(my_vec)

# Loop
for (i in 1:10) {
  print(paste("Num:", i))
}

# If-Else
if (my_var == 1) {
  print("my_var = 1")
} else if (my_var > 1) {
  print("my_var > 1")
} else {
  print("my_var < 1")
}

# Functions
my_func <- function(my_arg) {
  paste0("Hallo ", my_arg) %>% print()
}

my_func("Florian")



# Get Data ----------------------------------------------------------------
# CSV
csv_customer <- fread("../thro_shpm_csv/customer.csv", sep=";", header= TRUE, encoding = 'Latin-1')
csv_plant <- fread("../thro_shpm_csv/plant.csv", sep=";", header= TRUE, encoding = 'Latin-1')
csv_shipment <- fread("../thro_shpm_csv/shipment.csv", sep=";", header= TRUE, encoding = 'Latin-1')

# SQLite
con <- dbConnect(RSQLite::SQLite(), "../thro_shpm.db", encoding = "utf-8")

# RPostgres
con <- dbConnect(RPostgres::Postgres(),
                dbname = 'thro_db', 
                host = 'localhost', # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
                port = 5432, # or any other port specified by your DBA
                user = 'thro_stud',
                password = 'thro_pw')

dbListTables(con)


dbWriteTable(con, "customer", csv_customer)
dbWriteTable(con, "plant", csv_plant)
dbWriteTable(con, "shipment", csv_shipment)

customer <- dbGetQuery(con, "SELECT * FROM customer")
plant <- dbGetQuery(con, "SELECT * FROM plant")
shipment <- dbGetQuery(con, "SELECT * FROM shipment")
dbDisconnect(con)
class(plant)


# Data Wrangling & EDA ----------------------------------------------------
shpm <- shipment %>%
  inner_join(customer, by = c("Ship-to2" = "ID")) %>%
  inner_join(plant, by = c("Plant" = "ID"), suffix = c("_customer", "_plant")) %>%
  as_tibble() %>%
  mutate(del_date = dmy(Delivery_day))


head(shpm, 3)
glimpse(shpm)

eda_plants <- shpm %>% select(Plant) %>% distinct()

eda_plant_DE17 <- shpm %>% filter(Plant == 'DE17')

eda_shpm_to <- shpm %>% mutate(tons = GWkg/1000)

eda_temp <- eda_shpm_to %>%
  group_by(Plant) %>%
  summarise(to = sum(tons)) %>%
  ungroup()


eda_temp_wider <- eda_temp %>% pivot_wider(names_from = Plant, values_from = to)
eda_temp_lnger <- eda_temp_wider %>% pivot_longer(cols = everything(), names_to = "Plant", values_to = "to")


eda_temp <- shpm %>%
  group_by(del_date) %>%
  summarise(pal = sum(Pallets, na.rm=TRUE)) %>%
  ungroup()

eda_temp <- shpm %>%
  group_by(del_date, Plant) %>%
  summarise(pal = sum(Pallets, na.rm=TRUE)) %>%
  ungroup()

sum(shpm$GWkg)
min(shpm$GWkg)
mean(shpm$GWkg)
max(shpm$GWkg)

eda_temp <- eda_shpm_to %>%
  group_by(Plant) %>%
  summarise(sum_to = sum(tons, na.rm=TRUE),
            min_to = min(tons, na.rm=TRUE),
            mean_to = mean(tons, na.rm=TRUE),
            max_to = max(tons, na.rm=TRUE)) %>%
  ungroup()


eda_temp %>% fwrite('eda_temp.csv', dec=",", sep=";")

