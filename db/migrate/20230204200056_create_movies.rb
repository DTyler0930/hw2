class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|

      t.integer "movie_id"
      t.string "title"
      t.string "release year"
      t.string "rated"
      t.integer "studio_id"

      t.timestamps
    end
  end
end
