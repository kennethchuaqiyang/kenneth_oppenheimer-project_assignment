-----
```
Instruction to  deploy

Step 1: Ensure oppenheimer project is running</ins>

1. git clone https://github.com/strengthandwill/oppenheimer-project-dev.git
2. java -jar <directory_to_jar>/OppenheimerProjectDev.jar
```
-----
```
Step 2: Copy the repository for test case and deploy</ins>

1. git clone https://github.com/kennethchuaqiyang/kenneth_oppenheimer-project_assignment.git
2. On terminal, run
3. source ./deploy
4. Report will be in results folder under report.html
```
-----
```
<ins> **Notable Bugs From Testing**</ins>

1. Governors can deploy cash when there are no heroes. It causes the test case to crash
2. When Clerk try to use an invalid path to upload the file through the api call, it will cause system to     crash. Thus it is skipped
3. Clerk can upload invalid gender like 1 for heroes from frontend and api call. Thus the test cases related will fail
4. Clerk can upload negative salary from frontend and api call. Thus the test cases related will fail
5. Clerk can upload 5dp salary from frontend and api call. Thus the test cases related will fail
6. Clerk can upload negative tax from frontend and api call. Thus the test cases related will fail
7. Clerk can upload 5dp tax from frontend and api call. Thus the test cases related will fail
8. If Clerk try to upload national id less than 4 character from front end and api call, it will cause the server to crash. The test case is skipped but need to be reported
9. System can allow duplicated national id to be uploaded. Thus the test case failed
10. When no gender is uploaded, it may cause the system to crash momentarily. The test case is skipped but need to be reported
```
-----
