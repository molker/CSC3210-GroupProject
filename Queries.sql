/* Finding the cost of the Ravens Team*/
# 1. 
SELECT CONCAT("$", FORMAT(O.OWNER_BUYPRICE,2)) AS "Ravens Buy Price"
FROM owners AS O 
JOIN members AS M ON O.MEMBER_NUM = M.MEMBER_NUM 
JOIN teams AS T ON T.TEAM_CODE = M.TEAM_CODE
WHERE TEAM_NAME = "Ravens";

/* Counting the number of players in the CowBoys Team*/
# 2. 
SELECT COUNT(PLAYER_NUM) AS "Number of Players in Cowboys"
FROM players AS P 
JOIN members AS M ON P.MEMBER_NUM = M.MEMBER_NUM 
JOIN teams AS T ON T.TEAM_CODE = M.TEAM_CODE
WHERE TEAM_NAME = "Cowboys";

/* Displaying the first and last name of players of the team that are in California*/
# 3. 
SELECT M.MEMBER_FNAME AS "FirstName", M.MEMBER_LNAME AS "LastName"  
FROM members AS M
JOIN teams AS T ON M.TEAM_CODE= T.TEAM_CODE
WHERE TEAM_STATE='CA';
/* Counting the number of Sponsors that Patriots have, I could have done it without a join but figured using join would show that we have a better knowledge of using join*/
# 4.
SELECT COUNT(S.SPON_CODE) AS "Number of Sponsors for Patriots"
FROM sponsors AS S 
JOIN teams AS T ON S.TEAM_CODE = T.TEAM_CODE 
WHERE T.TEAM_CODE = 10               
/* Displaying all the teams that are in the NFC East   */                          
# 5. 
SELECT T.TEAM_NAME AS "Teams from the NFC East"
FROM teams AS T                          
JOIN divisions AS D ON T.DIV_CODE = D.DIV_CODE
WHERE D.DIV_CODE = "1" ;                         
 /* How many wins do the saints have */
# 6.
SELECT TEAM_NAME AS "Saints", TEAM_WINS AS "Wins for Saints" 
FROM teams 
WHERE TEAM_NAME = "Saints";
