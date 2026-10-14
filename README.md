# MyCAD: AutoLISP-Based CAD Pattern Generation for Electrowetting Microstructures

**Research-stage AutoLISP scripts for converting computationally generated microstructure layouts into CAD geometry.**

## Overview

This repository documents an early computer-aided design workflow developed during research on non-uniform microstructure arrays for electrowetting display (EWD) devices.

The underlying research aims to arrange **notch structures** (which guide the directional retraction of confined oil) and **spacer structures** (which provide mechanical support) while accounting for neighboring-pixel layout constraints. A separate computational step generates the spatial distribution; the AutoLISP scripts in this repository read that distribution and draw corresponding geometries in a CAD environment.

The project illustrates a progression from **algorithm-generated layout → CAD drawing** toward a later workflow in which computational programs can generate bitmap patterns directly. The related C++ search and pattern-generation programs are available in [ngsion/spacer](https://github.com/ngsion/spacer).

## What the code does

- Reads numerical matrix files describing precomputed microstructure arrangements.
- Converts selected matrix values to CAD drawing entities at specified grid locations.
- Supports circular spacer geometries and triangular notch geometries in the earlier drawing script.
- Provides an alternative script for generating selected circular patterns associated with printed conductive features.
- Exposes geometric parameters (e.g., spacing, offsets, and feature dimensions) in the source for adaptation to a particular device layout.

**Scope:** These AutoLISP scripts are drawing utilities, **not** implementations of the backtracking search itself. They do not control physical fabrication equipment or establish measured device performance.

## Main files

| File | Purpose |
| --- | --- |
| `draw - back.lsp` | Earlier drawing workflow: reads a matrix and draws circular spacer features (`1`) and two orientations of triangular notch features (`2`, `4`). |
| `draw.lsp` | Later/alternative drawing workflow: reads a matrix, applies region-specific selection rules, and draws small circular features at computed positions. |
| `result_648X480_start_1_21_1160.txt` | Example of a large, precomputed layout matrix used by the drawing scripts. |
| `result_128X128_start_7_3_250.txt`, `result_12X12_start_6_25_0.txt` | Additional example layout matrices. |
| `readfile.lsp` | Basic file-reading experiment. |
| `random.lsp`, `testline.lsp`, `repeaty.lsp`, `clock.lsp` | Auxiliary AutoLISP experiments and utilities; not required for the primary matrix-to-CAD workflow. |

### Matrix encoding in the earlier drawing script

In `draw - back.lsp`, the explicitly handled values are:

| Matrix value | CAD entity |
| --- | --- |
| `1` | Circle representing a spacer position |
| `2` | One triangular notch orientation |
| `4` | The opposite triangular notch orientation |

These mappings describe **that script**, not a universal file-format specification for every program in this repository. In particular, `draw.lsp` applies different rendering and regional selection logic.

## Using the AutoLISP scripts

**Requirements:** A CAD application that supports AutoLISP and the standard `APPLOAD`, `CIRCLE`, and `PLINE` commands (for example, a compatible AutoCAD environment).

1. Download or clone the repository.
2. Open either `draw - back.lsp` or `draw.lsp`. **Update its hard-coded Windows input-file path** to point to an existing layout matrix on your computer.
3. Review the grid dimensions and geometry parameters at the beginning of the selected script. They were configured for specific experimental layouts and may not suit another input file.
4. Open your CAD application and load **one** drawing script using `APPLOAD`.
5. Run the command `MYPLOT` to generate the corresponding entities in the active drawing.
6. Inspect the generated geometry and verify units, dimensions, offsets, and feature placement before using the drawing for any downstream design work.

**Important:** Both main drawing scripts define the command `MYPLOT`. Loading the second script will replace the command definition from the first. The scripts are preserved as research-stage code and have **not been verified as a portable, end-to-end CAD pipeline**. Some settings and drawing dimensions depend on the original CAD environment; the code may require adjustment.

## Research context

The source code forms part of the computational-design workflow underlying research on non-uniform notch/spacer arrays in electrowetting display devices. It provides an example of translating algorithmically selected spatial arrangements into CAD geometries for subsequent device-pattern design.


## License

Released under the **Apache License 2.0**. See [LICENSE](LICENSE).
