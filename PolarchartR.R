library(ggplot2)
library(dplyr)

# Manually entering player statistics
df <- data.frame(
  Statistic = c("Ball Control", "Heading Defensively", "Defending General", "Defending 1v1", 
                "Tackling", "Long Passing", "Short Passing", "Right Foot", "Left Foot"),
  Percentile = c(70, 85, 90, 80, 88, 75, 82, 78, 72)
)

df$index <- 1:nrow(df)

df$type <- "Defensive Skills"
df$type <- factor(df$type, levels = c("Defensive Skills"))

theme_color <- "white"
bar_color <- "#034694"  # Blue

# Polar radar chart
ggplot(data = df, aes(x = reorder(Statistic, index), y = Percentile, fill = type)) +
  geom_bar(width = 1, color = theme_color, stat = "identity", fill = bar_color) +
  coord_polar(clip = "off") +  # Expanding chart boundaries
  geom_bar(aes(y = 90), stat = "identity", width = 1, alpha = 0.3, fill = bar_color) +
  geom_hline(yintercept = seq(0, 100, by = 50), color = theme_color, size = 0) +
  geom_label(aes(label = Percentile), color = "gray20", fill = theme_color, size = 3, fontface = "bold", vjust = -0.3, show.legend = FALSE) +
  geom_text(aes(y = 140, label = Statistic), color = "black", size = 3, fontface = "bold", vjust = 0.5) + # Adjusting text distance
  theme(
    legend.position = "none",
    plot.title = element_text(hjust = .5, colour = "gray20", face = "bold", size = 16),
    plot.subtitle = element_text(hjust = .5, colour = "gray20", size = 10),
    plot.background = element_rect(fill = theme_color, color = theme_color),
    panel.background = element_rect(fill = theme_color, color = theme_color),
    panel.grid = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank()
  ) +
  labs(title = "Defender Scout Report",
       subtitle = "via Baris Efe Gedik")

       