class AddColumnToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :accept, :boolean, default: nil
  end
end
