## Toy Robot Simulator

Code test.

Problem description can be found in CodeTest-Robot.pdf

#### Environment Details

Ruby 1.9.3  
RSpec 2.14.7  

'bundle install' is your friend. 

#### Instructions

To see the code run:

1. cd to Code folder
2. ruby run_robot_app.rb file-1 {file-2 .. file-n} Minimum of 1 file, up to n number of files.

Please see the below list for details about the various test data files

1. test-1 Starts the robot at 0,0 then runs it fully around the perimeter including various turns and attempts to run off the edges.
1. test-2 Starts the robot at 0,0 then runs many places. At the end, a move off an edge is attempted followed by another place.
1. test-3 Demonstrates the robot ignoring instructions and a bad place until a valid place is processed. After that, a bad place results in no changes to the robot.

#### Notes and Assumptions

1. I have assumed that if there is an invalid command in the commands file, the whole lot will be rejected.
1. Specifically with regards to PLACE, PLACE -1, 0, NORTH would cause a rejection as negative numbers are deemed invalid. PLACE 100, 100, SOUTH would be accepted as valid syntax, but will be skipped by the robot as a bad place.

#### Issues & Further Learning

1. How do you decouple functions that seem to be reliant on each other without making things public just for testing?  
Eg. robot.place(), robot.report(). place() is best tested by running a report(), report is best tested by running a place().

1. Bundler and Gemfiles seem to be a really cool system for verifying
installing an environment to run your app in. Have to look into this more.

1. Have to check out the Test::Unit and compare contrast with RSpec. Is there any particular one that is 'more' populer/used in general?
