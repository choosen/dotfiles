if defined?(PryRails::RAILS_PROMPT)
  Pry.config.prompt = PryRails::RAILS_PROMPT
end

Pry::Commands.command /^$/, "repeat last command" do
  pry_instance.run_command Pry.history.to_a.last
end

Pry.config.history.file = ".pry_history" rescue StandardźError
Pry.config.history_file = ".pry_history"

ActiveRecord::Base.logger = Logger.new(STDOUT) if defined?(ActiveRecord::Base)

module ObjectLocalMethods
  def local_methods(include_superclasses = true)
    (self.methods - (include_superclasses ? Object.methods : self.class.superclass.instance_methods)).sort
  end
end
Object.send(:extend,  ObjectLocalMethods)
Object.send(:include, ObjectLocalMethods)

module Kernel
  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
    str
  end

  def paste
    `pbpaste`
  end

  def copy_history
    history = Readline::HISTORY.entries
    index = history.rindex("exit") || -1
    content = history[(index + 1)..-2].join("\n")
    puts content
    copy content
  end
end

module AwesomePrint
  module Formatters
    class HashFormatter
      def ruby19_syntax(key, value, width, only_symbols)
        key.delete_prefix!(':') # key[0] = ''
        if only_symbols
          width -= 3 # to align with ' => '
        end
        separator = ': ' + (' ' * (width + 2 - key.size))
        colorize(align(key, 0), :symbol) << colorize(separator, :hash) << inspector.awesome(value)
      end

      def pre_ruby19_syntax(key, value, width)
        colorize(align(key, width), :string) << colorize(' => ', :hash) << inspector.awesome(value)
      end

      def printable_hash
        data = printable_keys
        width = left_width(data)
        only_symbols = only_symbols?(data)

        data.map! do |key, value|
          indented do
            if options[:ruby19_syntax] && symbol?(key)
              ruby19_syntax(key, value, width, only_symbols)
            else
              pre_ruby19_syntax(key, value, width)
            end
          end
        end

        should_be_limited? ? limited(data, width, hash: true) : data
      end

      def only_symbols?(data)
        key_first_letters = data.map { |key, _value| key[0] }
        key_first_letters.all?(":")
      end
    end
  end
end