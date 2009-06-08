# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_hella_on_rails_session',
  :secret      => '63ecd398a5979f61eeb4104afcccf8a7629d30edbea6496d1d3286c1efcb53317a11f0d082ac819a7f34eedc7f09a8eb9e05d17030d9093899cb9940b001aa71'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
