library(ggplot2)
# Plotting X vs. Y
qplot(Sepal.Length, Petal.Length, data = iris, color = Species)
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width)
qplot(Sepal.Length, Petal.Length, data = iris, color = Species, size = Petal.Width, alpha = I(0.7))
qplot(Sepal.Length, Petal.Length, data = iris, color = Species,
  xlab = "Sepal Length", ylab = "Petal Length",
  main = "Sepal vs. Petal Length in Fisher's Iris data")
# Fitting a curve


# barchart
movies = data.frame(
  director = c("spielberg", "spielberg", "spielberg", "jackson", "jackson"),
  movie = c("jaws", "avatar", "schindler's list", "lotr", "king kong"),
  minutes = c(124, 163, 195, 600, 187)
)

# Plot the number of movies each director has.
qplot(director, data = movies, geom = "bar", ylab = "# movies")
# By default, the height of each bar is simply a count.


# But we can also supply a different weight.
# Here the height of each bar is the total running time of the director's movies.
qplot(director, weight = minutes, data = movies, geom = "bar", ylab = "total length (min.)")



# `Orange` is another built-in data frame that describes the growth of orange trees.
qplot(age, circumference, data = Orange, geom = "line",
  colour = Tree,
  main = "How does orange tree circumference vary with age?")


# We can also plot both points and lines.
qplot(age, circumference, data = Orange, geom = c("point", "line"), colour = Tree)




###

ssd <- read.csv("http://joshuawiley.com/files/ssd.csv")
ssd$class <- factor(ssd$class)

## first pass
p <- ggplot(ssd, aes(x = price, y = size, colour = class)) +
geom_point()
## add smooths and log to make clearer
p <- p +
stat_smooth(se=FALSE) +
scale_x_log10(breaks = seq(0, 1000, 100)) +
scale_y_log10(breaks = seq(0, 600, 100))
print(p)


## fit separate intercept and slope model
m <- lm(size ~ 0 + class*price, data = ssd)
est <- round(coef(m), 2)

size2 <- paste0("II Size = ", est[1], " + ", est[3], "price")
size3 <- paste0("III Size = ", est[2], " + ", est[4], "price")

## finalize
p <- p +
annotate("text", x = 100, y = 600, label = size2) +
annotate("text", x = 100, y = 500, label = size3) +
labs(x = "Price in USD", y = "Size in GB") +
opts(title = "Log-Log Plot of SSD Size and Price",
     axis.text.x = theme_text(angle = 45, hjust = 1, vjust = 1))
p
