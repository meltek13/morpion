class Game 
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.

  attr_accessor :player_1, :player_2, :board

  def initialize
      system 'clear'
      puts "|========================== WELCOME ========================|".blue.bold
      puts "|                                                           |".blue.bold
      puts "|                  T I C  ✕  T A C  ✕  T O E                |".red.swap
      puts "|                                                           |".blue.bold
      puts "|                  by: To, Fred, Melvin, Kevin              |".blue.bold
      puts "|                                                           |".blue.bold
      puts "|                           ☻ ☻ ☻ ☻                         |".blue.bold
      puts "|===========================================================|".blue.bold
      puts ""
      puts "Entrez le nom du premier joueur :".yellow.bold
      print "➤➤ ".yellow.bold
       @player_1 = Player.new(gets.chomp.to_s, "O".blue.bold)
       puts""
       puts " Salut #{player_1.name.blue} tu joueras avec les #{"O".blue}".bold
       puts""
      puts "Entrez le nom du deuxieme joueur :".yellow.bold
      print "➤➤ ".yellow.bold
       @player_2 = Player.new(gets.chomp.to_s, "X".red.bold)
       puts""
      puts " Salut #{player_2.name.red} tu joueras avec les #{"X".red}".bold
      puts ""
      puts "                     Press #{"ENTER".red} to start".bold
       gets.chomp
       system 'clear'
  end
    
  def one_game
      
      myboard = Board.new
      myboard.show_board
      
      i = 1
      
      while i < 9
        myboard.play(player_1)
        myboard.show_board
        i += 1
        
        if myboard.player_win(player_1.symbol) == true
          puts ""
          puts "🌈🌈 Bravo #{player_1.name.blue} tu as gagné ! 🌈🌈".bold
          break
        end

        myboard.play(player_2)
        myboard.show_board
        i += 1
        if myboard.player_win(player_2.symbol) == true
          puts ""
          puts "🌈🌈 BRAVO #{player_2.name.red} tu as gagné ! 🌈🌈".bold
          break
        end
      end

      if myboard.player_win(player_2.symbol) == false && myboard.player_win(player_1.symbol) == false
        puts " ✖✖ match nul my friend ! ✖✖"
        new_round
      end
        new_round
  end
  

  def new_round
    puts""
    puts "         on se relance une game ? (#{"YES".green} or #{"NO".red})".bold
    print "➤➤ "
    question = gets.chomp.downcase
  
    while question != "yes" && question != "no"
       puts "   ⛔️  ecris #{"YES".green}  ou #{"NO".red} stp  ⛔️".bold
       question = gets.chomp.downcase
    end
  
    if question == "yes"
      puts "    :tada: Let's GO ".bold.yellow
      one_game
    else
      puts " à la prochaine my friend :kissing_heart: ".bold.yellow
    end
  end

  
 
end