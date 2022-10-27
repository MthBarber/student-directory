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
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.chomp
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

def process(selection)
  case selection
    when "1"
      input_students
      #input the students
    when "2"
      show_students
      # show the students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit # This will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end  
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student| 
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name,cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


interactive_menu

