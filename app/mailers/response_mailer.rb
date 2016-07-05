class ResponseMailer < ApplicationMailer
  default from: "team@rubyonrichards.com"

  def response_email(full_name, body)
    @full_name = full_name
    @body = body

    mail(to: "team@rubyonrichards.com", subject: "Introduction from #{full_name}")
  end
end
