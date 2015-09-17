class AddColumnsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :rating, :integer
    add_column :movies, :category, :string
    remove_column :movies, :ranking, :integer
  end
end
