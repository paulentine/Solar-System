require_relative "planet"
require_relative "solar_system"

def main
  solar_system = SolarSystem.new("Sol")
  mercury = Planet.new("Mercury", "dark-gray", 3.285e23, 57.91e8, "The smallest planet in our solar system.")
  solar_system.add_planet(mercury)
  venus = Planet.new("Venus", "reddish-brown", 4.867e24, 67.24e8, "One day in Venus lasts 243 Earth days.")
  solar_system.add_planet(venus)
  earth = Planet.new("Earth", "blue-green", 5.972e24, 1.496e8, "Only planet known to support life.")
  solar_system.add_planet(earth)
  mars = Planet.new("Mars", "reddish", 6.39e23, 141.6e8, "The tallest mountain known in the solar system is on Mars.")
  solar_system.add_planet(mars)
  jupiter = Planet.new("Jupiter", "orange-white", 1.898e27, 483.8e8, "The fastest spinning planet in our solar system.")
  solar_system.add_planet(jupiter)

  solar_system.planets

  list = solar_system.list_planets

  input = 0
  while input != "e"
    puts "Thank you for using our solar system generator.
    Please select among the following options (A-E):
    [A] List planets
    [B] Planet details
    [C] Add planet
    [D] Calculate distance between two planets
    [E] Exit \n"
    input = gets.chomp.downcase
    case input
    when "a"
      puts "\nHere is a list of our planets:"
      puts "#{list}\n"
    when "b"
      puts "\nPlease type the name of the planet you'd like to learn about"
      puts list
      selected_planet = gets.chomp.downcase
      # Error handling for invalid planet name
      while solar_system.find_planet_by_name(selected_planet) == false
        puts "\nPlease type the name of the planet you'd like to learn about"
        puts list
        selected_planet = gets.chomp.downcase
      end
      puts "\n#{solar_system.find_planet_by_name(selected_planet).summary}\n\n"
    when "c"
      puts "What is the name of the planet you'd like to add?"
      usr_name = gets.chomp
      puts "What color is this planet?"
      usr_color = gets.chomp.downcase
      puts "What is its mass in kg?"
      usr_mass = gets.chomp.to_i
      # If 0 or less, will reprompt (string.to_i returns 0)
      while usr_mass < 1
        puts "That was not a valid mass. Please try again. What is its mass in kg?"
        usr_mass = gets.chomp.to_i
      end
      puts "How far is it from the sun in km?"
      usr_dist = gets.chomp.to_i
      while usr_dist < 1
        puts "That was not a valid distance. Please try again. How far is it from the sun in km?"
        usr_dist = gets.chomp.to_i
      end
      puts "Tell us one fun fact about this planet."
      usr_fact = gets.chomp
      usr_planet = Planet.new(usr_name, usr_color, usr_mass, usr_dist, usr_fact)
      solar_system.add_planet(usr_planet)
      # Updates list
      list = solar_system.list_planets
      puts "\nHere is a summary of planet #{usr_name}"
      puts "#{usr_planet.summary}\n\n"
    when "d"
      puts "\nPlease select the first planet out of this list:"
      puts list
      planet_one = gets.chomp.downcase
      puts "Please select the second planet:"
      planet_two = gets.chomp.downcase
      distance = solar_system.distance_between(planet_one, planet_two)
      puts "\nDistance between #{planet_one.capitalize} and #{planet_two.capitalize} is #{distance} km\n\n"
    when "e"
      puts "\nGoodbye!\n\n"
      break
    else
      puts "\nThat was not a valid input. Please try again.\n\n"
    end
  end
end

main
