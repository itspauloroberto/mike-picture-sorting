# README

Ruby version: ruby-3.0.0
Rails version: v7.0.4

## Steps to run the solution

1. Open the rails console by typing `rails c` on the project root folder.

2. Assign a variable to use as the input data for the algorithm process it and produce the output. (e.g.: `input`)

3. Call the service using the following command informing the previously assigned input variable as initialization param. Or you can just replace input with the actual input string directly.
```
List::CreateService.new(input).call
```
4. The output will show up in the console.


## Notes about the challenge

I've created a non persistant entity for each Picture using ActiveModel which is in other words a database-less model entity like an ActiveRecord but without all the methods and database connection. I've done this for being able to access validators to make sure that the line input data is valid before actually processing a line. Also for being able to have an Class for each line with his own attributes free to use as i wish.

Also, inside the validations there was an custom validation that i made which validates if a city exists or not, so if you try to inform a non existant city in a specific line it will not process the line because it will consider the city not valid. (I've even needed to implement a helper because the gem didnt have the full city list to fact check directly, and i have opened a issue on the gem for that even.)

You can also try to inform a invalid photo name like without the extension it will also consider invalid.

I could have also implemented RSpec custom testing for non-database stuff, for edge cases and etc, but i just felt that's just too much for an simple processing string function which even do not persists on any database.
