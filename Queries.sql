/* Finding the cost of the Ravens Team*/
 SELECT OWNER_BUYPRICE
       FROM Owners AS O JOIN Members AS M ON O.MEMBER_NUM = M.MEMBER_NUM 
          JOIN Teams AS T ON T.TEAM_CODE = M.TEAM_CODE
             WHERE TEAM_NAME = 'Ravens';

/* Counting the number of players in the CowBoys Team*/
 SELECT COUNT(PLAYER_NUM )
       FROM Players AS P JOIN Members AS M ON P.MEMBER_NUM = M.MEMBER_NUM 
         JOIN Teams AS T ON T.TEAMCODE = M.TEAM_CODE
            WHERE TEAM_NAME = 'CowBoys';

/* Displaying the players in the team that are in California*/
 SELECT PLAYER_NUM
      FROM   
 
