defmodule Jiramax.WorkflowSchemeReadResponse do
  @moduledoc """
  Provides struct and type for a WorkflowSchemeReadResponse
  """

  @type t :: %__MODULE__{
          defaultWorkflow: Jiramax.WorkflowMetadataRestModel.t() | nil,
          description: String.t() | nil,
          id: String.t(),
          name: String.t(),
          projectIdsUsingScheme: [String.t()],
          scope: Jiramax.WorkflowScope.t(),
          taskId: String.t() | nil,
          version: Jiramax.DocumentVersion.t(),
          workflowsForIssueTypes: [Jiramax.WorkflowMetadataAndIssueTypeRestModel.t()]
        }

  defstruct [
    :defaultWorkflow,
    :description,
    :id,
    :name,
    :projectIdsUsingScheme,
    :scope,
    :taskId,
    :version,
    :workflowsForIssueTypes
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      defaultWorkflow: {Jiramax.WorkflowMetadataRestModel, :t},
      description: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      projectIdsUsingScheme: [string: :generic],
      scope: {Jiramax.WorkflowScope, :t},
      taskId: {:string, :generic},
      version: {Jiramax.DocumentVersion, :t},
      workflowsForIssueTypes: [{Jiramax.WorkflowMetadataAndIssueTypeRestModel, :t}]
    ]
  end
end
