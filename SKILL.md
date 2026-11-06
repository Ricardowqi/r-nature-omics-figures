---
name: r-nature-omics-figures
description: Use for creating, refactoring, or reviewing publication-quality R figures for Nature/Nature Medicine-style exposome and multi-omics papers, especially ggplot2, patchwork, ComplexHeatmap, pheatmap, ggtree, igraph/ggraph, forest plots, PCoA, diversity plots, volcano/dot heatmaps, mediation/path diagrams, longitudinal LOESS trajectories, ROC/SHAP/prediction figures, and figure panels derived from the local Code_references R scripts or downloaded Code availability repositories.
---

# R Nature Omics Figures

## Workflow

1. Identify the figure purpose before coding: distribution, association, effect estimate, multi-omics heatmap, network, mediation, prediction, longitudinal trajectory, or manuscript panel assembly.
2. Read `references/figure-map.md` to find the closest local or downloaded R code example.
3. Read `references/plot-patterns.md` for the expected data schema and preferred R grammar for that plot family.
4. Source `scripts/nature_ggplot_helpers.R` for a consistent theme, palette, panel labels, and export helper.
5. Render the figure to PDF and PNG, inspect for text clipping, legend readability, panel alignment, and whether plotted values match the source table.

## Figure Style Defaults

- Prefer `ggplot2` for statistical plots and `patchwork` for multi-panel assembly.
- Use `theme_nature_omics()` as the default base theme, then make minimal plot-specific edits.
- Use restrained palettes. Keep exposure contrasts and omics classes visually distinct; do not encode more categories than readers can compare.
- Keep axis labels explicit with units or effect scale: beta per IQR, HR (95% CI), AUC, Bray-Curtis PCoA axis variance, VIP, FDR, or relative abundance.
- Avoid oversized titles inside panels. Put panel labels and figure captions outside the plotting area.
- Use vector PDF for manuscript assembly and high-resolution PNG/TIFF for quick review.

## Standard Output Contract

Every plotting script should produce:

1. A clean input table or list of input tables.
2. One plot object per panel with stable names, such as `p_alpha`, `p_pcoa`, `p_forest`.
3. A combined object, such as `fig1 <- (p_a | p_b) / p_c`.
4. Exported `pdf` and `png` files under an output directory.
5. A small metadata note in comments: data source, model/result table source, transform, covariates, and date.

## Quality Gate

Before delivery, check:

- No truncated labels, clipped legends, overlapping text, or hidden axis titles.
- Error bars/CI direction and reference line are correct.
- Factor order is biologically meaningful or matches the manuscript.
- Color mapping is defined once and reused across panels.
- FDR/star annotations match the plotted result table.
- `ggsave()` dimensions are fixed and not left to the current graphics device.

## Resources

- `scripts/nature_ggplot_helpers.R`: reusable R theme, palettes, export helper, and small plot utilities.
- `references/figure-map.md`: where to find example R code by plot type.
- `references/plot-patterns.md`: summarized R plotting patterns from local and downloaded code.
- `references/style-guide.md`: Nature-style figure assembly and review checklist.
