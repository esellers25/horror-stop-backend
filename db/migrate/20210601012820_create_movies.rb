class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.string :year
      t.string :trailer_url
      t.string :watch_providers
      t.string :runtime
      t.text :summary
      t.integer :category_id

      t.timestamps
    end
  end
end
