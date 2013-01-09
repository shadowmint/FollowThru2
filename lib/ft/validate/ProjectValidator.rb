require "config/VLimits.rb"

class ProjectValidator < ActiveModel::Validator
  def validate(record)
    count = VProject.where("v_user_data_id = ?", record.v_user_data_id).count()
    if count >= VLimits::MAX_PROJECT_COUNT
      error = "Maximum count of projects (%{max}) exceeded. #{record.v_user_data_id} Unable to create project." % { :max => VLimits::MAX_PROJECT_COUNT }
      record.errors[:base] << s = error
    end
  end
end
