@students = [] # an empty array accessible to all methods

# let's put all students into an array
def print_header
  puts "The students of Villains Academy"
  puts "---------------------------------------"
end
def print(students)
  students.each { |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort):".center(45)
  puts "Country of Birth: #{student[:country]}".center(45)
  puts "Height: #{student[:height]}cm".center(45)
  puts "#{student[:name]}'s hobbies include - #{student[:hobbies]}".center(45)
  puts "\n"}
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names and cohorts of the students, separated by a comma"
  puts "To finish, just hit return twice"
  #create an empty array
  #students = []
  # get the first name
  input = gets.chomp
  while !input.include?(",")
    puts "typo! - please include a comma to separate name and cohort"
    input = gets.chomp
  end
  name = input.split(",")[0]
  cohort = input.split(",")[1].to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is #{name}'s height in cm?"
    height = gets.chomp
    puts "What is #{name}'s country of birth?"
    country = gets.chomp
    puts "And what are their hobbies?"
    hobbies = gets.chomp
    # add the student hash to the array
    @students << {name: name, cohort: cohort, hobbies: hobbies,\
      country: country, height: height}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = gets.chomp
  end
end

#nothing happens until we call the methods
def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "9. Exit" # 9 because we'll be adding more item
end

def show_students
        print_header
	print(@students)
	print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
	loop do
    		print_menu
    		process(gets.chomp)
  	end
end
interactive_menu
