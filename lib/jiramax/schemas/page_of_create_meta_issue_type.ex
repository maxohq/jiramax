defmodule Jiramax.PageOfCreateMetaIssueType do
  @moduledoc """
  Provides struct and type for a PageOfCreateMetaIssueType
  """

  @type t :: %__MODULE__{
          createMetaIssueType: [Jiramax.IssueTypeIssueCreateMetadata.t()] | nil,
          issueTypes: [Jiramax.IssueTypeIssueCreateMetadata.t()] | nil,
          maxResults: integer | nil,
          startAt: integer | nil,
          total: integer | nil
        }

  defstruct [:createMetaIssueType, :issueTypes, :maxResults, :startAt, :total]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      createMetaIssueType: [{Jiramax.IssueTypeIssueCreateMetadata, :t}],
      issueTypes: [{Jiramax.IssueTypeIssueCreateMetadata, :t}],
      maxResults: :integer,
      startAt: :integer,
      total: :integer
    ]
  end
end
