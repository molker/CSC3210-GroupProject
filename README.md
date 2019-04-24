# CSC3210-GroupProject :computer:
> Contributors: Matthew Olker, Spencer Peters, Chad Sigmon, Rahul 
> 
> This is the final group project for the CSC3210 class, involving making a database with multiple tables and multiple attributes per table to show and understanding of database design. 
### Topic: Sports :football:
* Because of the need to have many different tables that make sense to be apart, we chose football specifically because it is something Spencer understands and it is something we can effectively split into many tables without it seeming meaningless. It also allows for different types of relationships that will show we understand database design and the basics of mySQL.
* Tables
	* Divisions
	* Teams
	* Seasons
	* Sponsors
	* Members
	* Coaches
	* Players
	* Owners
	* Statistics
### Business Rules
* Divisions to Teams:
	* One team belongs to one division
	* One division has many teams
* Teams to Schedule: 
	* A team is assigned a schedule
	* Each schedule is assigned to a team 
* Teams to Sponsors:
	* One team is sponsored by many sponsors 
	* One sponsor sponsors a team 
* Teams to Members:
	* One team includes many members
	* Each member is included in a team
* Member to Players:
	* A member can be a Player 
	* A Player is a Member 
* Players to Statistics:
	* A player has many statistics 
	* Many statistics are made by a player
* Members to Owners:
	* A member can be an owner 
	* Each owner is a member
* Members to Coaches:
	* A member can be a coach 
	* Each coach is a member 
* Coaches to Coaches:
	* Many coaches (assistant) can report to a coach (head)
	* A coach can not report to anyone (head coach) 

### Normalization Process
<!-- if parts aren't normalized, state why -->
### Entity Relationship Diagram
![Football_ERD](football_db.png)