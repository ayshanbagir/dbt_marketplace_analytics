# 📊 Modern Analytics Engineering Pipeline (dbt + Snowflake + Dagster)

Production-style analytics engineering project implementing a scalable transformation pipeline on marketplace data using modern data stack principles.

This project demonstrates end-to-end ownership of data modeling, warehouse optimization, historical tracking, testing, and orchestration.

---

## 🛠 Tech Stack

- **Cloud Data Warehouse:** Snowflake  
- **Transformation Framework:** dbt  
- **Orchestration:** Dagster  
- **Languages:** SQL, Jinja  

---

## 🏗 Architecture & Modeling Strategy

The project follows a modular, layered dbt architecture aligned with analytics engineering best practices:
<pre> <code>
models/
├── sources/
├── staging/
├── intermediate/   
├── mart/
│ ├── dim/          
│ └── fact/         
snapshots/
macros/
tests/</code> </pre>

---

## 🔹 Source Layer

- Raw table definitions
- Schema documentation
- Column-level descriptions

Provides structured entry points for upstream data.

### 🔹 Staging Layer
- Column renaming & normalization
- Data type standardization
- Lightweight transformations

### 🔹 Intermediate Layer
- Business logic implementation
- Data enrichment through joins
- Reusable transformation logic

### 🔹 Mart Layer (Star Schema)
- Dimension and fact table design
- Clearly defined grain per table
- Analytics-ready datasets

The mart layer supports efficient reporting and scalable analytics workloads.

---

## 🕒 Historical Tracking (SCD Type 2)

Implemented Slowly Changing Dimension Type 2 snapshots to capture historical changes in dimension tables.

- Record versioning
- `valid_from` / `valid_to`
- Current record indicator
- Full auditability of changes over time

---

## ⚡ Performance Optimization

### Incremental Models
Fact tables are built using incremental strategies to:

- Minimize Snowflake compute cost  
- Process only new/updated records  
- Improve pipeline efficiency  

### Custom macro:

- `generate_schema_name` – dynamic schema generation for environment-aware deployments

Demonstrates understanding of scalable multi-environment workflows.

---

## ✅ Data Quality & Reliability

Comprehensive testing strategy:

### Built-in dbt Tests
- `not_null`
- `unique`
- Relationship tests

### dbt Packages
- `dbt_utils`
- `dbt_expectations`

### Custom SQL Tests
- Custom validation logic inside `/tests`
- Grain validation checks
- Business rule enforcement

### Documentation
- Model-level descriptions
- Column-level descriptions
- YAML-based metadata definitions

Ensures reliable, well-documented, production-ready data models.

---

## 🚀 Orchestration with Dagster

Dagster is used to:

- Trigger dbt model runs  
- Execute snapshots  
- Stream structured logs  
- Manage job execution flow  

This simulates a production-grade orchestration environment beyond CLI execution.

---

## 📌 Core Concepts Demonstrated

- Layered transformation architecture  
- Dimensional modeling (Star Schema)  
- SCD Type 2 implementation  
- Incremental data processing  
- Macro-driven environment configuration  
- Data quality enforcement  
- Cloud warehouse optimization  
- Orchestrated ELT workflows  

---

## 🎯 Project Outcome

This project showcases practical analytics engineering skills including:

- Designing scalable data models  
- Optimizing warehouse performance  
- Implementing historical tracking  
- Building production-ready dbt pipelines  
- Managing orchestration and execution  

It reflects real-world data engineering patterns used in modern cloud data platforms.
