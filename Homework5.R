# Homework 5

library(plotly)
library(ggplot2)
library(magrittr)
library(quantmod)


# Graph 1
p1 <- plot_ly(diamonds, x = ~cut) %>% add_histogram()
p2 <- diamonds %>%dplyr::count(cut) %>%plot_ly(x = ~cut, y = ~n) %>% add_bars()
subplot(p1, p2) %>% hide_legend() %>% layout(title = "Price Vs Quality")


# Graph 2

getSymbols("IBM",src='yahoo')

# basic example of ohlc charts
df <- data.frame(Date=index(IBM),coredata(IBM))
df <- tail(df, 30)

p <- df %>%plot_ly(x = ~Date, type="candlestick",
                   open = ~IBM.Open, close = ~IBM.Close,
                   high = ~IBM.High, low = ~IBM.Low) %>%
  layout(title = "IBM Candle plot")