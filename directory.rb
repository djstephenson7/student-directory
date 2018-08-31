def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  until name.empty? do
    students << {name: name, cohort: :November, country_of_birth: :UK}
    puts "Now we have #{students.count} students"
    name = gets.chomp
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
  puts "Overall, we have #{students.count} great students".center(80)
end

students = input_students
print_header
print(students)
print_footer(students)
