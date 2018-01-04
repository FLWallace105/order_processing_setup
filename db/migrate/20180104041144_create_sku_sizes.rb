class CreateSkuSizes < ActiveRecord::Migration[5.1]
  def up
    create_table :sku_sizes do |t|
      
      t.string :product_id
      t.string :product_item
      t.string :item_name
      t.string :size
      t.string :sku
      
     
      
    end
    add_index :sku_sizes, :product_id 
    
  end

  def down
    remove_index :sku_sizes, :product_id 
    drop_table :sku_sizes
    
    
  end
end
