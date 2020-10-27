# v.3.1. Незначительные улучшения

array_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
require_relative 'lib/game'

puts "Как будем тренироваться
  1. На все числа
  2. Число выберу сам"

mode = STDIN.gets.to_i

if mode == 1
  puts 'Сколько примеров вам задать?'
  quantity = STDIN.gets.to_i
  game = Game.new(array_numbers)
  game.play_game_all_number(quantity)
else
  puts 'Выбери чило от 1 до 10'
  column_number = STDIN.gets.to_i
  game = Game.new(array_numbers)
  game.play_game_column(column_number)
end

game.result
