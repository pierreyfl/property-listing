class Contact < MailForm::Base
  attribute :phone, validate: true
  attribute :to, validate: true
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, :captcha => true

  def headers
    {
      :subject => "Contact You",
      :to => %("#{to}"),
      :from => %("#{phone}" <#{email}>)
    }
  end
end
