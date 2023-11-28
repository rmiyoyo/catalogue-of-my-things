class Item
  attr_accessor :id, :genre, :author, :label, :source, :published_date, :archived

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Time.now - @published_date > 10.years.ago
  end
end
