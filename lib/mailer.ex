defmodule Teacher.Mailer do
  @config domain: "https://api.mailgun.net/v3/your_domain",
          key: "key-your_api_key"

  use Mailgun.Client, @config

  def send_contact_email(message_params) do
    send_email to: "customer-service@example.com",
               from: "customer@example.com",
               subject: message_params["subject"],
               text: message_params["body"]
  end
end
