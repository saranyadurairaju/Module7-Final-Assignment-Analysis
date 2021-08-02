# Pewlett-Hackard-Analysis with Postgres SQL

SQL is used all around the world by a majority of big companies. A data analyst can use SQL to access, read, manipulate, and analyze the data stored in a database and generate useful insights to drive an informed decision-making process. 

Postgres is an advanced open-source object-relational system which allows you to store large and sophisticated data safely. It helps developers to build the most complex applications, run administrative tasks and create integral environments. 

PGAdmin is used to manage the Postgres database and its services. It is a web-based GUI tool used to interact with the Postgres database sessions(remote & local). You can use PGAdmin to perform any sort of database administration required for a Postgres database.

## Overview of Project

Pewlett-Hackard is a large company and its been around for a long time. So many of the employees working there is reaching Retirement age soon. Bobby, the HR analyst who use to do Employee research is interested in finding the below information:

  •	Employees who are going to retire in few years.

  •	The number of Retiring Employees by Title. 
  
  •	Positions need to be filled in near future.
  
  •	The number of upcoming job openings.
  
  •	Retirement package for those who met criteria.

  •	The Employees Eligible for the Mentorship Program.
 
### Purpose

Till now in Pewlett-Hackard, they were using Excel and VBA for analysis. Now Bobby wants to convert all the csv files into database and perform the analysis using SQL. Using an online tool called Quick Database Diagrams ("Quick DBD" for short), we'll create a conceptual ERD. But Postgres is where our data will actually live once we import it. So, finding the solution for all questions is simple with the help of all these database and tools. 

## Analysis 

Entity relationship diagram or a Schema is a term that will come up often while working in SQL and it references the design of the database, and specifically how the tables and their relationships are mapped out. It's also called a flowchart. We'll be using all of these terms, though "ERD" is the most specific.

There are three forms of ERDs: conceptual, logical, and physical. 

  •	Conceptual diagram is a simplest form with table name and column headers.

  •	Logical diagram is updated to include data types and primary keys.
	
  •	Physical diagram is how the data is connected, between each table.

So, We have total 6 tables and below is the ERD diagram which explain the details and connection between the tables.
 
![image](https://user-images.githubusercontent.com/85472349/127806893-cd827ed0-728d-4eea-a8d6-2d71b78de8b1.png)

#### The Number of Retiring Employees by Title

* We are creating a Retirement Titles table that holds all the titles of current employees who were born between January 1, 1952 and December 31, 1955. 

![image](https://user-images.githubusercontent.com/85472349/127812171-7e650b77-b883-422a-865b-f3eed33a7881.png)

* Since some employees may have multiple titles in the database due to promotions, we need to use the DISTINCT ON statement to create a table that contains the most recent title of each employee. 

![image](https://user-images.githubusercontent.com/85472349/127812193-0b408258-d4cd-4337-8821-7d250d3fc396.png)

* Then, we are using the COUNT() function to create a final table that has the number of retirement-age employees by most recent job title.

![image](https://user-images.githubusercontent.com/85472349/127812220-6235ff4a-034c-49a4-8123-af6d8ffccdfb.png)

#### The Employees Eligible for the Mentorship Program

* Creating a mentorship-eligibility table that holds the current employees who were born between January 1, 1965 and December 31, 1965. 

![image](https://user-images.githubusercontent.com/85472349/127926901-c8a85363-a916-4a31-a033-e73ba8164f38.png)

Writing a Query language with the databe in the above methods will provide the number of **retiring employees per title**, and identify employees who are eligible to participate in a **mentorship program** for **Pewlett-Hackard**.

## Results

Below is the full SQL script Employee_Database_challenge.sql to determine the Employee details. 

![Employee_Database_challenge](https://github.com/saranyadurairaju/Module7-Final-Assignment-Analysis/blob/main/Employee_Database_challenge.sql)

Also, the data files retirement_titles.csv, unique_titles.csv, retiring_titles.csv, and mentorship_eligibilty.csv are in the below data folder:

![DATA_Folder](https://github.com/saranyadurairaju/Module7-Final-Assignment-Analysis/tree/main/Data)

#### The Number of Retiring Employees by Title

Below output table shows the number of employees retiring in each title of the Jobs in the company. 

![Deliverable1_pic](https://github.com/saranyadurairaju/Module7-Final-Assignment-Analysis/blob/main/Deliverable1_pic.png)

* The total number of Retiring Employees is 90398, which can be found using **SELECT SUM(count) FROM retiring_titles** query.

* In the total numbers, Senior Engineer & Senior Staff are the most number of Retiring Employees and there are very less managers.

#### The Employees Eligible for the Mentorship Program

Below output table shows the first 10 employee details who are eligible for mentorship_programs.

![Deliverable2_pic](https://github.com/saranyadurairaju/Module7-Final-Assignment-Analysis/blob/main/Deliverable2_pic.png)

* The total number of Employees eligible for mentorship program is 1549 which can be found using **SELECT count(emp_no) from mentorship_eligibility** query.

* In all those employees, the joining date (from_date) is varying from the year 1985 to 2002.

## Challenges

If we compare the expected challenge output table and the Mentorship_eligibility table, the **title** for Employee number **10762 is Senior Staff instead of Staff** and for **12155 Senior Engineer instead of Engineer**. But as per the titles database it has to Senior Staff & Senior Engineer as these are the current titles for them. 

![image](https://user-images.githubusercontent.com/85472349/127816718-2351eaf4-f284-416a-9032-59da231023a5.png)

![image](https://user-images.githubusercontent.com/85472349/127817449-31129658-7353-478b-97b4-b906fc3093af.png)

Also, i made sure to include the latest title in mentorship_eligibility table with my query. So, if there is any change in title then its because of their current title. 


## Summary

### Comparing the Mentoring & Retiring Employees:

We have total of 90398 retiring employees and 1549 mentoring employees. Using the below query we can find number of mentoring employees in each title. So that it will be easy to identify the ratio and allocate the new employees under each mentoring employees. 


![image](https://user-images.githubusercontent.com/85472349/127817871-499198c2-c282-4b94-a400-60b264af9e07.png)


So, if we compare each title there are almost the same ratio of employees available for mentoring.
 
 
![image](https://user-images.githubusercontent.com/85472349/127819028-3ab104bc-42a9-4fd9-a6da-687787be2caa.png)


### Manager position replacement or Mentoring:

In the above results, there are no managers available to give mentorship for the upcoming employees. Using the below query we can find the retiring managers departments:


![image](https://user-images.githubusercontent.com/85472349/127819690-81a68ca0-0085-4de0-a1f8-c6030009e3af.png)


But there are many senior employees available in that departments, which we are trying to find from the deparment employees table who joined in the year "1988".


![image](https://user-images.githubusercontent.com/85472349/127821054-6c7f4166-d069-455a-bf6c-1a75faa117a4.png)


From the above research its clear that some existing senior employee can help the new upcoming manager in Sales and Research departments. 





_Bobby and team has done a perfect Employee Analysis and helped **Pewlett-Hackard** to handle the upcoming employee shortage and give a better **Retirement package & Mentorship programs** to their Employees. Hurry!_

