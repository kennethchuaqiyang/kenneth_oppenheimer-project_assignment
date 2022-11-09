# To deploy

# Ensure project is running

# git clone https://github.com/strengthandwill/oppenheimer-project-dev.git
# java -jar <directory_to_jar>/OppenheimerProjectDev.jar

# Copy the repository for test case and deploy

# git clone https://github.com/kennethchuaqiyang/kenneth_oppenheimer-project_assignment.git

# On terminal, run
# source ./deploy

# Report will be in results folder under report.html

# Notable Bugs From Testing
# 1) Governors can deploy cash when there are no heroes. It causes the test case to crash
# 2) When Clerk try to use an invalid path to upload the file through the api call, it will cause system to     crash. Thus it is skipped
# 3) Clerk can upload invalid gender like 1 for heroes from frontend and api call. Thus the test cases related will fail
# 4) Clerk can upload negative salary from frontend and api call. Thus the test cases related will fail
# 5) Clerk can upload 5dp salary from frontend and api call. Thus the test cases related will fail
# 4) Clerk can upload negative tax from frontend and api call. Thus the test cases related will fail
# 5) Clerk can upload 5dp tax from frontend and api call. Thus the test cases related will fail
# 6) If Clerk try to upload national id less than 4 character from front end and api call, it will cause the server to crash. The test case is skipped but need to be reported
# 7) System can allow duplicated national id to be uploaded. Thus the test case failed
# 8) When no gender is uploaded, it may cause the system to crash momentarily. The test case is skipped but need to be reported
