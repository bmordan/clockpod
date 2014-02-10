class CreateClocks < ActiveRecord::Migration
  def change
    create_table :clocks do |t|
      t.references :staff, index: true
      t.datetime :in
      t.datetime :out
      t.timestamps
    end
  end
end
