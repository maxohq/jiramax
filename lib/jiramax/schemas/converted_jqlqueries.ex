defmodule Jiramax.ConvertedJqlqueries do
  @moduledoc """
  Provides struct and type for a ConvertedJqlqueries
  """

  @type t :: %__MODULE__{
          queriesWithUnknownUsers: [Jiramax.JqlqueryWithUnknownUsers.t()] | nil,
          queryStrings: [String.t()] | nil
        }

  defstruct [:queriesWithUnknownUsers, :queryStrings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      queriesWithUnknownUsers: [{Jiramax.JqlqueryWithUnknownUsers, :t}],
      queryStrings: [string: :generic]
    ]
  end
end
