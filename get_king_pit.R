library(tidyverse)
library(rio)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

## Load fieldmap, which maps out the column index of all fields
fieldmap <- rio::import("./data/pit_counts_coc_fieldmap_2007t2018.xlsx")

file <- paste0(getwd(), "/data/2007-2018-PIT-Counts-by-CoC.xlsx")

## Import each year, subset based on the field map, rename columns, and add a `year` field
y2018 <- rio::import(file, which = 1)[,fieldmap$y2018]
names(y2018) <- fieldmap$shortname
y2018$year <- 2018

y2017 <- rio::import(file, which = 2)[,fieldmap$y2017] 
names(y2017) <- fieldmap$shortname
y2017$year <- 2017

y2016 <- rio::import(file, which = 3)[,fieldmap$y2016] 
names(y2016) <- fieldmap$shortname
y2016$year <- 2016

y2015 <- rio::import(file, which = 4)[,fieldmap$y2015] 
names(y2015) <- fieldmap$shortname
y2015$year <- 2015

y2014 <- rio::import(file, which = 5)[,fieldmap$y2014] 
names(y2014) <- fieldmap$shortname
y2014$year <- 2014

y2013 <- rio::import(file, which = 6)[,fieldmap$y2013] 
names(y2013) <- fieldmap$shortname
y2013$year <- 2013

y2012 <- rio::import(file, which = 7)[,fieldmap$y2012] 
names(y2012) <- fieldmap$shortname
y2012$year <- 2012

y2011 <- rio::import(file, which = 8)[,fieldmap$y2011] 
names(y2011) <- fieldmap$shortname
y2011$year <- 2011

y2010 <- rio::import(file, which = 9)[,fieldmap$y2010] 
names(y2010) <- fieldmap$shortname
y2010$year <- 2010

y2009 <- rio::import(file, which = 10)[,fieldmap$y2009] 
names(y2009) <- fieldmap$shortname
y2009$year <- 2009

y2008 <- rio::import(file, which = 11)[,fieldmap$y2008] 
names(y2008) <- fieldmap$shortname
y2008$year <- 2008

y2007 <- rio::import(file, which = 12)[,fieldmap$y2007] 
names(y2007) <- fieldmap$shortname
y2007$year <- 2007


## Row-bind all years together
pit_counts <- rbind(y2018, y2017, y2016, y2015, y2014, y2013, y2012, y2011, y2010, y2009, y2008, y2007) %>%
  select(year, coc_number:unsheltered_chronically_homeless_individuals)

## Get PIT for King County
pit_king <- pit_counts %>%
  filter(coc_number == "WA-500")

## Remove extraneous fields 
rm(y2018, y2017, y2016, y2015, y2014, y2013, y2012, y2011, y2010, y2009, y2008, y2007, fieldmap)