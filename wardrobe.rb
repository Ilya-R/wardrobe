class Wardrobe

  def initialize(files_dir)
    
    array_with_clothes = make_array(files_dir)
    
    @wardrobe_collection = array_with_clothes

    @clothe_tipes = []
    array_with_clothes.each {|item| @clothe_tipes.push(item.tipe)}
    @clothe_tipes.uniq!
  end

  attr_reader :clothe_tipes

  def get_for_temper_tipe(temper, tipe)

    this_tipe_temp_clothes = []

    @wardrobe_collection.each do |item|
      if item.tipe == tipe && item.temper_range.include?(temper)
        this_tipe_temp_clothes.push(item)
      end
    end
    
    return this_tipe_temp_clothes.sample.description if this_tipe_temp_clothes.any?
  end

  def make_array(files_dir)

    abort "Указанная директория не существует" if Dir.exist?(files_dir) == false

    array_with_clothes = []

    Dir[files_dir + "/*.txt"].each do |file_in_dir|

      file=File.new(file_in_dir, "r:UTF-8")
      lines = file.readlines
      file.close

      descript = lines[0]
      tipe = lines[1]
      temps = lines[2].split(" ")
      temper_range = (temps[0].to_i..temps[1].to_i)
      
      array_with_clothes << Clothes.new(descript, tipe, temper_range)
    end

    return array_with_clothes
  end
end

