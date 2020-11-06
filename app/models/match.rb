class Match < ApplicationRecord
  has_many :messages


  def flat1
    flatmatchs = FlatMatch.where(match_id: self.id)
    flat1 = flatmatchs[0].flat

  end
  def flat2
    flatmatchs = FlatMatch.where(match_id: self.id)

    flat2 = flatmatchs[1].flat

  end

end
