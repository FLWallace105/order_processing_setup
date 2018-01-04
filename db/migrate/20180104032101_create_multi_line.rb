class CreateMultiLine < ActiveRecord::Migration[5.1]
  def up
    create_table :multi_line_item_products do |t|
      
      t.string :product_id
      t.string :product_title
      t.string :sku
         
    end
    add_index :multi_line_item_products, :product_id 
    
  end

  def down
    remove_index :multi_line_item_products, :product_id 
    drop_table :multi_line_item_products   
    
  end
  
end
