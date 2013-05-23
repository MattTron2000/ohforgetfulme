class CreateReminds < ActiveRecord::Migration
  def change
    create_table :reminds do |t|
      t.string :name
      t.date :date
      t.time :time
      t.integer :contactmethod
      t.string :contactinfo
      t.text :message
      t.timestamp :timecreated

      t.timestamps
    end
  end
end
