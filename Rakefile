require 'dotenv'
Dotenv.load
require 'active_record'
require 'sinatra'
require 'sinatra/activerecord/rake'
require_relative 'order_processing_setup'

#load_multi_line_item_products

namespace :table_setup do
    desc 'setup multi_line_item_products'
    task :multi_line_item_products do |t|
        TableSetup::MySetup.new.load_multi_line_item_products
    end

    desc 'setup sku_size table'
    task :setup_sku_sizes do |t|
        TableSetup::MySetup.new.load_sku_sizes
    end


end


