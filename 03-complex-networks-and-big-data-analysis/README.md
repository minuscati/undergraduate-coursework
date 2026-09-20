# Complex Networks and Big Data Analysis

This folder contains a featured metro-network project and some selected experiment reports. The experiments use Python and NetworkX to construct and analyse networks, measure topology, detect communities, rank nodes, and study random-network models.

The reports are written in Chinese and include source-code excerpts, results, visualisations, and discussion.

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

该文件夹包含一个精选的地铁网络项目以及一些课程实验报告。这些实验利用 Python 和 NetworkX 构建并分析网络，涵盖拓扑结构测量、社团检测、节点排序以及随机网络模型研究等内容。
