* [x] Url to your Jenkins instance (if login credentials are needed and your repo is public please send them as comments in Canvas)
* http://ec2-34-242-134-154.eu-west-1.compute.amazonaws.com:8080

* [x] Url to your live TicTacToe instance
* http://ec2-52-214-241-244.eu-west-1.compute.amazonaws.com/8080

* [x] Public Url to your Datadog
* https://p.datadoghq.com/sb/e505ae913-614b8f5279
* [x] List of things you finished / did not finish (with comments):
  * [x] Completed the migrations needed for the application to work
    * Two tables cataloguing the sequence of commands received and events dispensed from the server were created. An extra migration script for adding a column for aggregate_id in the event log was added. The script is also capable of undoing any changes made.
  * [x] On Git push Jenkins pulls my code and the Tic Tac Toe application is deployed through a build pipeline, but only if all my tests are successful
  * [x] Filled out the `Assignments:` for the API and Load tests
    * The comments are found in assignment.md found in /apitest
  * [x] The API and Load test run in my build pipeline on Jenkins and everything is cleaned up afterwards
  * [x] My test reports are published in Jenkins
  * [x] My Tic Tac Toe game works, two people can play a game till the end and be notified who won.
    * Notifying the winning player is yet to be implemented.
  * [x] My TicCell is tested
  * [x] I've set up Datadog
	* I did not manage to fulfill one of the final requirements for datadog. The rest of the requirements
	were fulfilled.
