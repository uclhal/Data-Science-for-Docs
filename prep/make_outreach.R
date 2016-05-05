# author: Steve Harris
# date: 2016-04-21
# subject: Make CSV data from subset of SPOTlight

# Readme
# ======


# Todo
# ====


# Log
# ===
# 2015-11-24
# - file created
# 2015-12-03
# - added raw physiology data
# 2016-04-21
# - reduced extract for the datascibc course

rm(list=ls())
library(data.table)
library(assertthat)

# Load and check data OK
load("/Users/steve/aor/academic/paper-spotearly/src/data/paper-spotearly.RData")
assert_that(nrow(wdt)==15158)
names(wdt)
lookfor()
library(lubridate)


wdt <- wdt[,
    .(
    hospital = site,    # hospital level ID
    patient = id,       # patient level ID
    dead28,             # 90 day mortality, 1==dead
    icu_accept,         # accepted to critical care at assessment
    icu_admit = icucmp, # admitted to ICU in week following assessment
    time2icu,           # delay to admission in hours
    early4,             # admitted within 4 hours, 1==true
    age,                # age in years
    male,               # male sex
    wday = (wday(wdt$v_timestamp, label=TRUE)), # day of the week
    news_score,         # physiological severity of illness (ward vital signs)
    news_risk,
    sofa_score,         # physiological severity of illness (with allowance for organ support)
    hrate,              # heart rate
    bpsys,              # systolic bp
    temperature,        # temperatuer
    rrate,              # respiratory rate
    pf_ratio,           # invasive marker of lung injury
    creatinine,         # biochemical marker of renal function
    platelets,          # marker of haematological organ dysfunction
    avpu,               # level of consciousness (crude but simple)
    lactate             # blood lactate
        ) ]

# Now generate a random sample
wdt[ sample(nrow(wdt), 1000) ]

# save(wdt, file=" /Users/steve/Sites/datascibc/course/data/outreach.Rdata")
write.csv(wdt, file="/Users/steve/Sites/datascibc/course/data/outreach.csv", row.names=FALSE)
