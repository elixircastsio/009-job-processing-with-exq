defmodule Teacher.Message do
  use Teacher.Web, :model

  schema "messages" do
    field :subject, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:subject, :body])
    |> validate_required([:subject, :body])
  end
end
