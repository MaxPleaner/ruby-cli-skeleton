This is a ruby CLI skeleton using [ripl](https://github.com/cldwalker/ripl).

How to use:

1. Clone repo
2. run `bundle install`
3. Customize the `ruby-cli-skeleton` file.
  - The CLI is all set up and ready to use, it just lacks commands.
  - Some commands are already defined, like `help`, `ls`, and `pwd`.
  - The commands available in the CLI are the instance methods
    on the `RubyCliSkeleton` class and any class it inherits from.
  - Commands are simple to write. You can print something, return some value
    (this is a REPL), or just return nil.
  - Custom commands are written in `lib/commands.rb`
  - If renaming the class/file in `lib/commands.rb`, also change the `COMMANDS_CLASS`
    and `COMMANDS_FILE` constants in `ruby-cli-skeleton`. Make sure the `initialize` method
    on `COMMANDS_CLASS` accepts an options hash.
  - `OptionParser` can be used in `ruby-cli-skeleton`, read [the docs](http://ruby-doc.org/stdlib-2.3.0/libdoc/optparse/rdoc/OptionParser.html)
    for more info.
  - Add a method's name to `no_help_methods` to prevent the `help` command from listing it
4. After customizing, open the `ruby-cli-skeleton` executable to start the program

What kind of helpers does this provide:
  - The `help` command (with no arguments) will print out all the methods available to the CLI.
    It does this using `instance_methods(false)` on `RubyCliSkeleton` and `COMMANDS_CLASS`, so
    once a method is defined, it will be included here (unless it's included in `no_help_methods`)
  - The `help` command (when given a method name as an argument) will print out the
    source code for the method. It does this using the [method_source](https://github.com/banister/method_source) gem
  - [awesome_print](https://github.com/michaeldv/awesome_print/) and [colored](https://github.com/defunkt/colored) are installed for pretty printing / colors.
  - Some ripl plugins are installed. `ripl-shell_commands` enables any shell method to be run in the CLI by prepending a bang ("!").
    For example, `!echo true` will print `true`.