class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :name
      t.time :start
      t.time :finish

      t.timestamps
    end
  end
end
