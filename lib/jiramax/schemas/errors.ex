defmodule Jiramax.Errors do
  @moduledoc """
  Provides struct and type for a Errors
  """

  @type t :: %__MODULE__{
          issueIsSubtask: Jiramax.Error.t() | nil,
          issuesInArchivedProjects: Jiramax.Error.t() | nil,
          issuesInUnlicensedProjects: Jiramax.Error.t() | nil,
          issuesNotFound: Jiramax.Error.t() | nil
        }

  defstruct [
    :issueIsSubtask,
    :issuesInArchivedProjects,
    :issuesInUnlicensedProjects,
    :issuesNotFound
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      issueIsSubtask: {Jiramax.Error, :t},
      issuesInArchivedProjects: {Jiramax.Error, :t},
      issuesInUnlicensedProjects: {Jiramax.Error, :t},
      issuesNotFound: {Jiramax.Error, :t}
    ]
  end
end
