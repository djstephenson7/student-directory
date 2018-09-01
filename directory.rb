def input_students
  puts "Please enter the names of the students, and then the cohort they're in."
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  cohort = gets.chomp.to_sym
  while !name.empty? do
    students << {name: name, cohort: cohort, country_of_birth: :UK}
    puts "Name"
    name = gets.chomp
    puts "Please enter cohort"
    cohort = gets.chomp.to_sym
    if cohort.empty?
      cohort = "Remote"
    end
    if students.count == 1
      puts "Now we have #{students.count} student."
    else
      puts "Now we have #{students.count} students."
    end
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(80)
  puts "--------------------------------".center(80)
end

def print(students)
  students.map.with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) (Country of Birth: #{student [:country_of_birth]})".center(80)
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great students"[0...-1].center(80)
  else
  puts "Overall, we have #{students.count} great students".center(80)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
