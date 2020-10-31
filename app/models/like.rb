class Like < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  after_create :create_match_if_needed
  after_destroy :delete_match

  def create_match_if_needed
    current_user_flat = Flat.find(user_id: self.user.id)
    if current_user_flat
      matched_like = Like.find_by(user_id: self.user.id, flat_id: current_user_flat.id)
      if matched_like
        # create match

        # create flat_matches
      end
    end
  end

  def delete_match

  end


end
