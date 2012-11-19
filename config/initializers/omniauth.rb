Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "Xmz5lFppUgi0iGha7qIFJA", "fBD3skde8u9SRi8KS7ct9BCkM775aQuHxSMKtqQfHs"

  provider :facebook, "264241580364404", "34fcbca3cf1dc8fca77d9e48177d4aba"
end