# DBT Sumup Code Challenge 

## Introduction

Welcome to the "DBT Sumup Code Challenge" project! This repository contains an end-to-end ELT (Extract, Load, Transform) pipeline using SQL, and DBT. 
The pipeline processes data from a data source and loads it into a data warehouse. The project includes data models that can answer various questions related to store transactions.
The process targets customers that will use Sumup devices efficiently and benefit the most from the products. The team needs to answer questions to know which stores, products and devices are the most efficient and also how long it takes for a store to adopt Sumup's devices.

## Description

The objective of the "DBT Sumup Code Challenge" project is to build a data pipeline and data models that can provide insights into store transactions. The pipeline performs the following tasks:

- Extracts raw data from the data source - in this case CSV files located in the 'Seed' folder of the project.
- Loads the data into the database for further analysis.
- Transforms the data using SQL and DBT to create data models for specific analytical use cases.

The data models are designed to answer the following questions:

1. **Top 10 Stores per Transacted Amount:**
   Identify the top 10 stores based on the total amount transacted (sales revenue).

2. **Top 10 Products Sold:**
   Determine the top 10 products that have been sold the most in terms of quantity.

3. **Average Transacted Amount per Store Typology and Country:**
   Calculate the average transacted amount for each store typology (store category) and per country.

4. **Percentage of Transactions per Device Type:**
   Calculate the percentage of transactions carried out using different device types (e.g., mobile, desktop).

5. **Average Time for a Store to Perform Its 5 First Transactions:**
   Calculate the average time taken by a store to perform its first five transactions.

## Getting Started

Follow these instructions to set up the "DBT Sump Code Challenge" project locally and start working with the data pipeline and data models.

### Prerequisites

Ensure you have the following software installed on your machine:

- Postgres SQL : [Postgres Installation Guide](https://www.postgresql.org/download/)
- DBT (version 1.5.3): [DBT Installation Guide](https://docs.getdbt.com/docs/installation)

### Installation

1. Clone this repository to your local machine:

    git clone https://github.com/amots12/dbt-sump-code-challenge.git

    cd dbt-sump-code-challenge


### Usage

Explain how to use the "DBT Sump Code Challenge" project for data transformation and analysis.

1. **Data Extraction and Loading:**
In order to solve this problem, we have provided the following three datasets in csv format
- Stores
- Devices
- Transactions

The files are loaded in the dbt project:

1. Addded to the seeds directory e.g. '/seeds'
 
2. Run the dbt seed command — a new table will be created in the warehouse

    dbt seed 

3. Refer to seeds in downstream models using the ref function. 


2. **Running DBT Models:**
The data models work as follows:

The first model is a preperatory model - "basic_model.sql". It merges the three dataset (Stores, Devices and Transactions csv's from stage 1) into a unified database. 

Each of the questions above is dealt by a different model.

1. top_store - to find the 10 most active stores by amount.
2. top_product - to find the 10 most sold items by name. 
3. trx_per_type - the proportion of transactions carried out using different device types out of the total number of transactions in the dataset.
4. average_trx_typo_country - The average amount of a transaction by each typology and country.
5. time_to_fifth_trx - The average days and total number of stores for a store to generate 5 transactions.


### comments and assumptions
- top store: 
Unsuccessful transactions (with statuses canceled and refused) are removed from the aggregation. 

- top product: 
for the implementation of the answer I used product_name instead of SKUs. 
It would be more efficient to use SKUs instead.
The dataset seems to be corrupted and only two SKUs are present. 
The "product_name" column is used as a temporary solution.

- trx_per_type:
the computation takes into account all of the dataset asa base.


- time_to_fifth_trx:
-- time is measured in days.
-- the scripts computes the first transaction's timestamp as the initiation date. 


to run the models use the command 
    
    dbt run


3. **Querying Data Models:**
By the end of a successful run dbt stores the output in the database (Postgres). 
Retrieve the data by using the reference {{ ref{'<model-name>'}}} ## (change model name to the desired model)


### Folder Structure

Directories in the project:



- **seeds**: Contains raw data files obtained from the data source.
- **models**: Contains DBT models for data transformation and analytical use cases.
- **dbt_project.yml**: Configuration file for the DBT project.
- **.gitignore**: Specifies files and directories to be ignored by Git.
- **README.md**: This README file.

### Contribution Guidelines

Process for Creating Pull Requests and Code Review

1. Fork the Repository (Contributor)
Fork the main repository of the project to your own GitHub account.
Clone the forked repository to your local machine using git clone.
2. Create a New Branch (Contributor)
Create a new branch from the main or master branch to work on your changes. Name the branch appropriately, reflecting the feature or bug fix you're implementing.
Make your changes and commit them to the branch with descriptive commit messages.
3. Push Changes to Your Fork (Contributor)
Once you are satisfied with your changes, push the branch with your changes to your forked repository using git push.
4. Create a Pull Request (Contributor)
On the main repository page on GitHub, switch to the branch you just pushed.
Click on "New Pull Request" to create a new pull request.
Select the appropriate base branch (usually main or master) and compare it with your feature branch.
Provide a descriptive title and detailed description of the changes you made in the pull request.
Click "Create Pull Request" to submit the pull request.
5. Review the Pull Request (Maintainer)
Reviewers (usually project maintainers) will receive a notification for the new pull request.
Reviewers will examine the changes, code quality, and any potential issues in the pull request.
6. Address Feedback (Contributor)
If the reviewer requests changes or provides feedback, address them in your local branch and make additional commits.
Push the updated branch to your forked repository (git push).
7. Code Merge (Maintainer)
If the pull request passes the review process and there are no conflicts, the maintainer can merge the pull request into the main branch.
The merged changes are now part of the project.
8. Closing the Pull Request (Maintainer)
Once the pull request is merged, the maintainer will close the pull request, indicating that it has been successfully integrated.
9. Cleanup (Contributor)
After the pull request is merged, you can delete the branch used for the pull request, both locally and remotely.
10. Repeat (Contributor)
If you have more changes to contribute, create new branches and follow the same process for each new pull request.



### Contact

For any questions or support related to the "DBT Sump Code Challenge" project.
- email: [Amots Yanai](me@amotsyanai.com)

---

