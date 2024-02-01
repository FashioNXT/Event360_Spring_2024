# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create sample user
User.create(name: 'Test', email: 'test@example.com', password_digest: BCrypt::Password.create('password'), user_type: 'admin')
User.create(name: 'NXT User', email: 'nxt@example.com', password_digest: BCrypt::Password.create('password'), user_type: 'user')

# Create the existing 3 applications
NxtApps.create!(
  name: 'CastNXT',
  redirect_uri: 'urn:ietf:wg:oauth:2.0:oob',
  description: 'Allow users to cast talents to their projects',
  api_url: 'https://pmiyan.pythonanywhere.com/CastNXT/api/',
  homepage_url: 'https://castnxtspring.herokuapp.com/'
)

NxtApps.create!(
  name: 'EventNXT',
  redirect_uri: 'urn:ietf:wg:oauth:2.0:oob',
  description: 'Allow users to create events and invite others to attend',
  api_url: 'https://pmiyan.pythonanywhere.com/EventNXT/api/',
  homepage_url: 'https://tamu-csce606-event-nxt.herokuapp.com/'
)

NxtApps.create!(
  name: 'PlaNXT',
  redirect_uri: 'urn:ietf:wg:oauth:2.0:oob',
  description: 'Allow users to create plans and invite others to join',
  api_url: 'https://pmiyan.pythonanywhere.com/PlaNXT/api/',
  homepage_url: 'http://plannxt.herokuapp.com'
)
