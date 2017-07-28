require_relative 'lib/clothes_item.rb'
require_relative 'lib/wardrobe.rb'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts 'Программа выбор одежды v1.0\n\n'


data_dir = File.dirname(__FILE__) + '/data/'

wardrobe = Wardrobe.new(data_dir)

puts 'Введите температуру на улице'
user_temp = STDIN.gets.to_i
puts "Вы ввели #{user_temp}"

wardrobe.types.each { |item| puts wardrobe.get_for_temper_type(user_temp, item) }
