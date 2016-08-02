class AddReferralCodeToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :referral_code, :string
  end
end
