class HockeyGame
  attr_accessor :gamePk,
                :abstractGameState,
                :codedGameState,
                :detailedState,
                :statusCode,
                :home_score,
                :away_score,
                :home,
                :away,
                :winner,
                :home_id,
                :away_id,
                :datetime

  def initialize(data_hash)
    @gamePk = data_hash[:attributes][:gamePk]
    @abstractGameState = data_hash[:attributes][:abstractGameState]
    @codedGameState = data_hash[:attributes][:codedGameState]
    @detailedState = data_hash[:attributes][:detailedState]
    @statusCode = data_hash[:attributes][:statusCode]
    @home_score = data_hash[:attributes][:home_score]
    @away_score = data_hash[:attributes][:away_score]
    @home = data_hash[:attributes][:home]
    @away = data_hash[:attributes][:away]
    @winner = data_hash[:attributes][:winner]
    @home_id = data_hash[:attributes][:home_id]
    @away_id = data_hash[:attributes][:away_id]
    @datetime = data_hash[:attributes][:datetime]
  end

end
