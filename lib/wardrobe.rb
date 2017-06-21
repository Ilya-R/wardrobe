# Класс - коллекция одежды с логикой программы
class Wardrobe
  def initialize(files_dir)
    array_with_clothes = make_array(files_dir)

    @wardrobe_collection = array_with_clothes

    @clothe_types = []
    array_with_clothes.each { |item| @clothe_types.push(item.type) }
    @clothe_types.uniq!
  end

  attr_reader :clothe_types

  def get_for_temper_type(temper, type)
    type_temp_clothes = []

    @wardrobe_collection.each do |item|
      if item.type == type && item.temper_range.include?(temper)
        type_temp_clothes.push(item)
      end
    end

    type_temp_clothes.sample.description if type_temp_clothes.any?
  end

  def make_array(files_dir)
    abort 'Указанная директория не существует' unless Dir.exist?(files_dir)

    array_with_clothes = []

    Dir[files_dir + '/*.txt'].each do |file_in_dir|
      file = File.new(file_in_dir, 'r:UTF-8')
      lines = file.readlines
      file.close

      descript = lines[0]
      type = lines[1]
      temps = lines[2].split(' ')
      temper_range = (temps[0].to_i..temps[1].to_i)

      array_with_clothes << Clothes.new(descript, type, temper_range)
    end

    array_with_clothes
  end
end
