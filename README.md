# UserTransactionAnalytics

## Overview
This project is a comprehensive analysis of transaction data for a financial institution, focusing on understanding and improving conversion rates. The analysis delves into various factors that influence transaction success and proposes strategies for increasing transaction volume through the institution's mobile applications.

## Key Findings
- **Overall Conversion Rate**: The average conversion rate across all transactions is 95.87%, considering various influencing factors.
- **Influencing Factors**: Factors impacting the conversion rate include the money corridor, amount sent, customer tenure, app operating system, transaction type, date, and customer age.
- **Amount Sent**: Higher transaction amounts show a lower conversion rate, with transactions above $290 comprising 51% of the total transaction value but having a conversion rate 3.5 percentage points below average.

## Hypotheses and Recommendations
- **High-Value Transactions**: A hypothesis for the lower conversion rate for high amounts includes issues like insufficient balance and transaction limits. Implementing a warning for high-amount transactions could improve conversion rates.

## Experiment Proposal
- **Objective**: To increase transaction volume through the mobile app.
- **Methodology**: Implement a warning system for transactions exceeding $290 to prevent transaction failures.
- **Next Steps**: Design the test, collaborate with stakeholders, set up the experiment, analyze results, and plan the implementation.

## Data Insights and Anomalies
The absence of a transaction ID key and ambiguities in status definitions were observed. These anomalies could affect data integrity and require further investigation.

## Repository Structure
- `TransactionRateAnalysis.sql`: SQL queries and scripts for analysis.
- `Presentation/`: Detailed presentation of findings and strategies.

## Conclusion
Valuable insights into factors affecting conversion rates have been uncovered, leading to actionable strategies for enhancing transaction volumes.
