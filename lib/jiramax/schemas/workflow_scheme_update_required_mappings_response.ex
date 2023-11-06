defmodule Jiramax.WorkflowSchemeUpdateRequiredMappingsResponse do
  @moduledoc """
  Provides struct and type for a WorkflowSchemeUpdateRequiredMappingsResponse
  """

  @type t :: %__MODULE__{
          statusMappingsByIssueTypes: [Jiramax.RequiredMappingByIssueType.t()] | nil,
          statusMappingsByWorkflows: [Jiramax.RequiredMappingByWorkflows.t()] | nil,
          statuses: [Jiramax.StatusMetadata.t()] | nil,
          statusesPerWorkflow: [Jiramax.StatusesPerWorkflow.t()] | nil
        }

  defstruct [
    :statusMappingsByIssueTypes,
    :statusMappingsByWorkflows,
    :statuses,
    :statusesPerWorkflow
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      statusMappingsByIssueTypes: [{Jiramax.RequiredMappingByIssueType, :t}],
      statusMappingsByWorkflows: [{Jiramax.RequiredMappingByWorkflows, :t}],
      statuses: [{Jiramax.StatusMetadata, :t}],
      statusesPerWorkflow: [{Jiramax.StatusesPerWorkflow, :t}]
    ]
  end
end
