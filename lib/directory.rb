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
  input = STDIN.gets.chomp
  while !input.include?(",")
    puts "typo! - please include a comma to separate name and cohort"
    input = STDIN.gets.chomp
  end
  name = input.split(",")[0]
  cohort = input.split(",")[1].to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is #{name}'s height in cm?"
    height = STDIN.gets.chomp
    puts "What is #{name}'s country of birth?"
    country = STDIN.gets.chomp
    puts "And what are their hobbies?"
    hobbies = STDIN.gets.chomp
    # add the student hash to the array
    @students << {name: name, cohort: cohort, hobbies: hobbies,\
      country: country, height: height}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

#nothing happens until we call the methods
def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
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
  when "3"
	save_students
  when "4"
  	load_students
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
	loop do
    		print_menu
    		process(STDIN.gets.chomp)
  	end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each { |student|
		student_data = [student[:name], student[:cohort], student[:height],\
		  student[:country] ,student[:hobbies]]
		csv_line = student_data.join(",")
	file.puts csv_line}
	file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
	filename = ARGV.first # first argument from the command line
	return if filename.nil? # get out of the method if it isn't given
	if File.exists?(filename) # if it exists
		load_students(filename)
		puts "Loaded #{@students.count} from #{filename}"
	else # if it doesn't exist
		puts "Sorry, #{filename} doesn't exist."
		exit # quit the program
	end
end

try_load_students
interactive_menu
