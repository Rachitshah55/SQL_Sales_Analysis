# Sales Analysis

## Overview

This project explores customer behavior and revenue dynamics within the Microsoft **Contoso 100k** e-commerce dataset. The dataset contains ~100,000 sales transactions with detailed information on customers, orders, and products, providing a realistic foundation for analyzing business performance.  

Using SQL-based analysis, the project uncovers patterns in customer value distribution, purchase behavior across cohorts, and long-term retention. The goal is not only to answer analytical questions but to demonstrate how raw transaction data can be transformed into **strategic business insights**.  

The deliverables serve two purposes:  
1. **Analytical Portfolio Piece** – showcasing SQL, visualization, and business interpretation skills.  
2. **Business Case Study** – illustrating how data analysis can inform growth, retention, and monetization strategies in an e-commerce context.  

## Business Questions
1. **Customer Segmentation:** Who are the company's most valuable customers?
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Retention Analysis:** Who hasn’t purchased recently?

## Analysis & Findings 

### 1. Customer Segmentation
- Categorized customers based on total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value segments
- Calculated key revenue metrics

#### Query 1: [1_customer_segmentation.sql](/1_customer_segmentation.sql)

#### Visualization: 
The visualization below highlights how revenue is distributed across High, Mid, and Low-value customer segments.  

![Customer Segmentation](/images/customer_segmentation.png)  
*Revenue concentration by customer segment (High, Mid, Low). AI-assisted visualization of SQL query results.*  
 

#### Key Findings:
- **Revenue is highly concentrated.** The High-value segment is just 25.0% of customers but drives 65.7% of total revenue.
- **Mid-value is under-monetized relative to its size.**  50.0% of customers (Mid) contribute only 32.2% of revenue with an average LTV of $2,682, far below High.
- **Low-value is a large cohort with minimal revenue impact.** 25.0% of customers (Low) contribute only 2.1% of revenue with an average LTV of $347.

#### Business Insight:
- **Defend & deepen High-value (65.7% of revenue)** Retention and loyalty initiatives are critical. Even minor attrition would significantly impact revenue.
- **Mid-value customers represent untapped potential. (50% of customers, 32.2% revenue)** Mid-value customers may represent light buyers or inconsistent shoppers — signaling gaps in engagement or cross-sell strategy. Even modest increases in purchase frequency or average order value could generate meaningful incremental revenue. 
- **Low-value customers dilute efficiency.** Broad acquisition and engagement efforts toward this group yield little return.

---

### 2. Cohort Analysis
- Tracked revenue and customer count per cohort
- Cohorts are grouped by year of first purchase
- Analyzed customer retention at a cohort level

#### Query 2: [2_cohort_analysis.sql](/2_cohort_analysis.sql)

#### Visualization: 
The chart below shows revenue per customer trends over time, grouped by the year of first purchase (cohorts).  

![Cohort Analysis](/images/cohort_analysis.png)  
*Revenue per customer by cohort year, showing long-term decline despite growing customer counts. AI-assisted visualization of SQL query results.*  


#### Key Findings:
**Revenue per customer shows an alarming decreasing trend over time**
- Per-customer revenue is falling steadily. From the peak (2016) to 2024 it drops ~38% (≈ $3,035 → $1,878), with an average decline of ~$122 per cohort-year.
- **Customer growth has not translated into proportional revenue growth.** Even where customer counts surge (e.g., 2022), revenue per customer is lower than earlier cohorts—pointing to weaker monetization of newer customers

#### Business Insight
- The business is **acquiring more but monetizing less** per customer over time. That suggests: cheaper segments, deeper promos, product mix drifting to lower AOV/LTV, or onboarding that’s less effective for recent cohorts.
- Cohort performance should be **decomposed by acquisition channel, region, and product category** to identify the root causes of weaker monetization.
- The consistent year-over-year decline indicates a structural issue in monetization strategy, not just one-off seasonal or market effects.

