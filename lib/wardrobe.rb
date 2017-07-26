# Класс - коллекция одежды с логикой программы
class Wardrobe
  attr_reader :types

  def initialize(files_dir)
    @clothes_items = make_array(files_dir)
    @types = @clothes_items.map { |item| item.type }.uniq
  end


  def get_for_temper_type(temper, type)
    type_temp_clothes = []
    @clothes_items.each { |item| type_temp_clothes.push(item) if item.type == type && item.temper_range.include?(temper) }
    type_temp_clothes.sample.description if type_temp_clothes.any?
  end

  def make_array(files_dir)
    abort 'Указанная директория не существует' unless Dir.exist?(files_dir)

    array_with_clothes = []
    Dir[files_dir + '/*.txt'].each do |file_in_dir|
      file = File.new(file_in_dir, 'r:UTF-8')
      lines = file.readlines
      file.close

      temps = lines[2].split(' ')
      temper_range = (temps[0].to_i..temps[1].to_i)
      array_with_clothes << ClothesItem.new(lines[0], lines[1], temper_range)
    end
    array_with_clothes
  end
end
