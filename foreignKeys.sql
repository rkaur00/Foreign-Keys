create database todoList;    

use todoList;

CREATE TABLE projects ( 
            projectID int NOT NULL auto_increment, 
            projectName varchar(100)  NOT NULL, 
            PRIMARY KEY (projectID) 
          )   

CREATE TABLE todoItems ( 
            todoID int  NOT NULL auto_increment, 
           todoItem varchar(100)  NOT NULL, 
          dateCreated DATETIME NOT NULL DEFAULT NOW(), 
           todoStatus varchar(100), 
            projectID int NOT NULL, 
            PRIMARY KEY (todoID) 
          )   

ALTER TABLE projects ADD INDEX project_index(projectName);

ALTER TABLE projects  
          
ADD COLUMN projectDescription text not null AFTER projectName;  

ALTER TABLE todoItems ADD INDEX todo_index(todoItem);  

ALTER TABLE todoItems  
                    ADD FOREIGN KEY fk_project(`projectID`)  
                    REFERENCES projects (projectID) 
          ON UPDATE CASCADE ON DELETE RESTRICT;

INSERT INTO projects (projectName,`projectDescription`) 
          VALUES ('project1','It is also team project');  

INSERT INTO todoItems (todoItem, todoStatus,projectID) 
                    VALUES ('Development', 'false',2); 

UPDATE projects  
          SET projectDescription = 'Is must be completed now' 
          WHERE projectID = '2';
                                                         
