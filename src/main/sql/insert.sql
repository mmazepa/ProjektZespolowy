-- z założenia lepiej by ich nie zmieniać
INSERT INTO Role (RoleName) VALUES ('Administrator');
INSERT INTO Role (RoleName) VALUES ('Moderator');
INSERT INTO Role (RoleName) VALUES ('User');

-- konto dla testowania
INSERT INTO Account (AccountRole, NickName, Email, UserPass, FirstName, LastName, DateOfBirth) VALUES (3, 'januszschabowy', 'typowyjanusz@gmail.com', 'janusz', 'Janusz', 'Schabowy', '1970-02-02');
INSERT INTO Account (AccountRole, NickName, Email, UserPass, FirstName, LastName, DateOfBirth) VALUES (3, 'plusio', 'pluszakmisiewicz@gmail.com', 'misiek', 'Pluszak', 'Misiewicz', '1971-05-02');
INSERT INTO Account (AccountRole, NickName, Email, UserPass, FirstName, LastName, DateOfBirth) VALUES (3, 'redpolishdevil', 'redpolishdevil@gmail.com', 'avesatan', 'Arkadiusz', 'Szatan', '1974-02-06');
INSERT INTO Account (AccountRole, NickName, Email, UserPass, FirstName, LastName, DateOfBirth) VALUES (2, 'jsliwa', 'sliwka@gmail.com', 'avesatan', 'Jedrzej', 'Sliwa', '1968-09-20');
INSERT INTO Account (AccountRole, NickName, Email, UserPass, FirstName, LastName, DateOfBirth) VALUES (1, 'jbrewiarz', 'brewiarz@gmail.com', 'avesatan', 'Jedrzej', 'Brewiarz', '1981-06-30');

-- grupka
INSERT INTO Workgroup (GroupName, GroupCreationDate, Description, IsPrivate) VALUES ('grupa1','2005-04-02','viva sql',1);

INSERT INTO Attendance (AttendingGroup, AttendingUser, IsGroupAdmin) VALUES (1,2,1);
INSERT INTO Attendance (AttendingGroup, AttendingUser, IsGroupAdmin) VALUES (1,4,0);
