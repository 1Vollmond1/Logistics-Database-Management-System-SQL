# Logistics & Inventory Management System: From Conceptual ERD to T-SQL Implementation

## 📌 Project Overview
This project demonstrates the end-to-end engineering cycle of a **Relational Database Management System (RDBMS)** designed to optimize supply chain and logistics operations. The system models complex real-world workflows including fleet tracking, multi-regional warehouse management, tiered inventory control, and automated customer order lifecycles.

The distinct feature of this project is its strict adherence to **Database Normalization (up to 3NF)** and structural blueprints mapped out via **ERD (Entity-Relationship Diagrams)** and **UML Class Diagrams** before full deployment in **Microsoft SQL Server (T-SQL)**.

---

## 📐 Systems Design & Architecture

### 1. Conceptual Design (ER Diagram)
- Mapped all primary corporate entities (Customers, Orders, Products, Warehouses, Staff, Fleet Vehicles, and Suppliers).
- Defined precise cardinality constraints (e.g., 1:N mapping between Warehouses and Personnel; N:M mapping between Orders and Products resolved via a bridge transaction table).

### 2. Logical Design & Object Metaphor (UML Class Diagram)
- Enforced object-oriented definitions for database tables, defining explicit operational behaviors/methods such as `SiparisOlustur()`, `MiktarGuncelle()`, and `AracDurumuGuncelle()`.

### 3. Database Normalization (1NF ➡️ 2NF ➡️ 3NF)
- **1NF:** Eradicated multi-valued attributes (comma-separated product lines inside unique order entries).
- **2NF:** Eliminated partial dependencies by separating transactional order parameters from core master product data.
- **3NF:** Eliminated transitive dependencies, decoupling geographic attributes (addresses, cities) from employee and supplier tables to establish an anomaly-free database schema.

---

## ⚙️ Programmable Database Automation (T-SQL)

### 🚀 Automation Triggers
- **`trg_Stokekleme` (Just-In-Time Replenishment):** Monitors inventory drops. If any item's stock dips below **50 units**, it triggers an automated batch order of **+300 units**.
- **`trg_Stokyetersiz` (Transaction Control & Rollback):** Acts as a barrier against stockouts. If a customer places an order exceeding active warehouse availability, it terminates the query and alerts the system.
- **`trg_Siparişiptali` (Reverse Logistics Automation):** Instantly returns cancelled items back to respective warehouse quantities when an order state is updated to 'İptal'.

### 📊 Business Logic Functions (UDFs)
- **`toplamfiyat`:** Aggregates real-time unit prices and order quantities to yield invoice amounts.
- **`araçdurum`:** Programmatically reports fleet status ('Dolu' / 'Boş') based on real-time vehicle dispatch metrics.

---

## 🛠️ Technology Stack
- **Database Engine:** Microsoft SQL Server (SSMS)
- **Programming Language:** T-SQL (Transact-SQL)
- **Modeling Tools:** ERD Notation, UML Class Modeling, Excel-based 3NF Normalization Mapping.

---

## 🚀 Next Phase: Business Intelligence
The architecture is fully ready to be connected with **Power BI Desktop** to design real-time data streaming visuals for warehouse capacity tracking, fleet performance, and order velocity.
