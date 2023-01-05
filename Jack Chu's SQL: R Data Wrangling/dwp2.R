library(dplyr)
library(DBI)
library(dbplyr)
library(odbc)
library(readr)
library(ggplot2)
odbcListDrivers()

con <- DBI::dbConnect(odbc(),
                      Driver = "ODBC Driver 17 for SQL Server",
                      Server = "mcobsql.business.nd.edu",
                      UID = "MSBAstudent",
                      PWD = "SQL%database!Mendoza",
                      Port = 3306, 
                      Database = "AdventureWorks2014")

p1_query <- read_file("D:/Coursework/Mod-1/Data Wrangling/data_wrangling_project/dwp2.sql")

my_query_p1 <- gsub("\\n|\\s+|\\t", " ", p1_query)

select_p1 <- dbSendQuery(conn = con, 
                        statement = my_query_p1)

select_res_p1 <- dbFetch(select_p1)

dbClearResult(select_p1)

p2_query <- read_file("D:/Coursework/Mod-1/Data Wrangling/data_wrangling_project/dwpq2.txt")

my_query_p2 <- gsub("\\n|\\s+|\\t", " ", p2_query)

select_p2 <- dbSendQuery(conn = con,
                         statement = my_query_p2)

select_res_p2 <- dbFetch(select_p2)

dbClearResult(select_p2)

p3_query <- read_file("D:/Coursework/Mod-1/Data Wrangling/data_wrangling_project/dwpq3.txt")

my_query_p3 <- gsub("\\n|\\s+|\\t", " ", p3_query)

select_p3 <- dbSendQuery(conn = con,
                         statement = my_query_p3)

select_res_p3 <- dbFetch(select_p3)

dbClearResult(select_p3)

DBI::dbDisconnect(con)
