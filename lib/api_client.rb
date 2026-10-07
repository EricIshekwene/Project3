require 'httparty'
require 'json'

class ApiClient
  def initialize api_url
    @api_url = api_url
  end

  def get_users
    HTTParty.get @api_url
  end

  def get_user id
    HTTParty.get("#{@api_url}/#{id}")
  end

  def create_user user_data
    HTTParty.post(
      @api_url,
      body: user_data.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def replace_user id, user_data
    HTTParty.put(
      "#{@api_url}/#{id}",
      body: user_data.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def update_user id, user_data
    HTTParty.patch(
      "#{@api_url}/#{id}",
      body: user_data.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  def delete_user id
    HTTParty.delete("#{@api_url}/#{id}")
  end
end