# Reusable ggplot helpers for exposome and multi-omics manuscript figures.
# Source this file before building plot panels:
# source("analysis_work/skills/r-nature-omics-figures/scripts/nature_ggplot_helpers.R")

theme_nature_omics <- function(base_size = 8, base_family = "Arial") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required.")
  }
  ggplot2::theme_classic(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      text = ggplot2::element_text(color = "black"),
      axis.title = ggplot2::element_text(color = "black"),
      axis.text = ggplot2::element_text(color = "black"),
      axis.line = ggplot2::element_line(linewidth = 0.35, color = "black"),
      axis.ticks = ggplot2::element_line(linewidth = 0.35, color = "black"),
      panel.border = ggplot2::element_rect(fill = NA, color = "black", linewidth = 0.35),
      legend.title = ggplot2::element_text(color = "black"),
      legend.text = ggplot2::element_text(color = "black"),
      legend.key = ggplot2::element_blank(),
      strip.background = ggplot2::element_rect(fill = "white", color = "black", linewidth = 0.35),
      strip.text = ggplot2::element_text(color = "black"),
      plot.title = ggplot2::element_blank(),
      plot.margin = ggplot2::margin(4, 4, 4, 4)
    )
}

nature_omics_palette <- function(name = "main") {
  palettes <- list(
    main = c("#3F72AF", "#CB6651", "#47A265", "#F0B44C", "#7A5BA6", "#5A8C8C", "#D2BDDB", "#4C4C4C"),
    exposure = c("Low" = "#3F72AF", "High" = "#CB6651", "PM2.5" = "#5F8D4E", "O3" = "#645CBB"),
    omics = c("Microbiome" = "#47A265", "Metabolome" = "#F0B44C", "Proteome" = "#3F72AF", "Clinical" = "#CB6651", "Genetics" = "#7A5BA6"),
    direction = c("Positive" = "#CB6651", "Negative" = "#3F72AF", "N.S." = "#B8B8B8")
  )
  if (!name %in% names(palettes)) {
    stop("Unknown palette: ", name)
  }
  palettes[[name]]
}

add_panel_label <- function(plot, label, x = -Inf, y = Inf, size = 3.2) {
  plot +
    ggplot2::annotate(
      "text",
      x = x, y = y, label = label,
      hjust = -0.4, vjust = 1.35,
      fontface = "bold", size = size
    )
}

save_nature_figure <- function(plot, filename, width = 7, height = 5, dpi = 600, bg = "white") {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("Package 'ggplot2' is required.")
  }
  dir.create(dirname(filename), recursive = TRUE, showWarnings = FALSE)
  ggplot2::ggsave(filename, plot = plot, width = width, height = height, units = "in", bg = bg)
  png_file <- sub("\\.pdf$", ".png", filename, ignore.case = TRUE)
  if (identical(png_file, filename)) {
    png_file <- paste0(filename, ".png")
  }
  ggplot2::ggsave(png_file, plot = plot, width = width, height = height, units = "in", dpi = dpi, bg = bg)
  invisible(c(pdf = filename, png = png_file))
}

format_p <- function(p) {
  ifelse(is.na(p), NA_character_,
    ifelse(p < 0.001, "<0.001", sprintf("%.3f", p))
  )
}

sig_stars <- function(p) {
  ifelse(is.na(p), "",
    ifelse(p < 0.001, "***",
      ifelse(p < 0.01, "**",
        ifelse(p < 0.05, "*", "")
      )
    )
  )
}

order_by_effect <- function(data, feature_col = "feature", effect_col = "beta", decreasing = FALSE) {
  data[[feature_col]] <- stats::reorder(data[[feature_col]], data[[effect_col]], FUN = mean)
  if (decreasing) {
    data[[feature_col]] <- factor(data[[feature_col]], levels = rev(levels(data[[feature_col]])))
  }
  data
}
