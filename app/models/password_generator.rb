class PasswordGenerator
  def self.generate
    (0...8).map { ('a'..'z').to_a[rand(26)] }.join
  end
end
