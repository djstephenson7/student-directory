@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
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
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now, we have #{@students.count} students."
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The Students of Villains Academy".center(80)
  puts "--------------------------------".center(80)
end

def print_student_list
  @students.map.with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(80)
  end
end

def print_footer
  puts  "Overall, we have #{@students.count} great students.".center(80)
end

def save_students
  file = File.open("students.csv", "w") #Opens the file for writing
  @students.each do |student| #Iterates over the array of students
    student_data  = [student[:name], student [:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first #First argument from the command line.
  return if filename.nil? #Get out of method if it isn't given.
  if File.exists?(filename) #If it exists.
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # If it doesn't exist.
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu