# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		File.read(token_file).chomp
	else
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

# SampleApp::Application.config.secret_key_base = 'd62d8b548ecf77c46ebc210ad7d5440975c08d8333d9f48d59c68413d1f30ed89760ea5acc561febde548aacde842e371339483835301a8f45483c3c4212af4b'

SampleApp::Application.config.secret_key_base = secure_token
