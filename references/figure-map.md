# Figure Map

Use this map to select the closest example before writing new R plotting code. Paths are relative to the workspace root.

## User Local Code

| Plot family | Local source | Reuse pattern |
|---|---|---|
| Alpha diversity violin/boxplot | `Code_references/first_round_analysis.R` | `geom_violin()` + narrow `geom_boxplot()` by exposure group |
| PCoA + marginal boxplots | `Code_references/first_round_analysis.R` | PCoA scatter plus PCo1/PCo2 boxplots assembled with `patchwork` |
| Taxonomy tree/annotation heat tracks | `Code_references/first_round_analysis.R` | `ggtree`, `geom_hilight`, `geom_fruit`, feature annotation strips |
| PLS-DA score plot and VIP barplot | `Code_references/q300_metabolism.R` | `mixOmics::plsda`, `stat_ellipse`, VIP bars with class fill |
| Coefficient/errorbar plot | `Code_references/q300_metabolism.R` | `geom_errorbar()` + `geom_point()` + zero reference line |
| Cross-omics heatmap/tile | `Code_references/q300_metabolism.R` | `geom_tile()` or `pheatmap()` for pathway/metabolite links |
| Microbe/fungi network | `Code_references/Network.R` | `igraph` network plotting, module pies, module-size dot plot |
| Variance explained stacked bars | `Code_references/Family and Cohousing.R` | `geom_bar(position = "fill")` + `coord_flip()` |
| Variance explained boxplot | `Code_references/Family and Cohousing.R` | `geom_boxplot()` + Wilcoxon/stat annotation |

## Downloaded Code Examples

| Plot family | Source repository path | Reuse pattern |
|---|---|---|
| Airway microbiome paper panels | `analysis_work/downloaded_code/wangzlab_population_airway_microbiome/population_airway_microbiome-main/` | Figure-specific folders for adonis, mediation, interaction, AMHI, network |
| Exposure-response spline + density + subgroup forest | `analysis_work/downloaded_code/fengleiwang_heme_t2d/heme_t2d-main/Code/figure1.R` | Spline line/ribbon over histogram, right-side forest text columns |
| Grouped bar with error bars | `analysis_work/downloaded_code/fengleiwang_heme_t2d/heme_t2d-main/Code/figure2.R` | `geom_col(position = "dodge")` + `geom_errorbar()` |
| Circular grouped bar plot | `analysis_work/downloaded_code/fengleiwang_heme_t2d/heme_t2d-main/Code/figure3.R` | `coord_polar()` style class-annotated bars |
| MR/MWAS figures | `analysis_work/downloaded_code/JL-BWHlab_TOPMed_MWAS/TOPMed_MWAS-main/Figure*_example.R` | MWAS/MR summary figures and Manhattan-like summaries |
| Dementia/metabolite figures | `analysis_work/downloaded_code/DW-Group_Gene_Metabolites_MedDiet_Dementia/Gene_Metabolites_MedDiet_Dementia-main/Figures/` | Risk, prediction, MR, heatmap, and model performance panels |
| T2D microbiome meta-analysis figures | `analysis_work/downloaded_code/DW-Group_T2D_Microbiome_Meta-analysis/T2D_Microbiome_Meta-analysis-main/scripts/` | Boxplots, heatmaps, ggtree/tile panels, cohort meta-analysis plots |
| DMP microbiome figures | `analysis_work/downloaded_code/GRONINGEN-MICROBIOME-CENTRE_DMP/DMP-main/` | Microbiome description, association plots, variance explained, GMHI |
| Metaproteomics figures | `analysis_work/downloaded_code/guomics-lab_GNHSF/GNHSF-main/code/figure_R/` | Richness, dissimilarity, stacked function/taxonomy bars, heatmaps |
| Aging trajectory figures | `analysis_work/downloaded_code/jaspershen-lab_ipop_aging/jaspershen-lab-ipop_aging-a540394/1-code/` | LOESS trajectories, fuzzy c-means clusters, multi-omics heatmaps, ggraph enrichment |
| Bile acid and microbiome figures | `analysis_work/downloaded_code/XiangyaOALab_OA_bileacids/OA_bileacids-main/Figures/` | Volcano, stack plot, dot heatmap, circos, survival, forest/bar combinations |
| Proteomic aging clock | `analysis_work/downloaded_code/miargentieri_proteomic-age-ukb/proteomic-age-ukb-main/code/` | ML model plots, survival/disease association figures |
| Drug confounding heatmaps | `analysis_work/downloaded_code/TillBirkner_metadeconfoundR/metadeconfoundR-main/R/BuildHeatmap.R` | ComplexHeatmap-style confounder maps |

## Plot Code Inventory

The R/Rmd scan covered 469 files; 252 contained plotting code. Dominant terms:

- `ggplot`: 810 occurrences
- `ggsave`: 421
- `geom_point`: 263
- `ggraph`: 231
- `geom_text`: 204
- `pdf(`: 199
- `igraph`: 186
- `Heatmap`: 141
- `geom_line`: 123
- `geom_bar`: 84
- `geom_boxplot`: 69
- `forest`: 69
- `patchwork`: 64
- `geom_tile`: 62
- `ComplexHeatmap`: 55
