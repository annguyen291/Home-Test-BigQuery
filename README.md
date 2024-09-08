# [SQL] Home Test
## I. Introduction
This project contains a dataset with few questions that I will explore using SQL on [Google BigQuery](https://cloud.google.com/bigquery).
## II. Requirements
* [Google Cloud Platform account](https://cloud.google.com)
* Project on Google Cloud Platform
* [Google BigQuery API](https://cloud.google.com/bigquery/docs/enable-transfer-service#:~:text=Enable%20the%20BigQuery%20Data%20Transfer%20Service,-Before%20you%20can&text=Open%20the%20BigQuery%20Data%20Transfer,Click%20the%20ENABLE%20button.) enabled
* [SQL query editor](https://cloud.google.com/monitoring/mql/query-editor) or IDE
## III. Dataset Access
The dataset is a file csv dataset. To access the dataset, follow these steps:
* Download each sheet of the Excel file in CSV format because BigQuery cannot read all sheets of an Excel file.
* Log in to your Google Cloud Platform account and create a new project.
* Create a new dataset in the project that was just created a few minutes ago.
* Upload each ".csv" file into Google BigQuery.
* Click on the plus sign in the tab to create a new query and then use it.
## IV. Exploring the Dataset
In this project, I will write 04 query in Bigquery base on dataset
### Query 01: There are 3 tables containing information about the artists, songs, and global_song_rank. Write a query to determine the top 5 artists whose songs appear in the Top 10 of the global_song_rank table the most.
* SQL code

<img width="621" alt="01" src="https://github.com/user-attachments/assets/0be1f140-5525-4592-ac76-3a9f31a0e35e">
<img width="571" alt="02" src="https://github.com/user-attachments/assets/bf093e06-2372-4a41-8c99-5bb25e9dd556">

* Query results

<img width="861" alt="03" src="https://github.com/user-attachments/assets/81defe44-ffcf-43d5-884a-6980529de9ac">

### Query 02: Find the lifetime total orders, total spent (GMV), unique items bought , earliest purchase date, last purchased date, average amount spent per order (AOV) and average purchase price (APP) for the following buyer IDs and their purchased products’ categories: 1076216361964070, 3190859517651870, 3754202390878020
* SQL code

<img width="731" alt="01" src="https://github.com/user-attachments/assets/d4aad3c2-36d8-42c1-b844-27691327e52a">
<img width="838" alt="02" src="https://github.com/user-attachments/assets/09b6a6c6-4367-49cf-be90-630463652af3">

* Query results

<img width="1261" alt="03" src="https://github.com/user-attachments/assets/c54b519c-6ea8-4e8c-834f-5c50e7209cf4">

### Query 3: Find out the top 10 cross border items with the highest quantity sold. The output includes minimum selling price, total spent (gmv) and total orders. 
* SQL code

<img width="634" alt="01" src="https://github.com/user-attachments/assets/b18db9fd-d9fb-43c4-862e-074de46e299a">
<img width="616" alt="02" src="https://github.com/user-attachments/assets/eecf97f6-3404-4f1d-be14-cddfd439b2b6">

* Query results

<img width="1082" alt="03" src="https://github.com/user-attachments/assets/97bea5ee-1157-41ed-8dc6-5e69e1121827">

### Query 04: Find the average time (in day unit) between customer’s first and second checkout (for example avg. time is 3.4 day which is calculated for average metric of all customer base)
* SQL code

<img width="721" alt="01" src="https://github.com/user-attachments/assets/d4f50922-d85e-490f-8592-7704254c8c2a">

* Query results

<img width="185" alt="02" src="https://github.com/user-attachments/assets/38ab5ced-771a-4e78-8549-bc044f65134a">

## V. Conclusion
* In conclusion, my exploration of the Home Test dataset using SQL on Google BigQuery based on dataset has revealed several interesting insights.
* By exploring the dataset, I have gained valuable information about top 5 artists, total spent (GMV), unique items bought, the top 10 cross border items with the highest quantity sold,.... which could inform future business decisions.
* To deep dive into the insights and key trends, the next step will visualize the data with some software like Power BI,Tableau,...
* **Overall**, this project has demonstrated the power of using SQL and big data tools like Google BigQuery to gain insights into large datasets.
