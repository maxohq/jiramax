defmodule Jiramax.IssueFieldOption do
  @moduledoc """
  Provides struct and type for a IssueFieldOption
  """

  @type t :: %__MODULE__{
          config: Jiramax.IssueFieldOptionConfiguration.t() | nil,
          id: integer,
          properties: map | nil,
          value: String.t()
        }

  defstruct [:config, :id, :properties, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      config: {Jiramax.IssueFieldOptionConfiguration, :t},
      id: :integer,
      properties: :map,
      value: {:string, :generic}
    ]
  end
end
