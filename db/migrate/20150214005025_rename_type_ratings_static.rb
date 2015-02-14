class RenameTypeRatingsStatic < ActiveRecord::Migration
  def self.up
  	rename_table :type_ratings_static, :type_ratings
  end

  def self.down
  	rename_table :type_ratings, :type_ratings_static
  end
end
