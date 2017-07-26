# Класс содержащий в себе описание одежды
class ClothesItem
  attr_reader :description, :temper_range, :type

  def initialize(descript, type, temper_range)
    @description = descript
    @type = type
    @temper_range = temper_range
  end
end
