class PaymentValidator < ActiveModel::Validator
  def validate(record)
    if !record.v_pledge.nil?
      if record.v_pledge.amount > record.amount
        record.errors[:base] << "A payment for less than the pledge total cannot be accepted"
      end
    end
  end
end
