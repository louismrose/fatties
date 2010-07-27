# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_fatties_session',
  :secret => '3acc246f0bc53ef1cd93105c14cfda0f5c34d5cb9a8f219b44d4eee55e01be54827c32d2d1684564536e483436c38db367ead72382e522bfba5f74705d8ecb19'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
