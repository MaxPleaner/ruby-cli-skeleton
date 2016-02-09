class Commands
  def initialize(options={})
    puts "try 'help'".yellow
  end
  def hello_world(msg="")
    puts "hello_world #{msg}"
    return { foo: :bar }
  end
end