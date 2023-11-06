defmodule Jiramax.JiraStatus do
  @moduledoc """
  Provides struct and type for a JiraStatus
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          scope: Jiramax.StatusScope.t() | nil,
          statusCategory: String.t() | nil,
          usages: [Jiramax.ProjectIssueTypes.t()] | nil,
          workflowUsages: [Jiramax.WorkflowUsages.t()] | nil
        }

  defstruct [:description, :id, :name, :scope, :statusCategory, :usages, :workflowUsages]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      scope: {Jiramax.StatusScope, :t},
      statusCategory: {:enum, ["TODO", "IN_PROGRESS", "DONE"]},
      usages: [{Jiramax.ProjectIssueTypes, :t}],
      workflowUsages: [{Jiramax.WorkflowUsages, :t}]
    ]
  end
end
