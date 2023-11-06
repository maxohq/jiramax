defmodule Jiramax.StatusMappingDto do
  @moduledoc """
  Provides struct and type for a StatusMappingDto
  """

  @type t :: %__MODULE__{
          issueTypeId: String.t(),
          projectId: String.t(),
          statusMigrations: [Jiramax.StatusMigration.t()]
        }

  defstruct [:issueTypeId, :projectId, :statusMigrations]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      issueTypeId: {:string, :generic},
      projectId: {:string, :generic},
      statusMigrations: [{Jiramax.StatusMigration, :t}]
    ]
  end
end
