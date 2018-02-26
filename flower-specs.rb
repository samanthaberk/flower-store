require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/skip_dsl'
require_relative 'flower.rb'

describe "#initialize" do
  it "takes in info for a name, size, color, quantity_available, bundles, max_stock, and total_sold" do
    name = "rose"
    size = "medium"
    color = "red"
    quantity_available =144
    bundles = 24
    max_stock = 350
    total_sold = 15042
    rose = FlowerStore::Flower.new(name, size, color, quantity_available, bundles, max_stock, total_sold)

    rose.must_respond_to :name
    rose.must_respond_to :size
    rose.must_respond_to :color
    rose.must_respond_to :quantity_available
    rose.must_respond_to :bundles
    rose.must_respond_to :max_stock
    rose.must_respond_to :total_sold
  end
end

describe "#sell" do
  it "Updates the quantity available" do
    rose = FlowerStore::Flower.new("rose", "medium", "red", 144, 24, 350, 15042)
      rose.sell(12)
      rose.quantity_available.must_equal 132
    end

    it "Updates the total quantity sold" do
      rose = FlowerStore::Flower.new("rose", "medium", "red", 144, 24, 350, 15042)
      rose.sell(12)
      rose.sell(1)
      rose.sell(24)
      rose.total_sold.must_equal 15079
    end

    xit "Raises an error if user attempts to sell a flower that doesn't exist in the inventory" do
      proc { daffodil.sell(150) }.must_raise ArgumentError
    end

    it "Raises an error if the user attempts to sell more than available in stock" do
      rose = FlowerStore::Flower.new("rose", "medium", "red", 144, 24, 350, 15042)
      proc { rose.sell(400) }.must_raise ArgumentError
    end
  end
