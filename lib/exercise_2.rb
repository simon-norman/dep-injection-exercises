class Greeter
  def initialize(kernel = Kernel, output = $stdout)
    @kernel = kernel
    @output = output
  end
  
  def greet
    @output.puts "What is your name?"
    name = @kernel.gets.chomp
    @output.puts "Hello, #{name}"
  end
end