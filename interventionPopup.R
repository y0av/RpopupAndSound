library(shiny)
library(shinyalert)

#in settings:
interventionSoundFolder <- "interventionSounds"


titleText <- "na"
descText <- "na"

ui <- fluidPage(
  useShinyalert()
)

server <- function(input, output) {
  shinyalert(
    title = titleText,
    text = descText,
    closeOnEsc = TRUE,
    closeOnClickOutside = TRUE,
    html = FALSE,
    type = "info",
    showConfirmButton = TRUE,
    showCancelButton = FALSE,
    confirmButtonText = "OK",
    confirmButtonCol = "#AEDEF4",
    timer = 0,
    imageUrl = "",
    animation = TRUE
  )
}

#popup an intervention
# @args:
# ttitle: popup title text
# description: popup second title text
# soundName: mp3 file name (without .mp3)
intervention <- function(ttitle ,description ,soundName) {
  titleText <<- ttitle
  descText <<- description
  shell.exec(paste(getwd(),"/",interventionSoundFolder,"/",soundName,".mp3", sep=""))
  shinyApp(ui, server)
}

intervention("Intervention!","this is an intervention","good")
