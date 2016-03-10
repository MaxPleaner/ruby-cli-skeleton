This is a ruby CLI skeleton using [ripl](https://github.com/cldwalker/ripl).

How to use:

1. Clone repo
2. run `bundle install`
3. Customize the `lib/commands.rb` file and (optionally) the `ruby-cli-skeleton` file.
  - `ruby-cli-skeleton` has the base CLI which is all set up and ready to use, but lacks useful commands.
  - Some commands are already defined, like `help`, `ls`, and `pwd`.
  - The commands available in the CLI are the instance methods
    on the `RubyCliSkeleton` class and any class it inherits from.
    By default, it inherits from the `Commands` class in `lib/commands.rb`
  - Commands are simple to write. You can print something, return some value
    (this is a REPL), or just return nil.
  - Custom commands are written in `lib/commands.rb`
  - If renaming the class/file in `lib/commands.rb`, also change the `COMMANDS_CLASS`
    and `COMMANDS_FILE` constants in `ruby-cli-skeleton`. Make sure the `initialize` method
    on `COMMANDS_CLASS` accepts an options hash.
  - `OptionParser` can be used in `ruby-cli-skeleton`, read [the docs](http://ruby-doc.org/stdlib-2.3.0/libdoc/optparse/rdoc/OptionParser.html)
    for more info.
  - Add a method's name to `no_help_methods` to prevent the `help` command from listing it
  - Customize the database in `lib/db_setup.rb`, including migrating and models.
    A `Todo` ActiveRecord model is already defined.
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

Update:
  - This now includes a sample ActiveRecord database setup, see `lib/db_setup.rb`


#### Another thing

Since this is a REPL, it can't be piped in Bash without issing it an exit command.

```bash
$ (echo "print 'hello world'"; echo "exit") | ./ruby-cli-skeleton | grep hello
```

This does a couple thigns:
  - combines multiple `echo` calls into a single output by wrapping them in parens and separating them using semicolons.
  - issues ruby commands via `echo`, including one for `exit` which is necessary.
  - pipes the `echo` to the cli script, and pipes the script output to `grep`, searching the text. 

