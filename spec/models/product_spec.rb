require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should contain name,price,quantity and category' do
      @category = Category.create(name: "test")
      @product = Product.create(name: "test", price: 10, quantity: 10, category: @category)
     
      expect(@product).to be_valid
      
    end
    it 'should contain a name' do
      @category = Category.create(name: "test")
      @product = Product.create(name: nil, price: 10, quantity: 10, category: @category)
     
      expect(@product.errors.full_messages).to include "Name can't be blank"
      
    end
    it 'should contain a valid price' do
      @category = Category.create(name: "test")
      @product = Product.create(name: "test", price: "NaN", quantity: 0, category: @category)
     
      expect(@product.errors.full_messages).to include "Price is not a number"
      
    end
    it 'should contain valid quantity' do
      @category = Category.create(name: "test")
      @product = Product.create(name: "test", price: 10, quantity: nil, category: @category)
     
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
      
    end
    it 'should contain vaild category' do
      @category = Category.create(name: "test")
      @product = Product.create(name: "test", price: 0, quantity: 0, category: nil)
     
      expect(@product.errors.full_messages).to include "Category can't be blank"
      
    end
  end
end



# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true