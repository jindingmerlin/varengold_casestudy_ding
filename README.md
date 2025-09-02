# Case Study at Varengold Bank AG - Data Analyst

## Introduction

Dear applicant,

Thank you for taking your time and agreeing to work on a short case study for us.

In this case study, we would like to go through typical concepts, task and challenges associated with data analysis,
while keeping it closely related to your potential future working environment. In order not to take too much
of your time, we have prepared this repository for you. We propose a folder structure and provide some initial code
snippets as well as a database and one CSV file, that should get you going very quickly. Depending on your
prior knowledge, we estimate a working effort of
2h - 4h.

The goal of this test is to evaluate your understanding of dbt, SQL and your data visualization skills.

Once you feel ready - please not later than one day before your second interview - send us a link to your own
repository. In the interview, you will guide us briefly through your work. Your participation is very much appreciated!

In case you have any problems, questions or feedback, please don't hesitate to approach us right away.

Good luck and have fun,

Your Varengold data team

[Contact us](mailto:d.maas@varengold.de)

### Prerequisites

- Docker
- Your favorite IDE
- Git
- PowerBI Client

## Case Study

We have a small, normalized data model that contains data about our customers, their accounts and loans, as well as
their transactions in various currencies. The data is artificially and randomly generated. For our case study, we assume
that the data comes from a source database every day and lands in our data warehouse (`postgres: raw`). We take this
source
and want to load it for our purposes into a reporting schema (`postgres: reporting`). We have started our work already (
`./transformations/models/staging`). This is where we need your
help...

### Tasks:

**Setup:**

1. [ ] Please create a repository and commit this content (or clone and change remote)
2. [ ] Start the devcontainers
4. [ ] Set up PowerBI Desktop and configure data ingestion from the database container (
   `localhost:5432 db/schema/user/pw=postgres`)

> **⚠️ Important Note:** If you encounter any issues getting the devcontainer to run or if you get stuck with the setup,
> please don't hesitate to contact us immediately. Docker and devcontainer usage is not part of the evaluation - we've
> implemented this setup out of necessity to ensure all applicants have a consistent working environment.

**Data Engineering (dbt):**

In the `transformations` directory, you'll find a pre-build dbt project that resembles a production repository used for
data engineering projects at Varengold. We would like to ask you to create a materialized reporting table that sums up
all transactions in EUR per customer, account, branch and transactions_date. The table should be placed in a dedicated
schema (like reporting or marts).

- [ ] Implement a dbt model that creates a materialized table in the reporting schema
- [ ] The model should sum up all transactions in EUR (Euro) per customer, account, branch and date
- [ ] Use the provided exchange rate table for currency conversion across all dates
- [ ] Include appropriate dbt tests for data quality validation

**Business Intelligence Dashboard (PowerBI):**

You've been asked to create a dashboard for the Branch Performance Manager, who needs to understand how different
branches are performing in terms of customer transaction activity. They mentioned wanting to see 'the important numbers'
broken down by branch and over time, and specifically asked about EUR equivalents since they deal with multiple
currencies. They'll be presenting this to senior management next week.

- [ ] Create a comprehensive Branch Performance Dashboard in PowerBI

**Submission:**

- [ ] Please send us a link to your repository with complete dbt project and PowerBI project files (`.pbip`)
- [ ] Provide screenshots of key dashboard pages in your repository
- [ ] Include dbt documentation output (docs generate)
- [ ] Include a brief summary of your key findings and recommendations

### Evaluation Criteria:

- **Business Understanding:** Ability to translate data into business insights using appropriate visualizations
- **Dashboard Design:** User experience, visual clarity, interactivity, and PowerBI best practices
- **SQL/dbt Proficiency:** Query efficiency, correctness, and dbt best practices implementation
- **PowerBI Proficiency:** Effective use of DAX, data modeling, and advanced PowerBI features
- **Analytical Thinking:** Quality of insights and business recommendations
- **Communication:** Clarity of presentation and storytelling with data

### Business Context

You're analyzing data for a multi-branch bank that:

- Operates across multiple branches with different performance levels
- Handles transactions in multiple currencies (requires EUR conversion)
- Offers various account types and loan products
- Serves customers across different age demographics
- Needs to track performance metrics for management reporting
- **Senior management prefers PowerBI dashboards for strategic decision-making**
- **Data transformations must be version-controlled and documented using dbt**

### Data Schema Overview

The intermediate schema contains cleaned and processed tables:

- **customers:** Customer demographics and branch assignments
- **accounts:** Account information linked to customers
- **transactions:** All transaction data with multi-currency support
- **loans:** Loan portfolio with approval/rejection status
- **fx_rates:** Exchange rates for currency conversion
- **currencies:** Currency lookup table

### ERD (DuckDB: intermediate schema)

The entity-relationship diagram shows how the individual tables are related to each other.

<img src="docs/erd.png">

## Getting Started

1. **Devcontainer Setup:** Get `.devcontainer/devcontainer.json` up and running
   2**Data Transformation:** Create dbt models for data preparation and transformation
   3**Understand the Business:** Review the Branch Performance Manager requirements
   4**Build PowerBI Dashboards:** Create interactive, executive-ready dashboards using transformed data
   5**Think Like an Analyst:** Focus on insights that drive business decisions
   6**Document Your Work:** Use dbt docs and prepare to explain your analysis approach

### dbt Project Structure:

```
dbt_project/
├── models/
│   ├── staging/
│   ├── intermediate/
│   └── marts/
├── tests/
├── macros/
└── docs/
```

Remember: The goal is not just to create dashboards, but to demonstrate your ability to extract meaningful business
insights from data and communicate them effectively to stakeholders using industry-standard tools like PowerBI and dbt.
Show proficiency in both technical data preparation (dbt/SQL) and business presentation (PowerBI).