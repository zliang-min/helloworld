# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_brands_session',
  :secret      => '86fcd9f4a9b626b8c50c34b5934fe965a6a0c68c3c10d4f25533144d23fd98b3a590dac20a397eb001753ef2d8cbe58c027886a54a901cf8fc6dbedbd973ad56'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
