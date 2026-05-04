# Dynamic Travel Cost Estimator ✈️

**Course Project:** Database Management Systems (BSCS)
**Advisor:** Ma'am Hafiza Ayesha Nadeem[cite: 1]

## 📌 Project Overview
The Dynamic Travel Cost Estimator is a database-driven application designed to calculate travel costs dynamically based on distance, transportation type, and fuel efficiency[cite: 5]. It also assists users in selecting hotels based on pricing and ratings[cite: 5].

## ✨ Key Features
* **Complex Data Modeling:** Implements a relational schema with 5 core entities: Users, TravelDetails, Hotels, Bookings, and PricingData[cite: 5].
* **Advanced SQL Logic:** Includes custom **Views** for analytics and **Stored Procedures** for automated data handling[cite: 1].
* **Referential Integrity:** Enforces strict Foreign Key constraints and data validation rules (e.g., Rating checks)[cite: 3].
* **Relational Reporting:** Utilizes Inner, Left, and Right Joins to generate comprehensive user travel summaries[cite: 2].

## 🛠️ Tech Stack
* **Language:** C++[cite: 5]
* **Database:** MySQL[cite: 5]
* **API:** Google Maps API (for distance tracking)[cite: 5]

## 🚀 Setup Instructions
1. Clone the repository.
2. Ensure MySQL Server is running (e.g., via XAMPP Control Panel).
3. Import the `/sql/database_setup.sql` file into MySQL Workbench.
4. Execute the script to recreate the schema and sample data.
