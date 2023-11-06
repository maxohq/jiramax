defmodule Jiramax.JiraWorkflow do
  @moduledoc """
  Provides struct and type for a JiraWorkflow
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          id: String.t() | nil,
          isEditable: boolean | nil,
          name: String.t() | nil,
          scope: Jiramax.WorkflowScope.t() | nil,
          startPointLayout: Jiramax.WorkflowLayout.t() | nil,
          statuses: [Jiramax.WorkflowReferenceStatus.t()] | nil,
          taskId: String.t() | nil,
          transitions: [Jiramax.WorkflowTransitions.t()] | nil,
          usages: [Jiramax.ProjectIssueTypes.t()] | nil,
          version: Jiramax.DocumentVersion.t() | nil
        }

  defstruct [
    :description,
    :id,
    :isEditable,
    :name,
    :scope,
    :startPointLayout,
    :statuses,
    :taskId,
    :transitions,
    :usages,
    :version
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      id: {:string, :generic},
      isEditable: :boolean,
      name: {:string, :generic},
      scope: {Jiramax.WorkflowScope, :t},
      startPointLayout: {Jiramax.WorkflowLayout, :t},
      statuses: [{Jiramax.WorkflowReferenceStatus, :t}],
      taskId: {:string, :generic},
      transitions: [{Jiramax.WorkflowTransitions, :t}],
      usages: [{Jiramax.ProjectIssueTypes, :t}],
      version: {Jiramax.DocumentVersion, :t}
    ]
  end
end
