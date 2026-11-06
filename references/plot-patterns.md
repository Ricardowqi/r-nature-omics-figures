# Plot Patterns

## Base Pattern

Use this skeleton for new R figure scripts:

```r
library(tidyverse)
library(patchwork)
source("analysis_work/skills/r-nature-omics-figures/scripts/nature_ggplot_helpers.R")

dat <- readr::read_csv("results/input_table.csv")

p_a <- ggplot(dat, aes(x = group, y = value, fill = group)) +
  geom_boxplot(width = 0.45, outlier.shape = NA, linewidth = 0.35) +
  geom_jitter(width = 0.08, size = 0.7, alpha = 0.45) +
  scale_fill_manual(values = nature_omics_palette("exposure")) +
  labs(x = NULL, y = "Outcome") +
  theme_nature_omics()

fig <- add_panel_label(p_a, "a")
save_nature_figure(fig, "figures/figure1.pdf", width = 3.5, height = 3)
```

## Diversity And Ordination

Expected input:

- Long diversity table: `Sample_ID`, `index`, `value`, `group`, optional `cohort`.
- PCoA table: `Sample_ID`, `PCo1`, `PCo2`, `group`, `PCo1_var`, `PCo2_var`.

Pattern:

- Violin/boxplot for alpha diversity.
- PCoA scatter with dotted zero lines.
- Optional marginal boxplots for PCo1 and PCo2.
- Use `patchwork::plot_layout()` for the combined ordination figure.

Avoid overcrowding PCoA labels. Label only centroids or outliers if needed.

## Effect Estimate And Forest Plots

Expected input:

- `feature`, `beta` or `HR`, `lower`, `upper`, `p`, `fdr`, `exposure`, optional `class`.

Pattern:

- Continuous associations: `geom_point()` + `geom_errorbar()` or `geom_errorbarh()`.
- Hazard ratios: reference line at 1.
- Betas: reference line at 0.
- Order features by effect size or biological class.
- Add significance by color or annotation, not both unless the panel is sparse.

Use horizontal layouts (`coord_flip()` or x = effect, y = feature) for long feature names.

## Heatmaps And Dot Heatmaps

Use `ComplexHeatmap` when:

- There are annotations, split rows/columns, or multiple heatmap bodies.
- You need stable manuscript-quality legends.

Use `ggplot2::geom_tile()` when:

- The heatmap is a compact dot/tile panel in a multi-panel figure.
- You need easy faceting or patchwork composition.

Expected input:

- Long table: `row_feature`, `col_feature`, `value`, optional `p`/`fdr`, annotations.

Pattern:

- Fill = effect/correlation.
- Point size or star text = significance.
- Use a diverging palette centered at zero for signed effects.

## Network Figures

Expected input:

- Edge table: `source`, `target`, `r` or `weight`, `p`, `edge_type`, `group`.
- Node table: `id`, `module`, `taxonomy`, `phylum`, `type`.

Pattern:

- Filter edges consistently before plotting.
- Use `igraph` for layout and centrality, `ggraph` for ggplot-compatible rendering.
- Use module colors consistently across network, module-size dot plot, and composition pies.
- Keep legends external or separate if the network is dense.

For publication, export network panels as vector PDF and inspect node label overlap manually.

## Longitudinal Or Aging Trajectories

Expected input:

- `sample_id`, `age` or `time`, `feature`, `value`, optional `sex`, `cluster`, `omics`.

Pattern:

- Use `geom_point(alpha = 0.2)` for raw data only if sample size permits.
- Use `geom_smooth(method = "loess", se = TRUE)` for exploratory trajectories.
- Use cluster panels or line color for fuzzy c-means trajectories.
- Facet by omics layer or sex only when panel size remains readable.

## Prediction Figures

Expected input:

- ROC table: `fpr`, `tpr`, `model`, `auc`.
- Calibration table or feature importance table when available.

Pattern:

- ROC: one line per model, AUC in legend or direct label.
- Feature importance: horizontal bar or dot plot.
- SHAP: keep top 10-20 features and show class/omics annotation if available.

Do not plot model performance without indicating train/test/external validation status.

## Multi-Panel Assembly

Use `patchwork` for most manuscript figures:

```r
fig <- (p_a | p_b) / (p_c | p_d) +
  patchwork::plot_layout(heights = c(1, 1), widths = c(1, 1))
```

Use `cowplot` or `ggpubr::ggarrange()` when extracting a shared legend or aligning non-ggplot objects. For `ComplexHeatmap`, save the heatmap separately or wrap via `grid`/`cowplot` only after checking size.
