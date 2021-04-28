#Final Project--STAT 5525
setwd("/Users/zhouwenxiao/Desktop/USMortality")
library(sqldf)
fixed1<-file("US19.DUSMCPUB_r20201216")
attr(fixed1,"file.format")<-list(sep=",",header=FALSE)
US19<-sqldf("SELECT
            substr(V1, 20,1) Resident,
            substr(V1,63,2) Education,
            substr(V1,65,2) Month,
            substr(V1,69,1) Sex,
            substr(V1,75,2) Age,
            substr(V1,83,1) Place,
            substr(V1,84,1) Martial,
            substr(V1,107,1) Manner,
            substr(V1,160,2) Cause,
            substr(V1,445,2) Race_detail,
            substr(V1,449,1) Race
          FROM fixed1")
save(US19,file="US19.RData")

fixed2<-file("US18.dat")
attr(fixed2,"file.format")<-list(sep=",",header=FALSE)
US18<-sqldf("SELECT
            substr(V1, 20,1) Resident,
            substr(V1,63,2) Education,
            substr(V1,65,2) Month,
            substr(V1,69,1) Sex,
            substr(V1,75,2) Age,
            substr(V1,83,1) Place,
            substr(V1,84,1) Martial,
            substr(V1,107,1) Manner,
            substr(V1,160,2) Cause,
            substr(V1,445,2) Race_detail,
            substr(V1,449,1) Race
          FROM fixed2")
save(US18,file="US18.RData")

fixed3<-file("US17.DUSMCPUB")
attr(fixed3,"file.format")<-list(sep=",",header=FALSE)
US17<-sqldf("SELECT
            substr(V1, 20,1) Resident,
            substr(V1,63,2) Education,
            substr(V1,65,2) Month,
            substr(V1,69,1) Sex,
            substr(V1,75,2) Age,
            substr(V1,83,1) Place,
            substr(V1,84,1) Martial,
            substr(V1,107,1) Manner,
            substr(V1,160,2) Cause,
            substr(V1,445,2) Race_detail,
            substr(V1,449,1) Race
          FROM fixed3")
save(US17,file="US17.RData")

fixed4<-file("US16.DUSMCPUB")
attr(fixed4,"file.format")<-list(sep=",",header=FALSE)
US16<-sqldf("SELECT
            substr(V1, 20,1) Resident,
            substr(V1,63,2) Education,
            substr(V1,65,2) Month,
            substr(V1,69,1) Sex,
            substr(V1,75,2) Age,
            substr(V1,83,1) Place,
            substr(V1,84,1) Martial,
            substr(V1,107,1) Manner,
            substr(V1,160,2) Cause,
            substr(V1,445,2) Race_detail,
            substr(V1,449,1) Race
          FROM fixed4")
save(US16,file="US16.RData")


fixed5<-file("US15.DUSMCPUB")
attr(fixed5,"file.format")<-list(sep=",",header=FALSE)
US15<-sqldf("SELECT
            substr(V1, 20,1) Resident,
            substr(V1,63,2) Education,
            substr(V1,65,2) Month,
            substr(V1,69,1) Sex,
            substr(V1,75,2) Age,
            substr(V1,83,1) Place,
            substr(V1,84,1) Martial,
            substr(V1,107,1) Manner,
            substr(V1,160,2) Cause,
            substr(V1,445,2) Race_detail,
            substr(V1,449,1) Race
          FROM fixed5")
save(US15,file="US15.RData")

#Combining Data
US15$Year<-rep(2015,dim(US15)[1])
US16$Year<-rep(2016,dim(US16)[1])
US17$Year<-rep(2017,dim(US17)[1])
US18$Year<-rep(2018,dim(US18)[1])
US19$Year<-rep(2019,dim(US19)[1])

USall<-rbind(US15,US16,US17,US18,US19)
#add row numbers

USall$ID<-seq.int(nrow(USall))
save(USall,file="USall.RData") 


