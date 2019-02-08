require './lib/exercise_2.rb'

describe Greeter do
  before(:each) do
    @user_name = 'Simon Norman'

    @stdout_dbl = double(:STDOUT, puts: "")
    @kernel_dbl = double(:Kernel, gets: @user_name)

    @greeter = Greeter.new(@kernel_dbl, @stdout_dbl)

    @greeter.greet
  end

  it 'should ask the user to enter their name' do
    expect(@stdout_dbl).to have_received(:puts).with("What is your name?")
  end

  it 'should get user name using gets' do
    expect(@kernel_dbl).to have_received(:gets).once
  end

  it 'should output the greeting with the user name' do
    expect(@stdout_dbl).to have_received(:puts).with("Hello, #{@user_name}")
  end
end