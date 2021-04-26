class AddColumnToMembers < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :name, :string
    add_column :members, :gender, :integer
    add_column :members, :prefectural_id, :integer
    add_column :members, :birthday, :date
  end
end
