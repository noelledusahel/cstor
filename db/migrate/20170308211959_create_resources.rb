class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :abstract
      t.boolean :teacher_only
      t.integer :teacher_id

      t.timestamps
    end
  end
end
