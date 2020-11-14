class Like < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  after_create :create_match_if_needed
  after_destroy :delete_match

  def match_exist?
    liked_flat_user = Flat.find(self.flat.id).user
    current_user_flats = Flat.where(user_id: self.user.id)

    response = false
    current_user_flats.each do |current_user_flat|


        matched_like = Like.find_by(user_id: liked_flat_user.id, flat_id: current_user_flat.id)
        response = response || matched_like != nil

    end

    return response


  end

  def create_match_if_needed
    liked_flat_user = Flat.find(self.flat.id).user
    current_user_flats = Flat.where(user_id: self.user.id)
    current_user_flats.each do |current_user_flat|


      matched_like = Like.find_by(user_id: liked_flat_user.id, flat_id: current_user_flat.id)
      if matched_like
        # create match
        p " match"
        created_match = Match.create(name: "Match between #{liked_flat_user.name} and #{self.user.name}")
        # create flat_matches
        flat_match1 = FlatMatch.new()
        flat_match2 = FlatMatch.new()

        flat_match1.match = created_match
        flat_match1.flat = Flat.find(self.flat.id)
        flat_match2.match = created_match
        flat_match2.flat = current_user_flat

        flat_match1.save
        flat_match2.save
      else

      end

    end

  end

  def delete_match

  end


end
