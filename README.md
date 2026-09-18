# Logistics & Inventory Management Database System (T-SQL)

## 📌 Project Overview
This project features a comprehensive Relational Database Management System (RDBMS) designed to optimize and automate the core operations of a logistics and supply chain company. Built using **Microsoft SQL Server (T-SQL)**, the system models real-world business logic by managing suppliers, inventory levels, warehouse capacities, customer orders, and vehicle statuses.

The core strength of this database lies in its embedded automation via dynamic **Triggers** and **User-Defined Functions (UDFs)**, showcasing industrial engineering process-optimization mindset.

---

## 🏗️ Database Schema & Architecture
The system consists of **10 interconnected tables** with strict relational integrity (`PRIMARY KEY`, `FOREIGN KEY`, and data constraints):
- **Tedarikçi (Supplier):** Stores supplier details and company identities.
- **Araç (Vehicle):** Tracks fleet capacity, vehicle types (Tır, Kamyon, Kamyonet), and current status (Bakımda, Yolda, Müsait).
- **Depo (Warehouse):** Manages regional and central warehouses with volumetric capacities.
- **Müsteri (Customer):** Contains verified customer contact and shipping data.
- **Ürün (Product):** Inventory catalog categorized by domain with unit prices.
- **Sipariş (Order) & Sipariş_Detayı (Order Details):** Handles lifecycle, status (Hazırlanıyor, Yolda, Teslim, İptal), and item quantities.
- **Stok (Inventory):** Monitors real-time stock levels, warehouse locations (Shelf numbers), and auto-updates timestamps.
- **Personel (Staff):** Assigns staff to specific warehouses or vehicles (Drivers vs. Warehouse clerks).
- **Taşıma (Shipment):** Bridges active vehicle fleets with ongoing customer orders.

---

## ⚙️ Advanced Database Automation (Triggers & Functions)

### 🚀 Smart Triggers (Automation)
1. **`trg_Stokekleme` (Auto-Replenishment):** Automatically detects if a product's stock falls below **50 units** after an update, and triggers an automated replenishment of **+300 units** to prevent stockouts.
2. **`trg_Stokyetersiz` (Inventory Safeguard):** Intercepts new orders before insert. If the requested quantity exceeds active stock, it rollbacks the transaction with a warning, protecting data integrity.
3. **`trg_Siparişiptali` (Reverse Logistics):** If an order status changes to 'İptal' (Cancelled), this trigger automatically reverses the inventory deduction and returns the items to stock.
4. **`trg_teslim_tarihi_ekle` (Timestamp Enforcement):** Automatically logs the exact execution date and time using `GETDATE()` the moment an order status switches to 'Teslim' (Delivered).

### 📊 Business Intelligence Functions (UDFs)
- **`kategorikçağırma`:** A table-valued function that instantly filters the entire product catalog based on a selected category (e.g., 'Elektronik').
- **`toplamfiyat`:** Computes the exact total monetary value of an entire order by joining order details with product price metrics.
- **`araçdurum`:** An algorithmic function that translates vehicle operational data into logistical states ('Dolu' / 'Boş') based on maintenance or delivery tracks.

---

## 🛠️ Tech Stack & Tools
- **RDBMS:** Microsoft SQL Server
- **Language:** T-SQL (Transact-SQL)
- **Concepts Applied:** Normalization, Joins, Aggregations, Subqueries, Triggers, User-Defined Functions.

---

## 📈 Future Steps: Power BI Dashboard
*Note: This database will soon be connected to **Power BI** to build an interactive Logistics Performance Dashboard, tracking fleet utilization, warehouse occupancy rates, and sales performance indicators.*
