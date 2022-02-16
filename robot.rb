class Robot
  def initialize(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
    @direction = 'n'
    @x = 0
    @y = 0
  end
  
  def print_location
    puts "Your robot is now at (#{@x}, #{@y}, #{@direction.upcase})"
  end

  def move(input)
    if input == 'l'
      left
    elsif input == 'r'
      right
    elsif
      forward   
   else
    return false
   end
  end

  def right
    case @direction
    when 's'
      @direction = 'w'
    when 'w'
      @direction = 'n'
    when 'n'
      @direction = 'e'
    when 'e'
      @direction = 's'
    end
    print_location
  end

  def left
    case @direction
    when 's'
      @direction = 'e'
    when 'e'
      @direction = 'n'
    when 'n'
      @direction = 'w'
    when 'w'
      @direction = 's'
    end
    print_location
  end

  def forward
    case @direction
    when 's'
      @x -= 1
    when 'w'
      @y -= 1
    when 'e'
      @x += 1
    when 'n'
      @y += 1
    end
    print_location
  end

  def is_out_of_bounds?
    if @x.negative? == true
      return true
    elsif @y.negative? == true
      return true
    elsif (@max_x - @x).negative? == true
      return true
    elsif (@max_y - @y).negative? == true
      return true
    else
      return false
    end
  end
end

def convert_str_to_int(input)
  num = input.to_i
  if num.to_s == input
    return num
  else
    false
  end
end

puts "Welcome to the Mars Challenge game\n Please input the grid size in a form of X Y"
input = gets.chomp.split

while ((convert_str_to_int(input[0])) && (convert_str_to_int(input[1]))) == false do
  puts "Invalid input, please enter two numbers in a form of X Y"
  input = gets.chomp.split
end

robot = Robot.new(convert_str_to_int(input[0]), convert_str_to_int(input[1]))

while (robot.is_out_of_bounds?) == false do
  puts "Please enter your move\n 'l' to change your direction to the left\n 'r' to change your direction to the right\n 'f' to move one step forward"
  robot.move(gets.chomp.downcase)
end

puts "Your robot went outside the grid."
