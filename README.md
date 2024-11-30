Overview

This project is an individual effort to analyze and process IMDb datasets using Python and SQL. The dataset includes detailed information on movies, TV shows, ratings, and crew data. The project explores methods for cleaning, transforming, and visualizing large datasets, while also designing a database schema for managing movie-related information efficiently.

Objectives
Import and preprocess IMDb datasets using Python.
Perform data cleaning and handle missing or inconsistent values.
Design and implement a database schema in SQL.
Merge and analyze datasets to extract meaningful insights.
Create compelling visualizations to present findings effectively.
Project Components
1. Data Importing and Cleaning (Python)
Loaded IMDb data subsets using Pandas.
Replaced invalid or missing values (e.g., \N) with appropriate substitutes (NaN or derived values).
Converted data types (e.g., year columns to integers) for consistent processing.
Defined custom Python functions to automate data loading and cleaning for all IMDb files.
2. Database Schema Design (SQL)
Designed CREATE TABLE statements for each IMDb dataset, ensuring:
Proper data types for all fields (e.g., INT, VARCHAR, DATE).
Primary and foreign key relationships for normalized tables.
Constraints for data integrity and cascading DELETE/UPDATE rules.
SQL files contain well-documented statements and justifications for schema design choices.
3. Merging Datasets (Python)
Merged data from multiple IMDb datasets:
Combined ratings with movie titles.
Connected directors, genres, and crew information using appropriate keys.
Used INNER and LEFT joins for effective data integration.
Justified the merge strategies with detailed comments.
4. Filtering and GroupBy Operations (Python)
Performed various analyses on the data, including:

Counting movies by genre and release year.
Aggregating ratings and votes by genre and year.
Identifying the top directors and actors by movie count.
Exploring runtime averages for specific categories, such as short films.
5. Data Visualization (Python)
Created the following visualizations using Matplotlib, Seaborn, and Plotly:

Histogram of movie ratings.
Boxplots of ratings by genre.
Line chart showing movie release trends over time.
Bar chart of the most common genres.
Pie chart of movie distribution by region.
Scatterplot of start year vs. total votes.
Heatmap of genres vs. release years.
Bar chart of the top 10 directors with the most movies.
Tools and Libraries Used
Python:
Libraries: Pandas, NumPy, Matplotlib, Seaborn, Plotly
SQL:
Database design and query validation
Jupyter Notebook: For organizing and documenting Python code.
GitHub: For version control and project sharing.
Results
Insights:
The most popular genres and years for movies were identified.
Directors and actors with the most contributions were highlighted.
Visual trends showed shifts in movie production over time.
Database Schema:
A fully normalized schema was designed to store and manage IMDb data efficiently.
Data Cleaning:
Missing and inconsistent values were successfully handled, ensuring a clean dataset for analysis.
