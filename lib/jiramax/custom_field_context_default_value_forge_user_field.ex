defmodule Jiramax.CustomFieldContextDefaultValueForgeUserField do
  @moduledoc """
  Provides struct and type for a CustomFieldContextDefaultValueForgeUserField
  """

  @type t :: %__MODULE__{
          accountId: String.t(),
          contextId: String.t(),
          type: String.t(),
          userFilter: Jiramax.UserFilter.t()
        }

  defstruct [:accountId, :contextId, :type, :userFilter]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      accountId: {:string, :generic},
      contextId: {:string, :generic},
      type: {:string, :generic},
      userFilter: {Jiramax.UserFilter, :t}
    ]
  end
end
