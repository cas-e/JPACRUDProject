# JPACRUDProject

## Overview

A recipe database that allows CRUD operations. As of right now,
the database is modeled as a single table of recipe columns.

Users are guided through a form to add new recipes to the database,
and recipes are displayed as a series of cards on the main page.

Link to a live site demo is on the roadmap.

## Technologies Used

* Java
* JPA / Hibernate
* J-unit test framework
* MySQL / MySQL workbench
* Eclipse / SpringToolSuite
* Git

## Lessons Learned

In this project we got our first chance at modelling data in a SQL database.
We learned the syntax of a SQL file for creating a persistent storage, but
ultimately used MySQL workbench to generate this file for use. 

We also got practice in setting up tests for entities to make sure our
database connections are working properly. 

In addition we learned how to use JPA as a delegation layer between our application and the database. With JPA in the project, we spend more time working with our entity objects directly.

I think one skill I continue to develop here is one of coordinating lots of different tools together, which this project helped with. 