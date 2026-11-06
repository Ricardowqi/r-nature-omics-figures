# Style Guide

## General Principles

- Figures should read as evidence, not decoration.
- Prefer small, quiet typography and clean axes.
- Use white backgrounds.
- Remove major/minor grids unless they aid numerical reading.
- Use one visual encoding per concept across the whole manuscript.
- Keep exact statistical values in source tables; figures should show the pattern and uncertainty clearly.

## Nature-Style Defaults

Use these as defaults, then adjust for target journal instructions:

- Base font size: 7-9 pt for final panels.
- Axis line width: 0.3-0.5 pt.
- Point size: 0.7-2.0 depending on density.
- Error bar line width: 0.3-0.7.
- Use PDF for vector graphics; use PNG/TIFF only for review or raster-heavy panels.
- Prefer panel labels `a`, `b`, `c` in bold outside or at the upper-left of the plotting area.

## Palettes

Use the helper palettes in `nature_ggplot_helpers.R` first:

- `nature_omics_palette("exposure")` for PM2.5/O3 or low/high exposure.
- `nature_omics_palette("omics")` for microbiome/metabolome/proteome/clinical/genetics layers.
- `nature_omics_palette("direction")` for positive/negative/non-significant association groups.

When adapting old code, preserve biologically meaningful color semantics:

- Positive/risk/increased: warm color.
- Negative/protective/decreased: cool color.
- Non-significant/background: gray.

## Common Fixes To Apply To Old Scripts

- Replace hard-coded absolute output paths with `output_dir`.
- Replace repeated `theme(...)` blocks with `theme_nature_omics()`.
- Replace implicit device export (`pdf(); plot; dev.off()`) with `save_nature_figure()` for ggplot objects.
- Keep `pdf(); draw(); dev.off()` for `ComplexHeatmap`, but specify fixed width/height.
- Move manual significance stars into a derived column from the final result table.
- Use `forcats::fct_reorder()` instead of relying on current row order.
- Use `coord_cartesian()` instead of dropping data with scale limits when possible.

## Review Checklist

Run this checklist before considering a figure ready:

1. The plotted table is the final analysis table, not an intermediate exploratory object.
2. Axis units and effect scale are explicit.
3. CI/error bars map to the correct lower/upper columns.
4. Reference lines use the correct null value: 0 for beta/correlation, 1 for HR/OR/RR.
5. FDR and P-value annotations are generated from the same table being plotted.
6. Long feature names are readable after export.
7. Legends are not redundant with direct labels or facet labels.
8. Panel labels are consistent across the assembled figure.
9. PDF and PNG outputs render without clipping.
10. The caption can state what statistical model generated the plotted values.
