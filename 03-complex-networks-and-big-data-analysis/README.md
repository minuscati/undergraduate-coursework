# Complex Networks and Big Data Analysis

This folder contains a featured metro-network project and selected experiment reports from my undergraduate studies. The experiments use Python and NetworkX to construct and analyse networks, measure topology, detect communities, rank nodes, and study random-network models.

The reports are written in Chinese and include source-code excerpts, results, visualisations, and discussion. Course templates, textbooks, lecture slides, reference manuals, and unrelated datasets have been excluded.

## Featured project: Wuxi Metro Network Analysis

The featured project models the Wuxi Metro system as a directed weighted graph. It contains 80 stations and 166 directed edges derived from adjacent stations and estimated travel times.

The project includes:

- Construction and visualisation of the metro network with NetworkX
- Weighted shortest-path navigation using travel time
- Degree, eigenvector, betweenness, and closeness centrality analysis
- Interpretation of transfer stations, network accessibility, and urban activity centres

Project materials are located in `wuxi-metro-network-project/`:

- `analysis-notebook.html` — browsable code and outputs
- `data/` — compact edge and coordinate data used by the analysis
- `report/final-project-report-zh.pdf` — original Chinese report
- `report/code-and-results-zh.pdf` — code and results appendix

## Included experiments

1. Construction and loading of several network types
2. Basic topological properties
3. Degree correlation
4. Community detection using Louvain, Girvan–Newman, and Kernighan–Lin methods
5. Node importance and similarity
6. Erdős–Rényi random networks and topology trends
8. Barabási–Albert scale-free networks and topology trends

## Topics

- Graph construction and persistence with NetworkX
- Degree, path length, clustering coefficient, and neighbour-degree statistics
- Community detection and modularity
- Centrality, similarity, and node importance
- Erdős–Rényi and Barabási–Albert network models

## Language note

The original experiment reports remain in Chinese. This English overview is provided for accessibility.

---

## 中文说明

本目录以“基于图数据挖掘的无锡地铁网络分析与特征工程”为重点项目，并收录复杂网络相关课程的精选实验报告。重点项目使用 NetworkX 构建无锡地铁有向加权图，完成最短路径导航与多种中心性分析。其余内容包括网络构建与读取、基本拓扑性质、度相关性、社团检测、节点重要性与相似性，以及 ER 随机网络和 BA 无标度网络。教材、教师课件、参考手册、实验模板及无关数据均未收录。
