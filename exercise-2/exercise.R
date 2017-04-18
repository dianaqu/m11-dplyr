# Exercise 2: Data Frame Practice with `dplyr`.
# Use a different appraoch to accomplish the same tasks as exercise-1

# Install devtools package: allows installations from GitHub
install.packages('devtools')

# Install "fueleconomy" package from GitHub
devtools::install_github("hadley/fueleconomy")

# Require/library the fueleconomy package
library(fueleconomy)
# Install (if you haven't already) and load the `dplyr`package
install.packages('dplyr')
library(dplyr)

# You should have have access to the `vehicles` data.frame


# Create a data.frame of vehicles from 1997
cars.1997 <- filter(vehicles, year == 1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
unique(cars.1997$year)

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two.wheel.drive <- filter(vehicles, drive == '2-Wheel Drive', cty > 20)
View(two.wheel.drive)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
wrost.hwy <- select(filter(two.wheel.drive, hwy == min(hwy)), id)

# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MakeYearFilter <- function(my.year, my.make) {
  #result <- filter(vehicles, year == my.year, make == my.make, hwy == max(hwy))
  filtered <- filter(vehicles, year == my.year, make == my.make)
  result <- filter(filtered, hwy == max(hwy))
  return (result)
}

# What was the most efficient honda model of 1995?
MakeYearFilter(1995, 'Honda')

