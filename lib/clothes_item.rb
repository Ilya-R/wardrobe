# Класс содержащий в себе описание одежды
class ClothesItem
  attr_reader :description, :temper_range, :type

  def initialize(description, type, temper_range)
    @description = description
    @type = type
    @temper_range = temper_range
  end
end
