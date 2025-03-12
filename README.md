# Project: Periodic Table  

This project involved improving and extending an initial database containing information about chemical elements and developing Bash scripts to interact with it dynamically. The task was divided into three main parts:  

## 1. Database Correction and Improvement  

- **Database Structure and Data Updates:**  
  Several adjustments were made to the database to correct errors and improve data integrity. Key modifications include:  
  - Renaming columns (e.g., changing *weight* to *atomic_mass* and adjusting the names of the melting and boiling point columns to include "celsius").  
  - Adding *NOT NULL* and *UNIQUE* constraints on key columns such as *symbol* and *name*.  
  - Establishing relationships between tables using foreign keys to ensure referential integrity between the *elements* table and the *properties* table.  
  - Creating an additional table (*types*) to classify elements as nonmetals, metals, or metalloids and linking it correctly to the properties table.  
  - Correcting the capitalization of element symbols and ensuring the accuracy of atomic mass values.  

- **Specific Data Updates:**  
  Additional elements (such as Fluorine and Neon) were added, and inconsistent data (e.g., atomic_number 1000) was removed to ensure the database accurately reflects chemical information.  

## 2. Version Control with Git  

- **Repository Initialization:**  
  A Git repository was created in the project directory following best commit practices. The first commit was labeled "Initial commit," and subsequent commits used descriptive prefixes such as *fix:*, *feat:*, and others.  

- **Organization and Documentation:**  
  The repository is structured clearly to facilitate understanding and maintenance, which is essential for integration into a professional portfolio.  

## 3. Bash Script Development  

- **Query Script Functionality:**  
  A script called **element.sh** was developed to accept an atomic number, symbol, or element name as an argument. When executed, the program queries the database and returns relevant information about the element, such as its name, symbol, category, atomic mass, melting point, and boiling point in degrees Celsius.  
  - **Handling Special Cases:**  
    The script is designed to:  
    - Prompt for an argument if none is provided.  
    - Clearly inform the user when the requested element is not found in the database.

- Additionally, the atomic_mass.sh script was included to correct the values ​​in the atomic_mass column of the properties table. This script uses the atomic_mass.txt file to update the data in the database, removing the zeros to the right of the decimal point.

## Execution and Access to Scripts  

The **element.sh** file is located at `project/periodic_table/element.sh`. To execute it, follow these steps:  

1. Open the terminal and navigate to the project directory:  
   ```bash
   cd project/periodic_table
   ```  
2. Ensure the script has execution permissions:  
   ```bash
   chmod +x element.sh
   ```  
3. Run the script by passing the atomic number, symbol, or name of an element as an argument. For example:  
   ```bash
   ./element.sh 1
   ```  
   This should display information about the corresponding element.  

## Learnings and Conclusions  

This project allowed me to deepen my knowledge of relational database management with PostgreSQL, as well as creating Bash scripts to automate tasks and manage user interactions. Additionally, I reinforced concepts such as the use of primary and foreign keys, database normalization, and data manipulation through SQL queries.  

This system is a basic but functional example of how a periodic table database can be managed. It has potential for future expansion, including integration with graphical interfaces, advanced queries, or the addition of more chemical properties.  

*A project completed as part of the freeCodeCamp.org Relational Database Certification.*
