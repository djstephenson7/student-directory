# Student array
students = [
"Dr. Hannibal Lecter", "Darth Vader", "Nurse Ratched",
"Michael Corleone", "Alex DeLarge", "The Wicked Witch of the West",
"Terminator", "Freddy Krueger", "The Joker", "Joffrey Baratheon",
"Norman Bates"
]

#Print total number of students
puts "The students of Villains Academy"
puts "----------"

students.each do |student|
  puts student
end

print "\n"
puts "Overall, we have #{students.count} great students."
