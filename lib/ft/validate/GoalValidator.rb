class GoalValidator < ActiveModel::Validator
  def validate(record)
    if !record.count.nil? && record.count > 0
      if record.v_pledge_type.nil?
        record.errors[:base] << "If a count is given there must be a pledge type"
      end
    end
  end
end
