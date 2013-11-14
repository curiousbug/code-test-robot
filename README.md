## Toy Robot Simulator

Code test.

Problem description can be found in CodeTest-Robot.pdf

#### Environment Details

Ruby 1.9.3  
RSpec 2.14.7  

#### Issues & Further Learning

How do you decouple functions that seem to be reliant on each other without making things public just for testing?  
Eg. robot.place(), robot.report(). place() is best tested by running a report(), report is best tested by running a place().