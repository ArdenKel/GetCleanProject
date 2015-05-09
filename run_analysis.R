rm(list=ls())
#First I load the files on the training set
trainX<-read.table("./Dataset/train/X_train.txt")
trainY<-read.table("./Dataset/train/y_train.txt")
trainSub<-read.table("./Dataset/train/subject_train.txt")

#Then, the test set
testX<-read.table("./Dataset/test/X_test.txt")
testY<-read.table("./Dataset/test/y_test.txt")
testSub<-read.table("./Dataset/test/subject_test.txt")

oldstuff<-ls()

#I append the latter's rows to the end of the former 
Data<-rbind(trainX, testX)
Activity<-rbind(trainY, testY)
Subject<-rbind(trainSub, testSub)
Subject<-factor(Subject[,1])


#For memory's reasons I remove the original datasets

rm(list=oldstuff)
rm(oldstuff)

#I load the descriptions table to locate the means and locate columns containing the mean or stdev

measurementLabels<-read.table("./Dataset/features.txt")
wantedlabels<-grep(".*-((mean)|(std))\\(", measurementLabels[,2])

#I subset both X and labels, leaving only the variables I want
Data<-Data[,wantedlabels]
measurementLabels<-as.character(measurementLabels[wantedlabels,2])
rm(wantedlabels)

#I load activity labels
activityLabels<-read.table("./Dataset/activity_labels.txt")
#I make the activity names nicer to the eye
activityLabels[,2]<-tolower(activityLabels[,2])

activityLabels[,2]<-sapply(activityLabels[,2],function(x) { s <- strsplit(x, "_")[[1]]
                                                            paste(toupper(substring(s, 1,1)), substring(s, 2),
                                                                  sep="", collapse="")
})

#I change Data and Activity to feature names instead of numbers 

Activity<-factor(activityLabels[Activity[,1],2])
names(Data)<-measurementLabels

#I finally glue the three parts together and remove the unneeded data

oldstuff<-ls()
Merged<-cbind(Activity,Subject,Data)
rm(list=oldstuff)
rm(oldstuff)
#I write the whole dataset out
write.table(Merged, "large_data.txt")

#I collapse the data, finding the means for every subject-activity pair
Tidy<-aggregate(Merged[3:length(Merged)], list(Merged[,1],Merged[,2]), mean)
names(Tidy)[1]=names(Merged)[1]
names(Tidy)[2]=names(Merged)[2]
#output the final data
write.table(Tidy, file="tidyData.txt", row.names=FALSE)

#and we are done

