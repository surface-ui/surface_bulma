defmodule SurfaceBulma.Catalogue.Form.SampleModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "" do
    field(:name, :string)
    field(:checkbox, :boolean)
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :checkbox])
    |> validate_required([:name])
  end
end
