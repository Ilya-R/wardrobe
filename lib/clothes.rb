# Класс содержащий в себе описание одежды
class Clothes
  def initialize(descript, type, temper_range)
    @description = descript
    @type = type
    @temper_range = temper_range
  end

  attr_reader :description
  attr_reader :temper_range
  attr_reader :type
end
