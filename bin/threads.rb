require 'io/console'

class Threads

  def start
    flag = 0

    t2 =Thread.new do
      puts flag

      loop do
        temp = STDIN.getch
        flag = (flag+1)%2
        puts flag
      end

    end
    t2.join
  end
end

thread = Threads.new
thread.start