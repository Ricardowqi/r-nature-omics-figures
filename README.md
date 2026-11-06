# R Nature Omics Figures

A reusable Codex skill for publication-quality R figures in exposome and
multi-omics research. Includes plotting guidance, reusable ggplot2 helpers,
reference patterns, and a figure review checklist.

## Contents

| File | Purpose |
| --- | --- |
| `SKILL.md` | Skill entry point, workflow, and output requirements |
| `agents/openai.yaml` | Skill display metadata |
| `scripts/nature_ggplot_helpers.R` | Theme, palettes, panel labels, figure export, and statistical annotation helpers |
| `references/figure-map.md` | Index of plotting examples in the original research workspace |
| `references/plot-patterns.md` | Input schemas and plotting patterns by figure type |
| `references/style-guide.md` | Figure style defaults and review checklist |

## Install

Clone into your local Codex skills directory:

```sh
git clone https://github.com/Ricardowqi/r-nature-omics-figures.git \
  ~/.codex/skills/r-nature-omics-figures
```

Authentication is required when the GitHub repository is private. The skill can
also be placed in a project-specific skills directory.

Invoke the skill in a prompt with `$r-nature-omics-figures`, and provide the input
table, statistical model or result source, effect scale, and desired figure type.

## Use The R Helpers Directly

The helper functions require `ggplot2`. Multi-panel examples additionally use
`patchwork`; other plotting families may require their own packages.

```r
library(ggplot2)

skill_dir <- path.expand("~/.codex/skills/r-nature-omics-figures")
source(file.path(skill_dir, "scripts", "nature_ggplot_helpers.R"))

p <- ggplot(iris, aes(Species, Sepal.Length, fill = Species)) +
  geom_boxplot(width = 0.5, linewidth = 0.35) +
  scale_fill_manual(values = nature_omics_palette("main")[1:3]) +
  labs(x = NULL, y = "Sepal length (cm)") +
  theme_nature_omics(base_family = "sans") +
  guides(fill = "none")

save_nature_figure(
  p, "figures/iris_boxplot.pdf",
  width = 3.5, height = 3, dpi = 600
)
```

`save_nature_figure()` writes a PDF and a companion PNG when given a `.pdf`
filename. Dimensions are in inches. The theme defaults to Arial; use an available
font such as `sans` if Arial is unavailable on the target system.

## Portability And Scope

The six original skill files are preserved in this export. Some examples in
`references/plot-patterns.md` use the original project-relative helper path;
adapt that path to your installation as shown above.

`references/figure-map.md` is an index of external workspace examples. Those
scripts and third-party repositories are not bundled. The plotting guidance and
R helper functions can be used independently of those examples.

No cohort data, individual-level records, model outputs, or server credentials
are included. The figure style is inspired by biomedical journal conventions;
final figures should be checked against the target journal's current requirements.
