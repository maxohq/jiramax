defmodule Jiramax.JiraWorkflowStatus do
  @moduledoc """
  Provides struct and type for a JiraWorkflowStatus
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          scope: Jiramax.WorkflowScope.t() | nil,
          statusCategory: String.t() | nil,
          statusReference: String.t() | nil,
          usages: [Jiramax.ProjectIssueTypes.t()] | nil
        }

  defstruct [:description, :id, :name, :scope, :statusCategory, :statusReference, :usages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      scope: {Jiramax.WorkflowScope, :t},
      statusCategory: {:enum, ["TODO", "IN_PROGRESS", "DONE"]},
      statusReference: {:string, :generic},
      usages: [{Jiramax.ProjectIssueTypes, :t}]
    ]
  end
end
