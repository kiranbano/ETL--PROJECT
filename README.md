# ETL Project Report: Australian renewable energy installations history and their respective output database in relation with the solar post code’s ratings.
Contributors: Arron Nguyen, Kiran Bano, Zohaib Hashmi

**Project Proposal.

Aim of the project is to make a relational database for Australian renewable energy / small scale installations that could be referred back to post code data, zones and their ratings using ETL process.
For the purpose, we analysed the data of previous years from http://www.cleanenergyregulator.gov.au/RET/Forms-and-resources/Postcode-data-for-small-scale-installations#SGU--Solar-Deemed. Data showed interesting trends as shown in Figure 1, number of installations was booming between 2009 and 2011 and after dipping down until 2016 number of installations started increasing again from 2017-2019. In 2020,  major decrease was observed (~85000 installations) across Australia that can be attributed to the global pandemic.
Based on these facts we decided to select post code data of 2017, 2018 and 2019 for our project. Analysis of data also showed that hydro and wind power installations were negligible as compared to solar powered installations. Therefore, the post code zones and rating data of solar installations were also extracted to be included into our database.
 
 ![image](https://user-images.githubusercontent.com/72603532/117405134-7169c880-af4e-11eb-8d2f-9f07beecf329.png)


Figure 1: Graphical representation of number of small-scale installations in last decades across Australia. 



**Analysis Tools:**

•	Python Pandas, PostgreSQL, Excel


**Extract, Transform and Load the Final to destination database**

![image](https://user-images.githubusercontent.com/72603532/117405180-87778900-af4e-11eb-9d8c-566f521d266c.png)
 
Figure 2: Schematic representation of ETL process used in this project

**Extract:**

All CSV files were read and loaded into a data frame.
         
•	Source for renewable energy installations: http://cleanenergyregulator.gov.au/RET/Forms-and-resources/Postcode-data-for-small-scale-[…]/historical-postcode-data-for-small-scale-installations
•	Source for Australian post code data: https://gist.github.com/randomecho/5020859
•	Source for post code zones rating: http://www.cleanenergyregulator.gov.au/DocumentAssets/Pages/Postcode-zone-ratings-and-postcode-zones-for-solar-panel-systems.aspx


**Transform:**

•	CSV files for renewable energy installations were renamed for convenience.
•	Post code rating data was in word format, data was copied into excel and saved as CSV file.
•	Australian post code data was added to a table created in PostgreSQL and was formatted by removing (’\’ ) from the names to avoid syntax error. Serial id for post code was set as primary key.

	**For Ipynb**

•	All CSV files were loaded and read using Jupyter python note book. New data frames were created for wind, solar and hydro installations with the information selected from the data of 2017, 2018 and 2019.
 
![image](https://user-images.githubusercontent.com/72603532/117405268-b5f56400-af4e-11eb-86aa-c25bcf7e59f5.png)


•	Columns were renamed to make it simple and beautiful for example: 
 
![image](https://user-images.githubusercontent.com/72603532/117405300-c4438000-af4e-11eb-98ef-e7af788db211.png)


•	Data of 2017, 2018  and 2019 were merged by year for wind, air and solar power data on  “Post code”.
 
 ![image](https://user-images.githubusercontent.com/72603532/117405335-d1f90580-af4e-11eb-99c3-b7ccaf671458.png)


•	In the merged columns, “NaN” were replaced with zero using numpy.

•	Merged data frame was then split into installations and output for hydro, wind and solar power

 ![image](https://user-images.githubusercontent.com/72603532/117405408-ef2dd400-af4e-11eb-8173-49b11740dc66.png)

•	Solar rating data was also transformed by replacing “NaN “values with zero and resetting the index


**Load:**

•	To load the transformed data into our database, an engine was created to connect with PostgreSQL

 ![image](https://user-images.githubusercontent.com/72603532/117405453-01a80d80-af4f-11eb-82c0-cff3dd496827.png)

•	All the data tables were then loaded to SQL database.

![image](https://user-images.githubusercontent.com/72603532/117405486-0ec4fc80-af4f-11eb-84eb-3c99e911ab71.png)

•	Finally Queried to check if the DB has all the tables.  

![image](https://user-images.githubusercontent.com/72603532/117405658-4e8be400-af4f-11eb-857f-f8bbe7e69ad6.png)

•	Final ExtractTransformLoad work is shown in:  ETL_project final.ipynb

**ERD:**

•	Following query was used to demonstrate the use of our database for solar installations in Victoria as per postcodes and their ratings.

 ![image](https://user-images.githubusercontent.com/72603532/117405633-47fd6c80-af4f-11eb-80fc-8114b88a5d6b.png)


•	ERD diagram was created using https://www.quickdatabasediagrams.com/

![image](https://user-images.githubusercontent.com/72603532/117519558-64e57e80-afe7-11eb-85ad-dcf8fd2ea0a0.png)


**ERD NOTES:**

•	ERD diagram is saved as a PNG file “ETL_project_ERD.png”
•	DB testing query is stored in “Queries_on_database.sql”.








	
