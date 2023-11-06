defmodule Jiramax.Version do
  @moduledoc """
  Provides struct and type for a Version
  """

  @type t :: %__MODULE__{
          approvers: [Jiramax.VersionApprover.t()] | nil,
          archived: boolean | nil,
          description: String.t() | nil,
          driver: String.t() | nil,
          expand: String.t() | nil,
          id: String.t() | nil,
          issuesStatusForFixVersion: map | nil,
          moveUnfixedIssuesTo: String.t() | nil,
          name: String.t() | nil,
          operations: [Jiramax.SimpleLink.t()] | nil,
          overdue: boolean | nil,
          project: String.t() | nil,
          projectId: integer | nil,
          releaseDate: Date.t() | nil,
          released: boolean | nil,
          self: String.t() | nil,
          startDate: Date.t() | nil,
          userReleaseDate: String.t() | nil,
          userStartDate: String.t() | nil
        }

  defstruct [
    :approvers,
    :archived,
    :description,
    :driver,
    :expand,
    :id,
    :issuesStatusForFixVersion,
    :moveUnfixedIssuesTo,
    :name,
    :operations,
    :overdue,
    :project,
    :projectId,
    :releaseDate,
    :released,
    :self,
    :startDate,
    :userReleaseDate,
    :userStartDate
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      approvers: [{Jiramax.VersionApprover, :t}],
      archived: :boolean,
      description: {:string, :generic},
      driver: {:string, :generic},
      expand: {:string, :generic},
      id: {:string, :generic},
      issuesStatusForFixVersion: :map,
      moveUnfixedIssuesTo: {:string, :uri},
      name: {:string, :generic},
      operations: [{Jiramax.SimpleLink, :t}],
      overdue: :boolean,
      project: {:string, :generic},
      projectId: :integer,
      releaseDate: {:string, :date},
      released: :boolean,
      self: {:string, :uri},
      startDate: {:string, :date},
      userReleaseDate: {:string, :generic},
      userStartDate: {:string, :generic}
    ]
  end
end
