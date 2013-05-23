class AddDoneToReminds < ActiveRecord::Migration
  def change
    add_column :reminds, :done, :boolean
  end
end
