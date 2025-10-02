# US Storm Events Analysis Using SAS

This project provides a comprehensive analysis of US storm events for the years 2022, 2023, and 2024 using SAS programming and statistical techniques. The repository includes datasets, SAS code, and a detailed report to facilitate exploratory data analysis, visualization, and statistical modeling of storm-related impacts.

## Table of Contents

- [About the Project](#about-the-project)
- [Datasets](#datasets)
- [SAS Code Overview](#sas-code-overview)
- [Analysis & Visualizations](#analysis--visualizations)
- [Statistical Methods Used](#statistical-methods-used)
- [How to Run](#how-to-run)
- [Report](#report)

---

## About the Project

This project aims to:

- Import, merge, and clean storm event data from multiple years.
- Summarize and visualize patterns in injuries, deaths, and property damages.
- Perform statistical analysis to uncover insights about event types, geographical impact, and severity.
- Provide reproducible SAS code and clear documentation for educational and research use.

## Datasets

The repository contains yearly datasets in Excel format:

- [`Chintham Reddy ,Lalithaditya_2022Dataset.xlsx`](Chintham%20Reddy%20%2CLalithaditya_2022Dataset.xlsx)
- [`Chintham Reddy ,Lalithaditya_2023Dataset.xlsx`](Chintham%20Reddy%20%2CLalithaditya_2023Dataset.xlsx)
- [`Chintham Reddy ,Lalithaditya_2024Dataset.xlsx`](Chintham%20Reddy%20%2CLalithaditya_2024Dataset.xlsx)

Each file contains storm event records, including:

- Event timing and location (state, county/zone, type)
- Event type and impact
- Direct and indirect injuries and deaths
- Property damage estimates

## SAS Code Overview

The core SAS code is found in [`Chintham Reddy ,Lalithaditya_SAScode.sas`](Chintham%20Reddy%20%2CLalithaditya_SAScode.sas) and implements the following workflow:

1. **Data Import:** Reads CSV files for each year and creates SAS datasets.
2. **Data Merge & Cleaning:** Combines yearly datasets and removes irrelevant columns.
3. **Content & Exploratory Analysis:** Prints dataset structure and sample records.
4. **Statistical Summaries:** 
   - Descriptive statistics using `proc means`
   - Frequency tables for categorical variables
5. **Visualization:** 
   - Bar charts for injuries by event type
   - Histograms and kernel density plots for property damage
   - Pie charts for event type distribution
6. **Advanced Analysis:**
   - Conversion of property damage values to numeric format
   - ANOVA for differences in property damage by event type
   - Regression analysis for relationship between injuries and damage
   - T-tests for comparing damage across zone types

## Analysis & Visualizations

The project explores:

- **Geographical Trends:** State-wise distribution of storm events.
- **Event Type Impact:** Frequency and severity of different storm types.
- **Injury and Death Patterns:** Direct and indirect impacts on populations.
- **Property Damage:** Distribution and significant differences by event type and region.
- **Statistical Relationships:** How injuries relate to property damage, and differences between county and zone-level impacts.

Visualizations include bar charts, histograms, density plots, and pie charts generated with SAS's `proc sgplot` and custom templates.

## Statistical Methods Used

- **Descriptive Statistics:** Mean, median, min, max, standard deviation.
- **Frequency Analysis:** State, event type, and zone type breakdowns.
- **ANOVA:** Tests for significant differences in property damage across event types.
- **Regression:** Models property damage as a function of injuries.
- **T-Test:** Compares damage between county and zone events.
- **Post-hoc Tukey Test:** Identifies specific event types with significant damage differences.

## How to Run

1. Clone the repository and ensure you have SAS installed.
2. Place the datasets (`2022.csv`, `2023.csv`, `2024.csv`) in your working directory, or update the file paths in the SAS code as needed.
3. Run [`Chintham Reddy ,Lalithaditya_SAScode.sas`](Chintham%20Reddy%20%2CLalithaditya_SAScode.sas) using SAS Studio or SAS Enterprise Guide.
4. Review the output for summary tables, statistical results, and visualizations.

## Report

The detailed analysis, findings, and interpretations are available in:

- [`Chintham Reddy ,Lalithaditya_Report.pdf`](Chintham%20Reddy%20%2CLalithaditya_Report.pdf)

This report includes:

- Project introduction and background
- Methodological approach
- Key statistical findings
- Data visualizations
- Conclusions and recommendations


