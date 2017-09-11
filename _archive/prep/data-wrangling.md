    # install.packages("dplyr") 
    library(dplyr)

    ## 
    ## Attaching package: 'dplyr'
    ## 
    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag
    ## 
    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    # ddata <- read.csv("https://ndownloader.figshare.com/files/5094199?private_link=aff8f0912c76840c7526")
    ddata <- read.csv("/Users/steve/Sites/datascibc/course/data/outreach.csv")
    nrow(ddata)

    ## [1] 15158

    names(ddata)

    ##  [1] "hospital"    "patient"     "dead28"      "icu_accept"  "icu_admit"  
    ##  [6] "time2icu"    "early4"      "age"         "male"        "wday"       
    ## [11] "news_score"  "news_risk"   "sofa_score"  "hrate"       "bpsys"      
    ## [16] "temperature" "rrate"       "pf_ratio"    "creatinine"  "platelets"  
    ## [21] "avpu"        "lactate"

    summary(ddata$hrate)

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##      10      83     100     100     116     223     246

    table(ddata$news_risk)

    ## 
    ##    0    1    2    3 
    ##  381 3768 4250 6759

    summary(ddata[ddata$news_risk==3,]$hrate)

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's 
    ##      14      95     110     109     125     223      26
