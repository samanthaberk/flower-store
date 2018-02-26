require 'awesome_print'
module FlowerStore
  class Flower
    attr_accessor :name, :size, :color, :quantity_available, :bundles, :max_stock, :total_sold

    def initialize(name, size, color, quantity_available, bundles, max_stock, total_sold)
      @name = name
      @size = size
      @color = color
      @quantity_available = quantity_available
      @bundles = bundles
      @max_stock = max_stock
      @total_sold = total_sold
    end

    def sell(num)

    end
  end
end
