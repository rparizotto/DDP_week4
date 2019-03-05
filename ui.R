# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
# Compare the values between 2 regions
# By Rodrigo Parizotto - 2019-03-05
library(datasets)

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Compare Telephones by region"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      h3("Use the dropdown selection to compare 2 regions"),
      selectInput("region1", "Region 1:", 
                  choices=colnames(WorldPhones), selected = "N.Amer"),
      hr(),
      selectInput("region2", "Region 2:", 
                  choices=colnames(WorldPhones), selected = "Europe"),
      
      helpText("Data from AT&T (1961) The World's Telephones.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)