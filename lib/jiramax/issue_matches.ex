defmodule Jiramax.IssueMatches do
  @moduledoc """
  Provides struct and type for a IssueMatches
  """

  @type t :: %__MODULE__{matches: [Jiramax.IssueMatchesForJql.t()]}

  defstruct [:matches]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [matches: [{Jiramax.IssueMatchesForJql, :t}]]
  end
end
