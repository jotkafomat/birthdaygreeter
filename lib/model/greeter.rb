class Greeter
  def initialize(name = 'you')
    @name = name
  end

  def say_hi
    "Hi #{@name}!"
  end
end
