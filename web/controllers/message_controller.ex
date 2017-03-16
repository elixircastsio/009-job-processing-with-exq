defmodule Teacher.MessageController do
  use Teacher.Web, :controller

  alias Teacher.Message

  def new(conn, _params) do
    changeset = Message.changeset(%Message{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"message" => message_params}) do
    changeset = Message.changeset(%Message{}, message_params)

    case Repo.insert(changeset) do
      {:ok, _message} ->
        Exq.enqueue_in(Exq, "email", 3600, Teacher.SendEmailWorker, [message_params])
        conn
        |> put_flash(:info, "Message sent successfully.")
        |> redirect(to: message_path(conn, :new))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
