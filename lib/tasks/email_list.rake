require 'csv'

namespace :email_list do
  desc "generates an email list of all Users"
  task generate: :environment do
  
    emails = User.all.map(&:email)

    CSV.open("email_list.csv", "w") do |csv|
      csv << ["Emails"]
      emails.each do |email|
        csv << [email]
      end
    end

  end

end

