defmodule Jiramax.BulkIssuePropertyUpdateRequest do
  @moduledoc """
  Provides struct and type for a BulkIssuePropertyUpdateRequest
  """

  @type t :: %__MODULE__{expression: String.t() | nil, filter: map | nil, value: map | nil}

  defstruct [:expression, :filter, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expression: {:string, :generic}, filter: :map, value: :map]
  end
end
