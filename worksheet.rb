########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
### all data, driver, ride, date, cost, rider id, rating
# Which layers are nested in each other?
### all data > driver > rides > ride data (date, cost, rider id, rating).
# Which layers of data "have" within it a different layer?
### all data has drivers within it, 
### river has rides within it, 
### ride has 4 layers within it: date, cost, rider id, and rating
# Which layers are "next" to each other?
### date, cost, rider id, and rating are next to each other

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
### all data = hash
### driver = array
### ride = hash
### ride data = keys/values (date, cost, rider id, rating)

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

ride_data = {
    dr0001: [
            {
                date: "3rd Feb 2016",
                cost: 10,
                rider_id: "RD0003",
                rating: 3
            },
            {
                date: "3rd Feb 2016",
                cost: 30,
                rider_id: "RD0015",
                rating: 4
            },
            {
                date: "5th Feb 2016",
                cost: 45,
                rider_id: "RD0003",
                rating: 2
            }
        ],
        dr0002: [
            {
                date: "3rd Feb 2016",
                cost: 25,
                rider_id: "RD0073",
                rating: 5
            },
            {
                date: "4th Feb 2016",
                cost: 15,
                rider_id: "RD0013",
                rating: 1
            },
            {
                date: "5th Feb 2016",
                cost: 35,
                rider_id: "RD0066",
                rating: 3
            }
        ],
    dr0003: [
            {
                date: "4th Feb 2016",
                cost: 5,
                rider_id: "RD0066",
                rating: 5
            },
            {
                date: "5th Feb 2016",
                cost: 50,
                rider_id: "RD0003",
                rating: 2
            }
        ],
        dr0004: [
            {
                date: "3rd Feb 2016",
                cost: 5,
                rider_id: "RD0022",
                rating: 5
            },
            {
                date: "4th Feb 2016",
                cost: 10,
                rider_id: "RD0022",
                rating: 4
            },
            {
                date: "5th Feb 2016",
                cost: 20,
                rider_id: "RD0073",
                rating: 5
            }
        ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

# The number of rides each driver has given
puts "Total number of rides given: \n"

ride_data.each do |driver, ride_list|
  puts "Driver #{driver.upcase} drove #{ride_list.count} rides"
end

puts "\n"

# The total amount of money each driver has made
puts "Total earnings: \n"
ride_data.each do |driver, ride_list|
  earnings = 0

  ride_list.each do |ride|
    earnings += ride[:cost]
  end

  puts "Driver #{driver.upcase} made $#{earnings}"
end

puts "\n"

# The average rating for each driver
puts "Average ratings: \n"
ride_data.each do |driver, ride_list|
  total_rating = 0
  i = 0.0

  ride_list.each do |ride|
    total_rating += ride[:rating]
    i += 1
  end

  average_rating = total_rating / i

  puts "Driver #{driver.upcase}'s average rating was #{average_rating.round(2)}"
end

puts "\n"

# Which driver made the most money?
puts "Highest earner: \n"
highest_earnings = 0
highest_earner = nil

ride_data.each do |driver, ride_list|
  earnings = 0

  ride_list.each do |ride|
    earnings += ride[:cost]
  end

  if earnings > highest_earnings
    highest_earnings = earnings
    highest_earner = driver
  end
end

puts "Driver #{highest_earner.upcase} made the most money from rides at $#{highest_earnings}"

puts "\n"

# Which driver has the highest average rating?
puts "Highest rated: \n"
best_rating = 0
best_rated_driver = nil

ride_data.each do |driver, ride_list|
  total_rating = 0
  i = 0.0

  ride_list.each do |ride|
    total_rating += ride[:rating]
    i += 1
  end

  average_rating = total_rating / i

  if average_rating > best_rating
    best_rating = average_rating
    best_rated_driver = driver
  end
end

puts "Driver #{best_rated_driver.upcase} had the best average rating of #{best_rating.round(2)}"
