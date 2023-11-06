defmodule Jiramax.ParsedJqlQueries do
  @moduledoc """
  Provides struct and type for a ParsedJqlQueries
  """

  @type t :: %__MODULE__{queries: [Jiramax.ParsedJqlQuery.t()]}

  defstruct [:queries]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [queries: [{Jiramax.ParsedJqlQuery, :t}]]
  end
end
