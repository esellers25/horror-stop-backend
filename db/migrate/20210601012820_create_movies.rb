class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :img_url
      t.string :year
      t.string :trailer_url
      t.string :watch_providers
      t.string :category_id

      t.timestamps
    end
  end
end
