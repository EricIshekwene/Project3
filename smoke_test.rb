require_relative 'lib/api_client'
require 'json'

# Replace with your actual MockAPI users endpoint
API_URL = 'https://6ac1504f309c92da039c5d7d.mockapi.io/users'
client = ApiClient.new(API_URL)

# Prints the response status and body
def print_response(label, response)
  puts "\n--- #{label} ---"
  puts "HTTP Status: #{response.code}"
  puts "Response Body:"
  puts response.body
end

begin
  # Get all users
  response = client.get_users
  print_response('GET ALL USERS', response)

  # Create a temporary test user
  new_user = {
    firstName: 'Smoke',
    lastName: 'Test',
    email: 'smoketest@example.com',
    phone: '555-123-4567'
  }

  response = client.create_user(new_user)
  print_response('POST - CREATE USER', response)

  created_user = JSON.parse(response.body)
  user_id = created_user['id']

  puts "\nCreated test user with ID: #{user_id}"

  #get the test user
  response = client.get_user(user_id)
  print_response('GET ONE USER', response)

  #patch only the email
  patch_data = {
    email: 'updated-smoketest@example.com'
  }

  response = client.update_user(user_id, patch_data)
  print_response('PATCH USER', response)

  #replace the user's editable fields
  replacement_user = {
    firstName: 'Updated',
    lastName: 'User',
    email: 'updateduser@example.com',
    phone: '555-987-6543'
  }

  response = client.replace_user(user_id, replacement_user)
  print_response('PUT USER', response)

  #delete the test user
  response = client.delete_user(user_id)
  print_response('DELETE USER', response)

  puts "\nSmoke test completed!"

rescue StandardError => e
  # Show any error that causes the test to fail
  puts "\nSmoke test failed."
  puts "#{e.class}: #{e.message}"
end