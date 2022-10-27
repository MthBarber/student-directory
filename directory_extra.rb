#puts students in an array

def print_header
  puts "The students of Villains Academy"
  puts "----------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_map(students)
  sorted_by_cohort = {}
  students.map{ |student|
    if sorted_by_cohort[student[:cohort]] == nil
      sorted_by_cohort[student[:cohort]] = []
    end
    
    sorted_by_cohort[student[:cohort]].push(student[:name])
  }
  puts sorted_by_cohort
end

def print_2(students)
  i = 0
  while i < students.length do
    puts "#{students[i][:name]} age: #{students[i][:age]} interests: #{students[i][:interests]} (#{students[i][:cohort]} cohort)".center(150)
    i += 1
  end
end

def print_first_letter(students)
  students.each_with_index do |student,index|
    if student[:name][0] == "m"
      puts "#{index + 1 }. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_short_names(students)
  students.each_with_index do |student,index|
    if student[:name].length < 12
      puts "#{index + 1 }. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students_2
  puts "Please enter the names, ages and hobbies of the students"
  puts "To finish, just hit return 3 times"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  age = gets.chomp
  interests = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, age: age, interests: interests, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
    age = gets.chomp
  interests = gets.chomp
  end
  #return the array of students
  students
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.gsub(/\n/, "")
  cohort = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? || !cohort.empty? do
    if name == ""
      name = "Bad person"
    end
    if cohort == ""
      cohort = :november
    end
    students << {name: name, cohort: cohort.to_sym}
    students.length < 2 ? (puts "We have #{students.length} great student") : (puts "We have #{students.length} great students") 
    
    #get another name from the user
    name = gets.chomp
    cohort = gets.chomp
  end
  #return the array of students
  students
end

students = input_students
print_header
print(students)
print_footer(students)

