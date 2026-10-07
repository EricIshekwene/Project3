require 'uri'
require 'json'

module ErrorHandler

  def self.validate_api_url(url)
    if url.nil? || url.strip.empty?
        raise ArgumentError, "API URL cannot be empty."
    end

    unless url.match?(/\Ahttps?:\/\/[^\s]+\z/)
        raise ArgumentError, "Invalid API URL."
    end

    begin
        uri = URI.parse(url)

        unless uri.is_a?(URI::HTTP) && uri.host
        raise ArgumentError, "Invalid API URL."
        end
    rescue URI::InvalidURIError
        raise ArgumentError, "Invalid API URL."
    end

    true
  end


  def self.validate_user_id id
    if id.nil? || id.to_s.strip.empty?
      raise ArgumentError, "User ID cannot be empty."
    end

    unless id.to_s.match?(/\A\d+\z/)
      raise ArgumentError, "User ID must be a number."
    end

    true
  end

  def self.response_message response
    case response.code
    when 200
      "Request successful."
    when 201
      "User created successfully."
    when 404
      "User not found."
    when 500..599
      "Server error. HTTP #{response.code}"
    else
      "Request returned HTTP #{response.code}."
    end
  end

  def self.parse_json response
    JSON.parse(response.body)
  rescue JSON::ParserError
    raise StandardError, "Invalid JSON response."
  end

  def self.network_error_message error
    "Could not reach the server: #{error.message}"
  end

end