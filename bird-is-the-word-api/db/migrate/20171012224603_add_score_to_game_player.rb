class AddScoreToGamePlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :game_players, :score, :integer, :default => 0
  end
end
