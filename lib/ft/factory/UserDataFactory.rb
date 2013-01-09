class UserDataFactory

  ## Get the user data record for a user (create if missing)
  def self.get(current_user)
    ud = VUserData.find_by_id(current_user.id)
    if !ud.nil?
      return ud
    else
      return self.create(current_user)
    end
  end

  ## Create a user data record from a user
  def self.create(current_user)
    ud = VUserData.new
    ud.user = current_user
    ud.save
    return ud
  end
end
