defmodule Jiramax.ScreenScheme do
  @moduledoc """
  Provides struct and type for a ScreenScheme
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: integer | nil,
          issueTypeScreenSchemes: map | nil,
          name: String.t() | nil,
          screens: map | nil
        }

  defstruct [:description, :id, :issueTypeScreenSchemes, :name, :screens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      id: :integer,
      issueTypeScreenSchemes: :map,
      name: {:string, :generic},
      screens: :map
    ]
  end
end
