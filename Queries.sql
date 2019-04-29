/* Finding the cost of the Ravens Team*/
# 1. 
SELECT CONCAT("$", FORMAT(O.OWNER_BUYPRICE,2)) AS "Ravens Buy Price"
FROM owners AS O 
JOIN members AS M ON O.MEMBER_NUM = M.MEMBER_NUM 
JOIN teams AS T ON T.TEAM_CODE = M.TEAM_CODE
WHERE TEAM_NAME = "Ravens";

/* Counting the number of players in the CowBoys Team*/
# 2. 
SELECT COUNT(PLAYER_NUM )
       FROM Players AS P JOIN Members AS M ON P.MEMBER_NUM = M.MEMBER_NUM 
         JOIN Teams AS T ON T.TEAMCODE = M.TEAM_CODE
            WHERE TEAM_NAME = 'Cowboys';


 
