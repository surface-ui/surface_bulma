defmodule SurfaceBulma.Catalogue.Form.SampleModel do
  use Ecto.Schema
  import Ecto.Changeset

  schema "" do
    field(:name, :string)
    field(:username, :string)
    field(:email, :string)
    field(:select, :string)
    field(:textarea, :string)
    field(:checkbox, :boolean)
    field(:radio, :string)

    field(:example_02_addon_dummy1, :string)
    field(:example_02_addon_dummy2, :string)
    field(:example_02_addon_dummy3, :string)
    field(:example_02_addon_dummy4, :string)
    field(:example_02_select_dummy1, :string)
    field(:example_02_select_dummy2, :string)

    field :example_03_name, :string
    field :example_03_email, :string
    field :example_03_phone, :string
    field :example_03_department, :string
    field :example_03_member, :boolean
    field :example_03_subject, :string
    field :example_03_question, :string
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [
      :name,
      :username,
      :email,
      :select,
      :textarea,
      :checkbox,
      :radio,
      :example_02_addon_dummy1,
      :example_02_addon_dummy3,
      :example_02_addon_dummy3,
      :example_02_addon_dummy4,
      :example_02_select_dummy1,
      :example_02_select_dummy2,
      :example_02_select_dummy1,
      :example_02_select_dummy2,
      :example_03_name,
      :example_03_email,
      :example_03_phone,
      :example_03_department,
      :example_03_member,
      :example_03_subject,
      :example_03_question
    ])
    |> validate_required([:name, :example_03_subject])
    |> validate_format(:email, email_regex(), message: "This email is invalid")
  end

  defp email_regex,
    do:
      ~r/(?:[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/
end
