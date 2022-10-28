#puts students in an array
@students = []

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print_students_list(students)
  if (students.length >= 1)
    students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "We currently have no students"
  end
end

def print_footer(students)
  puts "Overall, we have #{@students.length} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    push_to_students_array(name, cohort = :november, "input")
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
  #return the array of students
 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def main_menu(selection)
  case selection
    when "1"
      puts "You chose to add more students"
      input_students
      #input the students
    when "2"
      puts "You chose to view all current students"
      show_students
      # show the students
    when "3"
      puts "You chose to save the current list"
      save_students
    when "4"
      puts "Please choose a file to load"
      load_students
    when "9"
      exit # This will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end  
end

def save_students
  #get input from user to choose a file to write to
  puts "Please enter a file name including its type"
  filename = STDIN.gets.chomp
  #open the file for writing
  if File.exist?(filename)
    file = File.open("students.csv", "w")
    #iterate over the array of students
    @students.each do |student| 
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  else
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students()
  puts "Please enter a file name including its type"
  filename = STDIN.gets.chomp
  if File.exist?(filename)
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name,cohort = line.chomp.split(',')
      push_to_students_array(name, cohort, "load")
    end
    file.close
  else
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exist?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def interactive_menu
  loop do
    print_menu
    main_menu(STDIN.gets.chomp)
  end
end

def push_to_students_array(name, cohort, method)
  if (method == "load")
    @students << {name: name, cohort: cohort.to_sym}
  elsif (method == "input")
    @students << {name: name, cohort: cohort}  
  end
end

try_load_students

interactive_menu

