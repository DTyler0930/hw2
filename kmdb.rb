# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Actor.destroy_all
Movie.destroy_all
Role.destroy_all
Studio.destroy_all


# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

### STUDIO ###

new_studio = Studio.new
new_studio["name"] = "Warner Bros"
new_studio.save

### MOVIES ###
studio = Studio.find_by({"name" => "Warner Bros"})

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["release year"] = "2005"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = studio["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["release year"] = "2008"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = studio["id"]
new_movie.save

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["release year"] = "2012"
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = studio["id"]
new_movie.save

### ACTORS ###

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Liam Neeson"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Tom Hardy"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Joseph Gordon-Levitt"
new_actor.save
new_actor = Actor.new
new_actor["name"] = "Anne Hathaway"
new_actor.save

### ROLE ###
movie_1 = Movie.find_by({"title" => "Batman Begins"})
movie_2 = Movie.find_by({"title" => "The Dark Knight"})
movie_3 = Movie.find_by({"title" => "The Dark Knight Rises"})

actor_1 = Actor.find_by({"name" => "Christian Bale"})
actor_2 = Actor.find_by({"name" => "Michael Caine"})
actor_3 = Actor.find_by({"name" => "Liam Neeson"})
actor_4 = Actor.find_by({"name" => "Katie Holmes"})
actor_5 = Actor.find_by({"name" => "Gary Oldman"})
actor_6 = Actor.find_by({"name" => "Heath Ledger"})
actor_7 = Actor.find_by({"name" => "Aaron Eckhart"})
actor_8 = Actor.find_by({"name" => "Maggie Gyllenhaal"})
actor_9 = Actor.find_by({"name" => "Tom Hardy"})
actor_10 = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
actor_11 = Actor.find_by({"name" => "Anne Hathaway"})


# Batman Begins #
new_role = Role.new
new_role["name"] = "Bruce Wayne"
new_role["movie_id"] = movie_1["id"]
new_role["actor_id"] = actor_1["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Alfred"
new_role["movie_id"] = movie_1["id"]
new_role["actor_id"] = actor_2["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Ra's Al Ghul"
new_role["movie_id"] = movie_1["id"]
new_role["actor_id"] = actor_3["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Rachel Dawes"
new_role["movie_id"] = movie_1["id"]
new_role["actor_id"] = actor_4["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Commissioner Gordon"
new_role["movie_id"] = movie_1["id"]
new_role["actor_id"] = actor_5["id"]
new_role.save

# The Dark Knight  #
new_role = Role.new
new_role["name"] = "Bruce Wayne"
new_role["movie_id"] = movie_2["id"]
new_role["actor_id"] = actor_1["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Joker"
new_role["movie_id"] = movie_2["id"]
new_role["actor_id"] = actor_6["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Alfred"
new_role["movie_id"] = movie_2["id"]
new_role["actor_id"] = actor_2["id"]
new_role.save


new_role = Role.new
new_role["name"] = "Harvey Dent"
new_role["movie_id"] = movie_2["id"]
new_role["actor_id"] = actor_7["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Rachel Dawes"
new_role["movie_id"] = movie_2["id"]
new_role["actor_id"] = actor_8["id"]
new_role.save

# The Dark Knight Rises  #
new_role = Role.new
new_role["name"] = "Bruce Wayne"
new_role["movie_id"] = movie_3["id"]
new_role["actor_id"] = actor_1["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Commissioner Gordon"
new_role["movie_id"] = movie_3["id"]
new_role["actor_id"] = actor_5["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Bain"
new_role["movie_id"] = movie_3["id"]
new_role["actor_id"] = actor_9["id"]
new_role.save

new_role = Role.new
new_role["name"] = "John Blake"
new_role["movie_id"] = movie_3["id"]
new_role["actor_id"] = actor_10["id"]
new_role.save

new_role = Role.new
new_role["name"] = "Selina Kyle"
new_role["movie_id"] = movie_3["id"]
new_role["actor_id"] = actor_11["id"]
new_role.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
for movie in Movie.all
    title = movie["title"]
    year = movie["release year"]
    rated = movie["rated"]
    studio = Studio.find_by({"id" => movie["studio_id"]})

    puts "#{title} #{year} #{rated} #{studio["name"]}"
end
# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

### LOOP ###
roles = Role.all
actors = Actor.all
for role in roles
    movie_id = Movie.find_by({"id" => role["movie_id"]})
    actor_id = Actor.find_by({"id" => role["actor_id"]})
    movie_title = movie_id["title"]
    actor_name = actor_id["name"]
    actor_role = role["name"]

    puts "#{movie_title} #{actor_name} #{actor_role}"
end
