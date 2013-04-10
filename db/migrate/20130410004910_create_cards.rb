class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :align
      t.integer :pwr
      t.integer :attack
      t.integer :defense
      t.string :gender
      t.string :faction
      t.integer :abil_lvl
      t.string :usage
      t.string :abil_adj
      t.string :abil_who
      t.string :abil_what
      t.string :abil_type

      t.timestamps
    end
  end
end
