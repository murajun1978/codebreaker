require 'codebreaker'

step "I am not yet playing" do 
end

step "I start a new game" do 
  @output = Output.new
  @game = Codebreaker::Game.new(@output)
  @game.start('1234')
end

step "I should see :message" do |message|
  @output.messages.should include(message)
end

step "the secret code is :code" do |code|
  @output = Output.new
  @game = Codebreaker::Game.new(@output)
  @game.start(code)
end

step "I guess :guess" do |guess|
  @game.guess(guess)
end

step "the mark should be :mark" do |mark|
  @output.messages.should include(mark)
end

class Output
  def messages 
    @messages ||= []
  end

  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end

