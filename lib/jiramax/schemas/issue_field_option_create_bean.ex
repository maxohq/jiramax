defmodule Jiramax.IssueFieldOptionCreateBean do
  @moduledoc """
  Provides struct and type for a IssueFieldOptionCreateBean
  """

  @type t :: %__MODULE__{
          config: Jiramax.IssueFieldOptionConfiguration.t() | nil,
          properties: map | nil,
          value: String.t()
        }

  defstruct [:config, :properties, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      config: {Jiramax.IssueFieldOptionConfiguration, :t},
      properties: :map,
      value: {:string, :generic}
    ]
  end
end
