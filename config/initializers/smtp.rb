ActionMailer::Base.smtp_settings={
    address:                'smtp.sendgrid.net',
    port:                   587,
    domain:                 ENV["SENDGRID_EMAIL_DOMAIN"],
    user_name:              'apikey',
    password:               ENV['SENDGRID_API_KEY'],
    authentication: :plain,
    
}
ActionMailer::Base.delivery_method = :smtp