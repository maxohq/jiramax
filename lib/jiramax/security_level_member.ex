defmodule Jiramax.SecurityLevelMember do
  @moduledoc """
  Provides struct and type for a SecurityLevelMember
  """

  @type t :: %__MODULE__{
          holder: map,
          id: String.t(),
          issueSecurityLevelId: String.t(),
          issueSecuritySchemeId: String.t(),
          managed: boolean | nil
        }

  defstruct [:holder, :id, :issueSecurityLevelId, :issueSecuritySchemeId, :managed]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      holder: :map,
      id: {:string, :generic},
      issueSecurityLevelId: {:string, :generic},
      issueSecuritySchemeId: {:string, :generic},
      managed: :boolean
    ]
  end
end
