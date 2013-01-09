class PledgeValidator < ActiveModel::Validator
  def validate(record)
    if !record.v_pledge_type.nil? && record.amount > 0
      if record.v_pledge_type.cost > record.amount
        record.errors[:base] << "Pledge must be >= the value of it's pledge type"
      end
    end
  end
end
