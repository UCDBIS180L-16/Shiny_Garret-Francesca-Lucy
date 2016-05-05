
library(shiny)
library(ggplot2)
library(PSMix)
library(reshape2)
  
  load("RiceSNPData/data_from_SNP_lab.Rdata")
    load("RiceSNPData/ps4.2500.RData")
    ps4.df <- as.data.frame(cbind(round(ps4$AmPr,3),ps4$AmId))
    colnames(ps4.df) <- c(paste("pop",1:(ncol(ps4.df)-1),sep=""),"popID")
    maxGenome <- apply(ps4$AmPr,1,max)
    ps4.df <- ps4.df[order(ps4.df$popID,-maxGenome),]
    ps4.df$sampleID <- factor(1:413)
    ps4.df.melt <- melt(ps4.df,id.vars=c("popID","sampleID"))
    geno.mds$popID <- factor(ps4$AmId)
    colnames(ps4$AmPr) <- paste("pr",1:4,sep="")
    geno.mds <- cbind(geno.mds,ps4$AmPr)
    shinydata <- merge(geno.mds, data.pheno, by="row.names")
    
shinyServer(function(input, output) {
 
     output$mainPlot <- renderPlot({
       pl <- ggplot(data = shinydata, aes(x=V1, y=V2)) + geom_point(aes_string(color=input$trait))
       pl                        
    
  })
  
})
