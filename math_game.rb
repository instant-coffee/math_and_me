require 'pry'

@player = {
  name: '',
  lives: 3,
}
@player2 = {
  name: '',
  lives: 3,
}


def next_player
  if @current_player == @player
    @current_player = @player2     
  else 
    @current_player = @player
  end  
end


def get_name
  puts "what is your name Player ?"
  gets.chomp 
end


def random_question
  num1 = Random.rand(1...20)
  num2 = Random.rand(1...20)
  ans = num1 + num2
  
  puts "#{@current_player}, what is the product of #{num1} + #{num2}?"
  user_ans = gets.chomp.to_i 
    if user_ans == ans
      puts "#{@current_player}, Thats correct!"
    else
      puts "#{@current_player} loses a life"
      @current_player[:lives] -= 1 
      if @current_player[:lives] == 0

          puts "Game over man! Game over!"
          ##END GAME##
      end
    end
end


def main 

  @player[:name] = get_name
  @player2[:name] = get_name

   next_player

  until @player[:lives] == 0 || @player2[:lives] == 0 do
    random_question
    next_player
  end
end

main 


