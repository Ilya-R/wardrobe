class Clothes

  def initialize(descript, tipe, temper_range)
    @description = descript
    @tipe = tipe
    @temper_range = temper_range
  end

  attr_reader :description
  attr_reader :temper_range
  attr_reader :tipe
end