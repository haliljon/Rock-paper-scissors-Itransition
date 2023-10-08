require 'securerandom'
require 'openssl'

class  Game
    def initialize(moves)
       @moves = moves
       @key = SecureRandom.random_bytes(32)
    end
    def play
        loop do
            puts "HMAC: #{generate_hmac}"
            show_list
            user_answer = get_user_answer.to_i
            break if user_answer == 0
            # if get_user_answer.to_s == '?'
            #     help
            # end
            comp_answer = rand(1..@moves.length).to_i
            puts "Your move: #{@moves[user_answer - 1]}"
            puts "Computer move: #{@moves[comp_answer - 1]}"
            result=determine_winner(user_answer, comp_answer)
            puts result
            puts "HMAC key: #{@key.unpack('H*')[0]}"
        end
    end

    private

    def generate_hmac
        digest = OpenSSL::Digest.new('sha256')
        hmac = OpenSSL::HMAC.digest(digest, @key, @moves.join)
        hmac.unpack('H*')[0]
    end

    def show_list
        puts "Available moves:"
        @moves.each_with_index do |move, index|
            puts "#{index + 1} - #{move}"
        end
        puts "0 - exit"
        puts "? - help"
    end

    def get_user_answer
      loop do
        print "Enter your move: "
        answer = STDIN.gets.chomp
        if answer == "?"
          help
        elsif valid_answer?(answer)
          return answer
        else
          puts "Invalid input. Please try again."
        end
      end
    end
    

    def valid_answer?(answer)
      answer =~ /^[0-9?]+$/ && (answer.to_i >= 0 && answer.to_i <= @moves.length || answer == '?')
    end
    

    def determine_winner(user_answer, computer_answer)
        if user_answer == computer_answer
          "It's a draw!"
        else
          difference = user_answer - computer_answer
          if difference < 0
            difference += @moves.length
          end
      
          if difference <= @moves.length / 2
            "You win!"
          else
            "Computer wins!"
          end
        end
      end
      
      def help
        puts "+-------------------------+#{'-' * (6 * @moves.length)}+"
        puts "| v User\\PC > | " + @moves.join(' | ') + " |"
        puts "+-------------------------+#{'-' * (6 * @moves.length)}+"
    
        @moves.each_with_index do |move1, index1|
          row = "| #{move1.ljust(11)} |"
    
          @moves.each_with_index do |move2, index2|
            result = determine_winner(index1 + 1, index2 + 1)
            cell = case result
                   when "You win!" then "Win".ljust(8)
                   when "Computer wins!" then "Lose".ljust(8)
                   when "It's a draw!" then "Draw".ljust(8)
                   end
    
            row += cell
          end
    
          puts row + " |"
        end
    
        puts "+-------------------------+#{'-' * (6 * @moves.length)}+"
      end
end

if ARGV.length < 3 || ARGV.length % 2 == 0 || ARGV.uniq.length != ARGV.length
    puts "Usage: ruby game.rb <move1> <move2> ... <moveN>"
    puts "Please provide an odd number of non-repeating moves."
else    
    game = Game.new(ARGV)
    game.play
end
