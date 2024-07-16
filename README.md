# Analytics Engineering Challenge

This repository contains the solution for the Analytics Engineering Challenge. The project involves ingesting, modeling, and analyzing transaction data using dbt and Snowflake. Below is a detailed explanation of each step taken to complete the task.

- Check out the [dbt docs](https://luiz-decio.github.io/deel-home-task-globepay/#!/overview) for the documentation!

- More detailed documentation with the answers for the questions [here](/docs/luiz_decio_deel_home_task_globepay.pdf)!

## Table of Contents

1. [Preliminary Data Exploration](#preliminary-data-exploration)
2. [Model Architecture](#model-architecture)
3. [Lineage Graphs](#lineage-graphs)
4. [Tips and Macros](#tips-and-macros)

## Preliminary Data Exploration

### Step 1: Load and Inspect Data

- **Globepay Acceptance Report**: Contains transaction details such as transaction ID, date, status, amount, currency, and country.
- **Globepay Chargeback Report**: Contains chargeback details such as transaction ID, chargeback date, amount, and reason.

### Step 2: Data Profiling

- Identified key columns and their data types.
- Checked for null values and data inconsistencies.

## Model Architecture

### Step 1: Staging Models

Created staging models to clean and prepare raw data for further analysis.

- **`stg_acceptance`**:
  - Ingested raw acceptance data.
  - Standardized column names and data types.
  - Removed duplicates and handled missing values.

- **`stg_chargeback`**:
  - Ingested raw chargeback data.
  - Standardized column names and data types.
  - Removed duplicates and handled missing values.

### Step 2: Fact Model

Created a fact model to combine acceptance and chargeback data.

- **`fact_transactions`**:
  - Joined acceptance and chargeback data on transaction ID.
  - Calculated additional metrics such as total transaction amount and chargeback rate.
  - Getting the specific rate according to the currency that it was paid.
  - Convert the amount to USD.


### Step 3: Currency Conversion

Implemented a macro to dynamically extract exchange rates from a JSON column based on the currency code.

- **`get_rate` Macro**:
  - Extracts exchange rate from JSON column using `json_extract_path_text`.

## Lineage Graphs

Generated lineage graphs to visualize data flow and dependencies between models.

![Alt](/docs/lineage.png)

- **dbt Lineage Graph**: Shows the relationships between raw data sources, staging models, and the fact model.

## Tips and Macros

### Macros

- **`get_rate` Macro**:
  - Extracts the exchange rate from a JSON column based on the currency code.

### Data Validation

- Implemented data validation tests to ensure data quality:
  - Unique and not null tests for primary keys.
  - Accepted values tests for categorical columns.

### Documentation

- Detailed documentation for each model and macro in `schema.yml`.
- Includes descriptions, data types, and tests for each column.
- Added a GitHub actions workflow to update the dbt docs on new deploy.
