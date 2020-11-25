class Game
  def initialize(array_numbers)
    @array_numbers = array_numbers
    @answers_right = 0
    @answers_wrong = 0
  end

  def input_and_count(number1, number2)
    answer_computer = number1 * number2
    answer_user = Thread.new do
      puts "\n Сделай умножение #{number1} * #{number2} ?"
      Thread.current[:value] = STDIN.gets.to_i
    end
    Thread.new do
      10.times{|i| STDOUT.write "\r#{i} --> "; sleep 1}
      answer_user.kill
    end
    answer_user.join
    if answer_user[:value] == answer_computer
      puts 'Верно!'
      @answers_right += 1
    elsif puts "Неверно, правильный ответ #{answer_computer}"
      @answers_wrong += 1
    else
      puts 'Время вышло!'
      @answers_wrong += 1
    end
  end

  def play_game_all_number(quantity)
    count = 1
    until count > quantity
      count += 1
      number1 = @array_numbers.sample
      number2 = @array_numbers.sample
      input_and_count(number1, number2)
    end
  end

  def play_game_column(column_number)
    number1 = column_number
    @array_numbers.shuffle.each do |number2|
      input_and_count(number1, number2)
    end
  end

  def result
    puts "Вы дали правильных ответов #{@answers_right}"
    puts "Вы дали неверных ответов #{@answers_wrong}"
  end
end
