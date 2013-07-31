require 'codebreaker'

step "I am not yet playing" do 
end

step "I start a new game" do 
  @output = Output.new
  @game = Codebreaker::Game.new(@output)
  @game.start
end

step "I should see :message" do |message|
  @output.messages.should include(message)
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

