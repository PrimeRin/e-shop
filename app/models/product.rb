# app/models/product.rb
class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: Float
end
