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
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is #{name}'s height in cm?"
    height = gets.chomp
    puts "What is #{name}'s country of birth?"
    country = gets.chomp
    puts "And what are their hobbies?"
    hobbies = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: hobbies,\
      country: country, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
