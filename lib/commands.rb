class Commands
  def initialize(options={})
    # make sure this method accepts a hash argument, which is passed from OptionParser
    puts "try 'help'".yellow
  end
  def hello_world(msg="")
    # a sample event, call it with hello_world
    puts "hello_world #{msg}"
    return { foo: :bar }
  end
end