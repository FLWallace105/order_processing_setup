#order_processing_setup.rb
require 'dotenv'
Dotenv.load
require 'active_record'
require 'sinatra'
require "sinatra/activerecord"
require_relative 'models/model'
require 'csv'

module TableSetup
    class MySetup
        def initialize
            
            Dotenv.load
             

        end

        def load_multi_line_item_products
            MultiLineItemProduct.delete_all
            ActiveRecord::Base.connection.reset_pk_sequence!('multi_line_item_products')
            CSV.foreach('multi_line_item_product.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
                puts row.inspect
                sku = row['sku']
                product_title = row['product_title']
                product_id = row['product_id']
                multi = MultiLineItemProduct.create(sku: sku, product_title: product_title, product_id: product_id)
                puts multi.inspect
              end
   
        end

        def load_sku_sizes
            SkuSize.delete_all
            ActiveRecord::Base.connection.reset_pk_sequence!('sku_sizes')
            CSV.foreach('sku_sizes.csv', :encoding => 'ISO-8859-1', :headers => true) do |row|
                puts row.inspect
                product_id = row['product_id']
                product_item = row['product_item']
                item_name = row['item_name']
                size = row['size']
                sku = row['sku']
                sku_result = SkuSize.create(product_id: product_id, product_item: product_item, item_name: item_name, size: size, sku: sku)
                puts sku_result.inspect
            end

        end



    end
end