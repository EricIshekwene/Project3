# Example configuration. Copy this file to config.rb and fill in your group's
# MockAPI base URL. config.rb is gitignored so each group keeps its own endpoint
# out of version control.
#
#   cp config.example.rb config.rb
#
module Config
  # Base URL for the group's MockAPI project, e.g.
  #   "https://640abcd1234.mockapi.io/api/v1"
  MOCKAPI_BASE_URL = "https://REPLACE-WITH-YOUR-PROJECT.mockapi.io/api/v1".freeze
end
