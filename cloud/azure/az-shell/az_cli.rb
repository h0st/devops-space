require 'optparse'
require 'colorize'
require 'io/console'

#
# RUBY SHELL: https://www.devdungeon.com/content/enhanced-shell-scripting-ruby
#

# Get an environment variable
puts ENV['SHELL']

# This will hold the options we parse
options = {}

OptionParser.new do |parser|
	parser.banner = "Usage: az-cli.rb [options]"

	parser.on("-h", "--help", "Show this help message") do
		puts parser
	end
	
	parser.on("-n", "--name NAME", "The name.") do |v|
		options[:name] = v
	end
	
	parser.on("-v", "--verbose", "Show extra information") do
		options[:verbose] = true
	end
	
	parser.on("-c", "--color", "Enable syntax highlighting") do
		options[:syntax_highlighting] = true
	end
	
end.parse!

if options[:name]
	puts "Hello #{options[:name]}".green
end
#
# FUNCTIONS
#
def ls
	puts "ls files...".green.on_blue.bold
	system("ls")
end

def ls_dir(name)
	puts "ls dir #{"name".red}"
	system("ls -la #{name}")
end

def mkdir(name)
	puts "make dir #{name}".red.on_blue.bold
	system("mkdir #{name}")
end

def create_file(name)
	puts "create new file #{name}".cyan.on_blue.bold
	`touch #{name}"`
end

def enter_password(passw)
	# The prompt is optional
	passw = IO::console.getpass "Enter Password: "
	puts "Your password was #{passw.length} characters long.".blue
end

#
# MAIN
#
ls
puts $?.exitstatus
ls_dir "bash"
puts $?.exitstatus
mkdir options[:name] if options[:name].nil?
puts $?.exitstatus
#create_file "new_file"
#puts $?.exitstatus
enter_password "qwerty"
puts $?.exitstatus
ls