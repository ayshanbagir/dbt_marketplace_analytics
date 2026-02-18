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

models/
├── staging/
├── intermediate/
├── mart/
│ ├── dim/
│ └── fact/
snapshots/
macros/
tests/


### 🔹 Staging Layer
- Source configuration & documentation
- Data type standardization
- Column normalization
- Lightweight transformations

### 🔹 Intermediate Layer
- Business logic implementation
- Data enrichment through joins
- Reusable transformation logic

### 🔹 Mart Layer (Star Schema)
- Dimension and fact table design
- Clearly defined grain per table
- Surrogate key generation
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

### Schema Isolation
Custom macro:

- `generate_schema_name` – dynamic schema generation for environment-aware deployments

Demonstrates understanding of scalable multi-environment workflows.

---

## ✅ Data Quality & Reliability

Comprehensive testing strategy:

- `not_null`
- `unique`
- Relationship tests
- Snapshot validation
- Custom tests

Ensures:
- Referential integrity  
- Proper table grain  
- Reliable downstream consumption  

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
