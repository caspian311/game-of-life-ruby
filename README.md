#Game of Life#
This is the Ruby version that I wrote to help my practice my Ruby skills.

###Install dependencies###
Mainly just *rspec* for tests and *curses* for console writing.

    bundle

###Run tests###

Tried my best to do this *TDD*...

    bundle exec rspec
    
###Start the game###

There's a shell script to handle parameters passed in and starts up the script.

    ./bin/gol.sh <iterations> <path-to-seed-file>
    
For example:

    ./bin/gol.sh 20 test_files/pulsar_example.txt
    
There's a couple other example of seed files in the *test_files* folder.


##Enjoy!##