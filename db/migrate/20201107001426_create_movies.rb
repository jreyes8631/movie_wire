class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :movie_length
      t.string :director
      t.string :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
