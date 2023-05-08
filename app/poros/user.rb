class User
  attr_reader :first_name,
              :last_name,
              :email,
              :id,
              :predictions

  def initialize(data)
    @first_name = data[:data][:attributes][:first_name]
    @last_name = data[:data][:attributes][:last_name]
    @email = data[:data][:attributes][:email]
    @id = data[:data][:id]
    @predictions = data[:data][:attributes][:predictions]
  end
end
