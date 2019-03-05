# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
# Compare the values between 2 regions
# By Rodrigo Parizotto - 2019-03-05
library(datasets)

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a barplot
    xrange <- range(rownames(WorldPhones))
    yrange <- range(WorldPhones[,input$region1]*1000, WorldPhones[,input$region2]*1000) 
    plot(xrange, yrange, type="n", xlab="Year",
         ylab="Number of Telephones" ) 
    lines(rownames(WorldPhones), WorldPhones[,input$region1]*1000, type="b", lty=1, lwd=1.5, col="red") 
    lines(rownames(WorldPhones), WorldPhones[,input$region2]*1000, type="b", lty=2, lwd=1.5, col="blue") 
    
    # add a title and subtitle 
    title("WorldPhones dataset - Compare 2 regions")
    
    # add a legend 
    legend("topleft", legend = c(input$region1, input$region2), col=c("red", "blue"), 
           lty=1:2,
           title="Region" )
    
  })
}
