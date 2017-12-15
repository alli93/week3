# Day 11

## tictactoe.loadtest.js
It was necessary to lower the original parameters. I found 15 chat messages within one second along
with 8 games played within the same timeframe to fit a nice margin of success.

## test-api.js
The function found within the test api routes a cleanDatabase command through the commandRouter. This command is then received by the database backdoor in the server. Upon receiving, the backdoor will connect
with the database pool and proceed to empty the command and event logs. Upon
finishing that process, the backdoor will send a databaseCleaned event through the 
event router which will get picked up by the test api to let it know the database was successfully cleaned.

## user-api.js
The stack framework used is meant for the application to handle the sequence of events and commands between it's users in an asynchronous manner. Without it, users will perceive events out of order.

## tictactoe-game-player.js
The sequential code mimics asynchronisity by use of the then() function found within the user api. It makes a call to the nodejs setTimeOut function which allows other operations to execute while waiting on a timer. A creates the game, expects a game created even and waits for that event with a call to then(). Afterwards he makes a call to playOSide(). In that function player B begins operations by expecting some events, notably a move made by player A, before sending a joinGame command immediately followed by a call to then() where he waits to receive the events he's expecting. Since player B was operating in a separate function, the setTimeout call frees A to continue execution. So when A sends a move command, B finally has an opportunity to escape the waiting loop and proceed with his execution.


I managed to produce a load test failure by switching function calls in line 41. My guess is that this because he received a gameJoined event before he makes the necessary preparations to expect it. In this case he will simply deadlock, waiting for an event he's already received and will not receive again.