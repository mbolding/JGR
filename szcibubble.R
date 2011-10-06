szci <- dget('/Users/schizophrenia/Documents/work/wip/SZVandSZCI/szci/JGR/szci.robj')


szci.SZ <- subset(szci,Group == "SZ")
szci.NV <- subset(szci,Group == "NV")

#CISSitems = paste(c("pre","pos"),rep(1:15,each=2),sep="")
CISSitems = paste(c("pos"),1:15,sep="")
CISSitems

#szci.CISS <- szci[c("Group", CISSitems)]
#szci.CISS
#szci.CISS <- stack(szci.CISS)
#szci.CISS

szci.SZ.CISS <- szci.SZ[CISSitems]
szci.NV.CISS <- szci.NV[CISSitems]
szci.SZ.CISS <- stack(szci.SZ.CISS)
szci.NV.CISS <- stack(szci.NV.CISS)
colnames(szci.SZ.CISS) <- c("response","question")
colnames(szci.NV.CISS) <- c("response","question")
szci.SZ.CISS$question <- factor(szci.SZ.CISS$question,levels = CISSitems) # reorder to plot correctly
szci.NV.CISS$question <- factor(szci.NV.CISS$question,levels = CISSitems)
szci.NV.CISS$Group <- "NV"
szci.SZ.CISS$Group <- "SZ"
szci.SZ.CISS
szci.NV.CISS

szci.CISS <- rbind(szci.NV.CISS,szci.SZ.CISS)
#
#dev.new()
#ggplot() + geom_point(aes(x = response,y = question,size = ..n..),data=szci.SZ.CISS,stat = 'sum') + 
#scale_area() +
#opts(title = 'SZ')
#
#dev.new()
#ggplot() + geom_point(aes(x = response,y = question,size = ..n..),data=szci.NV.CISS,stat = 'sum') + 
#scale_area() +
#opts(title = 'NV')
#
#dev.new()
#ggplot() +
# geom_point(aes(x = response,y = question,size = ..n..),data=szci.CISS,stat = 'sum') +
# scale_area() +
# facet_wrap(facets = ~Group)
#

dev.new()
P <- ggplot() +
 geom_point(aes(x = response,y = question,size = ..n..),data=szci.CISS,stat = 'sum') +
 scale_area() +
 facet_grid(facets = . ~ Group) +
 opts(panel.grid.major = theme_blank(),panel.grid.minor = theme_blank())

print(P) # so the plot displays when the script is sourced

#rm(szci.NV.CISS, szci.SZ.CISS, szci.SZ, szci.NV)
#rm(CISSitems)
