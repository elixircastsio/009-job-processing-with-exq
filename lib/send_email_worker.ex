defmodule Teacher.SendEmailWorker do
  alias Teacher.Mailer

  def perform(message_params) do
    Mailer.send_contact_email(message_params)
    IO.puts("Finished -- #{message_params["body"]} - #{message_params["subject"]}")
  end
end
