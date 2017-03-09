class CopyPriceToLineItems < ActiveRecord::Migration[5.0]
  def up
    line_items = LineItem.all.each do |item|
      prod_price = Product.find_by(id: item.product_id).price
      item.price = prod_price
      item.save!
    end
  end
  
  def down
    line_items = LineItem.all.each do |item|
      item.price = nil
      item.save!
    end
  end
end
