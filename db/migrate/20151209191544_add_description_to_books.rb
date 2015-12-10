class AddDescriptionToBooks < ActiveRecord::Migration
  def change
    # =>       Table     attribute    type
    add_column :books, :description, :text
    add_column :books, :created_at, :datetime
    add_column :books, :updated_at, :datetime
  end
end
