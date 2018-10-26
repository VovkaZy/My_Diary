# My Diary is a console based version of handwritten diary book
# ver.: 0.9, read from console and wright to file with adding date and time
# wiki: https://en.wikipedia.org/wiki/Diary
# Created by v.n.zubarev@gmail.com on 23/10/18
puts 'Hi, my dear friend! I am your closest friend. My name is Diary'
puts 'Tell me, as a closest friend, everything you want to tell'
puts 'I will save all words till the word \'close\' in a file for you'
puts '=============================================================='

current_path = File.dirname(__FILE__)

line = nil
all_lines = []

# Until user enter 'close' word, program will adding all lines to array
while line != 'close'
  line = STDIN.gets.encode('UTF-8').chomp
  all_lines << line
end

# creating an instance of Time class
time = Time.now
# date format - 2018-10-23
file_name = time.strftime('%Y-%m-%d')
# time format - 21:47
time_string = time.strftime('%H:%M')
separator = '-----------------------------------------------------'

# creating an instance of File class named as creating date
# in diary dir with .txt format and UTF-8 encoding
# adding time stamp at the start of new record and separator at the end
file = File.new(current_path + '/diary/' + file_name + '.txt', 'a:UTF-8')
file.print("\n\r" + time_string + "\n\r")

all_lines.pop
all_lines.each { |item| file.puts(item) }

file.puts(separator)
file.close

puts '...'
puts "Thank you, my friend! I've save all your story to the #{file_name}.txt"
puts "Time now: #{time_string}"
