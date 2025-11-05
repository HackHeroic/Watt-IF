### ⚡ Electricity Grid Resilience: Data-Driven Resource Allocation & Supply Chain Enhancement

## 🧠 Project Overview

This repository initiates **Mining Electricity Consumption Data for Resource Allocation and Supply Chain Enhancement**, as part of the Data Mining research. The goal is to **analyze U.S. electricity consumption patterns** across regions, sectors, and seasons to support efficient grid resource allocation and improve supply chain resilience against disruptions.

We take a **data-driven approach** grounded in traditional energy economics and advanced analytics—combining **peak-load theory**, **graph network analysis**, and **machine learning** to model, forecast, and mitigate electricity grid vulnerabilities.

---

## 🧩 Problem Statement

Electricity demand is highly **spatiotemporal** and varies by user type (residential, commercial, industrial), season, and socioeconomic conditions. Grid stability is increasingly challenged by events like heatwaves, electrification (e.g., EV adoption), and infrastructure bottlenecks.

By studying electricity consumption at granular levels, this project will:

* Reveal **regional trends and peak load drivers**
* Quantify **grid failure risk from supply chain bottlenecks**
* Recommend **prescriptive interventions** to mitigate disruptions and optimize operations

---

## 📊 Data Sources

Primary:

* EIA Open Data (Electricity): [https://www.eia.gov/opendata/browser/electricity](https://www.eia.gov/opendata/browser/electricity)
* EIA Total Energy Monthly Table (reference window for cross-checks): [https://www.eia.gov/totalenergy/data/browser/?tbl=T07.01#/?f=M&start=201503&end=202507&charted=1-2-3](https://www.eia.gov/totalenergy/data/browser/?tbl=T07.01#/?f=M&start=201503&end=202507&charted=1-2-3)

Secondary (feature enrichment, joins by state & month):

1. **NOAA** — weather & degree-days (heat/cool)
2. **U.S. Census Bureau** — population & housing
3. **Bureau of Labor Statistics (BLS)** — employment/industry activity
4. **EPA** — emissions / environmental indicators
5. **U.S. Dept. of Commerce** — economic indicators (e.g., BEA)
6. **EIA** (additional) — fuel mix, generation, outages

> The project brief and evaluation rubric emphasize clear problem definition, robust preprocessing, and a literature-grounded methodology—this README and Phase-1 scope reflect that emphasis.  

---

### 📁 Dataset (current Phase)

The working dataset is built from **monthly** observations for **48 contiguous U.S. states** (AK/HI optionally excluded in Phase-1), merging:

* Electricity consumption by sector & region (EIA)
* Weather features (NOAA: HDD/CDD, extreme events flags)
* Macroeconomic & demographic covariates (Census, BLS, BEA)
* Environmental context (EPA)

**Granularity:** Monthly (with pathways to Hourly in later phases)
**Coverage:** 2015–2025 (rolling availability; gaps imputed as noted below)

### ✅ Preprocessing (initial)

* Consistent **state FIPS** + month keys across sources
* **Missing values**: forward/backward fill within state, then KNN/median fallback
* **Outlier handling**: IQR capping per state-sector series
* **Feature scaling** (for ML models only):

  ```python
  from sklearn.preprocessing import StandardScaler
  scaler = StandardScaler()
  X_train = scaler.fit_transform(X_train)
  X_test  = scaler.transform(X_test)
  ```
* **Data dictionary** and **merge diagram** to be included in `/docs/` (Phase-1 output)

---

## 🧪 Research Questions (Phase 1)

1. How does electricity usage vary **across regions, sectors, and seasons**?
2. What **recurring demand spikes** pose stress to the grid?
3. How do **EV adoption and residential growth** impact future demands?
4. Which regions are at **highest shortage risk** under current trends?
5. What role can **renewables and diversified sourcing** play in enhancing resilience?
6. Can an **interactive geo-heatmap** help visualize and simulate resource allocation decisions?

---

## 🔍 Tools & Libraries (Planned)

| Purpose                                 | Library                                                  |
| --------------------------------------- | -------------------------------------------------------- |
| Graph modeling                          | `networkx`                                               |
| Optimization & interdiction simulations | `pulp`                                                   |
| Forecasting & time-series               | `prophet`, `statsmodels` (ARIMA), `pytorch` (LSTM later) |
| Causal inference                        | `dowhy`, `econml` (optional)                             |
| Geographical visualization              | `plotly`, `geopandas`, `folium`                          |
| Data wrangling                          | `pandas`, `polars` (optional)                            |

---

## 🚀 Innovation in Hypotheses (Phase-1, falsifiable & measurable)

We operationalize **Network Interdiction Problems (NIPs)** on a **weighted, directed grid graph** to quantify resilience and prescribe interventions:

1. **Vulnerability Concentration Hypothesis**
   *Claim*: The top **5%** of transmission edges by **flow-criticality** reproduce **≥70%** of observed historical shortage patterns when interdicted.
   *Test*:

   * Build state-to-state flow proxy graph from consumption + known interchange patterns; compute edge betweenness/flow contribution.
   * Interdict top-k% edges; simulate flow with `max_flow_min_cut`.
   * Measure overlap (F1/Recall) with historical shortage/outage signals. **Target ≥0.70 recall**.

2. **Cascade Amplification under Renewable Skew**
   *Claim*: Regions with **≥30% renewable-skewed import paths** experience **2×** larger demand-spike propagation (variance uplift) vs. balanced fuel mixes.
   *Test*:

   * Label paths by renewable share; run Granger causality / VAR on cross-regional loads.
   * Compare spike propagation factor (downstream variance ratio). **Target ratio ≥2.0**.

3. **Post-Interdiction Min-Cost Rerouting Cuts Misallocation**
   *Claim*: Solving **min-cost flows** after simulated interdictions reduces **misallocation cost by ≥18%** vs. naive rerouting.
   *Test*:

   * Define cost function: unmet demand & congestion penalties.
   * Compare naive (shortest-path) vs. `pulp` min-cost solutions. **Target ≥18% drop** in cost.

4. **Policy What-If: Net-Zero Hybrid Risks and Mitigation**
   *Claim*: A straight **30% fossil phase-down** without concurrent storage/transmission upgrades induces **≥15% blackout risk** in net-importing regions; hybrid scenarios (storage + targeted upgrades) cut that risk by **≥10 pp**.
   *Test*:

   * Scenario simulation on edge capacities (phase-down) + storage buffers; track unmet demand frequency.
   * Compare base vs. hybrid mitigations (storage + 2–3 strategic upgrades).

> These hypotheses translate the abstract into *actionable* metrics tied to the RQs and the **max-flow min-cut** / **NIP** framing used in the literature and your abstract.


---

## 🙌 Team & Roles (Phase-1)

| Role                     | Member              | Key Tasks                                        |
| ------------------------ | ------------------- | ------------------------------------------------ |
| Research Lead            | **C Murali Madhav** | Theoretical grounding, hypotheses, framing RQs   |
| Data Wrangler            | **C Murali Madhav** | Dataset sourcing, cleaning, EIA API integration  |
| Analytics Lead           | **Kartik Mehra**    | Exploratory visualizations, descriptive analysis |
| Documentation & Git Lead | **Ravi Yadav**      | Repo setup, code reviews, report writing         |
| Mentor                   | **Ashwin Tewary**   | Phase guidance, technical validation             |

> Roles may rotate across phases to ensure collective learning and contribution.


---

## 📜 References

**Foundational theory & methods**

* Bohi, D. R., & Zimmerman, M. B. (1984). *An Update on Econometric Studies of Energy Demand*. **Annual Review of Energy**.
* Ford, L. R., & Fulkerson, D. R. (1956). Maximal flow through a network. **Canadian Journal of Mathematics**.
* Dantzig, G. B. (1963). *Linear Programming and Extensions*. Princeton University Press.
* Sheffi, Y. (2004). *The Resilient Enterprise*. MIT Press.
* Grossmann, I. E. (2012). Advances in mathematical programming models for enterprise-wide optimization. **Computers & Chemical Engineering**.
* Dolgui, A., et al. (2018). Ripple effect in supply chains. **International Journal of Production Research**.
* Woodruff, D. P. (2015). Network interdiction and games. **Operations Research**.



---
