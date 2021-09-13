require_relative './player'

class Game

  def initialize
    @p1 = Player.new('Player1')
    @p2 = Player.new('Player2')
    @players = [@p1,@p2]
  end

  def question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @questioner = @players.first.name
    @answerer = @players.last
    @total = num1 + num2
    puts "#{@questioner}:What does #{num1} plus #{num2} equal?"
  end

  def answer_validation
    answer = gets.chomp.to_i
    if answer == @total
      puts "#{@questioner}: Yes! You are correct"
    else puts "#{@questioner}:Seriously? No!"
      @answerer.lose_life
    end
  end

  def display_score
    puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3 "
  end

  def game_over?
    puts "---------------GAME OVER---------------"
  end
  
  def final_result
     @p2.loser? ? winner = @p1 : winner = @p2
    #  select does not work since it creates a new obj
    # winner = @players.select{|player|player.lives > num}
    puts " #{winner.name} wins with a score of #{winner.lives}/3"
  end

  def new_turn
    puts "----------------------NEW TURN----------------------"
    @players.rotate!
    return
    # self.question
  end

  def play
    # puts "outside until"
    # how to use until here?
    # until @p1.loser? || @p2.loser?
    while @p1.lives > 0 && @p2.lives > 0
      # puts "inside until"
      puts self.question
      puts self.answer_validation
      puts self.display_score
      puts self.new_turn
    end
      puts self.final_result
      puts self.game_over?
  end
  
end