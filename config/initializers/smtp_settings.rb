ActionMailer::Base.smtp_settings = {
	:address              => "smtp.gmail.com",
	:port                 => 587,
	:user_name            => "mymeetup933@gmail.com",
	:password             => 'meetup123456',
	:authentication       => "plain",
	:enable_starttls_auto => true
}
