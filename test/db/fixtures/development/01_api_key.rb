
api_keys = [ 
  {
    token: '1dd3dccad979558ecc97e65274323623',
    expires_at: '2050-11-09 00:00:00',
    user_id: 1,
    active: 1
  },
]

api_keys.each do |api_key|
  ApiKey.seed do |s|
    s.access_token = api_key[:token]
    s.expires_at   = api_key[:expires_at]
    s.user_id = api_key[:user_id]
    s.active = api_key[:active]
  end 
end

