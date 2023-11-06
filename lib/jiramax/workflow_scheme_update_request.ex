defmodule Jiramax.WorkflowSchemeUpdateRequest do
  @moduledoc """
  Provides struct and type for a WorkflowSchemeUpdateRequest
  """

  @type t :: %__MODULE__{
          defaultWorkflowId: String.t() | nil,
          description: String.t(),
          id: String.t(),
          name: String.t(),
          statusMappingsByIssueTypeOverride: [Jiramax.MappingsByIssueTypeOverride.t()] | nil,
          statusMappingsByWorkflows: [Jiramax.MappingsByWorkflow.t()] | nil,
          version: Jiramax.DocumentVersion.t(),
          workflowsForIssueTypes: [Jiramax.WorkflowSchemeAssociation.t()] | nil
        }

  defstruct [
    :defaultWorkflowId,
    :description,
    :id,
    :name,
    :statusMappingsByIssueTypeOverride,
    :statusMappingsByWorkflows,
    :version,
    :workflowsForIssueTypes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      defaultWorkflowId: {:string, :generic},
      description: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      statusMappingsByIssueTypeOverride: [{Jiramax.MappingsByIssueTypeOverride, :t}],
      statusMappingsByWorkflows: [{Jiramax.MappingsByWorkflow, :t}],
      version: {Jiramax.DocumentVersion, :t},
      workflowsForIssueTypes: [{Jiramax.WorkflowSchemeAssociation, :t}]
    ]
  end
end