---

### 3. Retention Analysis
- Identify customers at risk of churning 
- Analyzed last purchase patterns
- Calculated customer-specific metrics

#### Query 3: [3_retention_Analysis.sql](/3_Retention_Analysis.sql)

#### Visualization: 
The visualization below illustrates customer retention patterns, showing how quickly customers stop purchasing after their first transaction.  

![Retention Analysis](/images/retention_analysis.png)  
*Active vs. churned customers across cohorts, highlighting high churn rates and slight stickiness improvement in recent years. AI-assisted visualization of SQL query results.*  
 

#### Key Findings:
- **Churn dominates the customer base** — across cohorts, **~91% of customers stop purchasing after 6 months**, leaving only 9% active. This shows most customers treat the e-commerce platform as a **one-time or occasional purchase store**, not a recurring destination.
- **Recent cohorts are slightly “stickier”** — Active share improved from 8% (2015) to 10% (2022–23). Even a 2pp lift translates to **hundreds of retained customers per cohort**, suggesting recent changes in assortment, digital experience, or promotions are having a small but positive effect.
- **Acquisition is high but wasteful** — the **2022 cohort brought in 9,010 new customers** (largest ever), but **over 8,000 churned**. The company is spending heavily to acquire traffic, but the lack of repeat buying is **eroding ROI and compressing margins**. 

#### Business Insight:
- The company is **operating like a transactional marketplace rather than a loyalty-driven platform**, with most customers exiting after a single purchase.

- **Acquisition-led growth is unsustainable** as churn erodes ROI and limits lifetime value.

- While recent cohorts show slight improvements, the core issue remains a **failure to build repeat purchase behavior**, leaving the business dependent on constant new customer acquisition.

## Strategic Recommendation  

**Optimizing Customer Value**  
Adopt a **tiered approach** that aligns investment with impact:  
- **High-value customers** → Protect the revenue core through loyalty programs, personalized experiences, and proactive retention.  
- **Mid-value customers** → Unlock growth by driving higher order frequency and basket size, using targeted upsell campaigns and cross-category bundles.  
- **Low-value customers** → Contain costs by relying on automated reactivation and self-service engagement, avoiding broad, resource-intensive campaigns.  



**Improving Cohort Performance**  
Shift from a **volume-first to a value-first growth model**:  
1. Diagnose monetization gaps by dissecting cohorts across channel, region, and product to pinpoint underperforming areas.  
2. Rebalance acquisition toward higher-LTV channels and customer types, even if initial acquisition costs are higher.  
3. Redesign onboarding and engagement journeys to accelerate second purchases and build sustainable revenue from newer cohorts.  



**Strengthening Retention & Reducing Churn**  
Develop a structured **retention program** that complements acquisition efforts:  
- **Loyalty Loop:** Post-purchase emails, tailored offers, and personalized recommendations to build repeat behavior.  
- **Subscription & Auto-Replenishment:** For recurring-use categories, create programs that lock in long-term customers.  
- **Win-Back Funnel:** Target customers at 4–6 months of inactivity with tailored offers and product bundles before they churn permanently.  



**Overall Strategic Direction**  
The company must pivot from an **acquisition-heavy, transactional model** toward a **sustainable growth engine** built on three pillars:  
1. Defend and expand customer value,  
2. Monetize cohorts more effectively, and  
3. Institutionalize retention as a core discipline.  

Together, these strategies shift the business from chasing short-term sales spikes to building **profitable, long-term customer relationships**.  


## Technical Details
- **Database:** Microsoft Contoso 100k (sample e-commerce dataset)
- **Environment:**  PostgreSQL  
- **Tools for Analysis:** DBeaver, VS Code, pgAdmin,   
- **Visualization & Documentation:** ChatGPT (visualization, formatting), Obsidian (project notes, markdown structuring),   
- **Version Control & Publishing:** Git, GitHub (repository hosting, README formatting)  