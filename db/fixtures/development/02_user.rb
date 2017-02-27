users = [ 
  {
    name: "general_user",
    email: 'hogehoge@example.jp',
    crypted_password: '$2a$10$xm9z6rrXCMaY5/bukVg/AORT9t2GWP5Hx4zmkRoyQOz3AxtoaIgb.',
    salt: '8av6hRUzgzWrD15nkqP2',
  },
]

users.each do |user|
  User.seed do |s|
    s.name  = user[:name]
    s.email = user[:email]
    s.crypted_password = user[:crypted_password]
    s.salt      = user[:salt]
  end 
end

