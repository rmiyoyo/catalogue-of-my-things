require_relative 'item'
require 'date'

class Game < Item
  attr_reader :multiplayer, :date_last_played

  def initialize(publish_date, multiplayer, date_last_played)
    super(publish_date)
    @multiplayer = multiplayer
    @date_last_played = date_last_played
  end

  def eligible
    (Date.today.year - Date.parse(@date_last_played).year) > 2
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  private

  def can_be_archived?
    super && eligible
  end
end
