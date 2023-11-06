defmodule Jiramax.Workflow do
  @moduledoc """
  Provides struct and type for a Workflow
  """

  @type t :: %__MODULE__{
          created: DateTime.t() | nil,
          description: String.t(),
          hasDraftWorkflow: boolean | nil,
          id: Jiramax.PublishedWorkflowId.t(),
          isDefault: boolean | nil,
          operations: Jiramax.WorkflowOperations.t() | nil,
          projects: [Jiramax.ProjectDetails.t()] | nil,
          schemes: [Jiramax.WorkflowSchemeIdName.t()] | nil,
          statuses: [Jiramax.WorkflowStatus.t()] | nil,
          transitions: [Jiramax.Transition.t()] | nil,
          updated: DateTime.t() | nil
        }

  defstruct [
    :created,
    :description,
    :hasDraftWorkflow,
    :id,
    :isDefault,
    :operations,
    :projects,
    :schemes,
    :statuses,
    :transitions,
    :updated
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      created: {:string, :date_time},
      description: {:string, :generic},
      hasDraftWorkflow: :boolean,
      id: {Jiramax.PublishedWorkflowId, :t},
      isDefault: :boolean,
      operations: {Jiramax.WorkflowOperations, :t},
      projects: [{Jiramax.ProjectDetails, :t}],
      schemes: [{Jiramax.WorkflowSchemeIdName, :t}],
      statuses: [{Jiramax.WorkflowStatus, :t}],
      transitions: [{Jiramax.Transition, :t}],
      updated: {:string, :date_time}
    ]
  end
end
