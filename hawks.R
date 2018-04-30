library(plotly) #Charts

# Get Data
hawks <- read.csv("https://raw.githubusercontent.com/GitAMoveOn/DDP/gh-pages/seahawks.csv")
summary(hawks)

# Some cleaning for chart friendliness
colnames(hawks)[1] <- 'Season'
summary(hawks)
names(hawks)
made <- which(hawks$Playoffs)
missed <- which(!hawks$Playoffs)
hawks$Playoffs.Desc <- "blank"
hawks$Playoffs.Desc[made] <- "Made Playoffs"
hawks$Playoffs.Desc[missed] <- "Missed Playoffs"
tail(hawks)

# Create Plot
pal <- c("green","blue")
x <- list(
  title = "Season (Year)"
  )
y <- list(
  title = "Win Percentage"
)

p <- plot_ly(hawks, x = ~hawks$Season, y = ~hawks$WinPct, type = "scatter"
          ,mode = "markers", color = ~hawks$Playoffs.Desc
          ,colors = pal,           # marker=list(size=15)
        marker = list(size = 10,
                line = list(color = 'gray',
                            width = 2))) %>%
  layout(title = "Seahawks Win/Loss Pct" ,xaxis = x, yaxis = y) %>%
  layout(yaxis = list(tickformat = "%"))
p
