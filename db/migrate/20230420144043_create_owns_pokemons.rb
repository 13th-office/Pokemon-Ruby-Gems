class CreateOwnsPokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :owns_pokemons do |t|
      t.belongs_to :trainer, null: false, foreign_key: true
      t.belongs_to :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
