defmodule Jiramax.FoundUsersAndGroups do
  @moduledoc """
  Provides struct and type for a FoundUsersAndGroups
  """

  @type t :: %__MODULE__{
          groups: Jiramax.FoundGroups.t() | nil,
          users: Jiramax.FoundUsers.t() | nil
        }

  defstruct [:groups, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [groups: {Jiramax.FoundGroups, :t}, users: {Jiramax.FoundUsers, :t}]
  end
end
