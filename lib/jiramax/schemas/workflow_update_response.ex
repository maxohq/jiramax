defmodule Jiramax.WorkflowUpdateResponse do
  @moduledoc """
  Provides struct and type for a WorkflowUpdateResponse
  """

  @type t :: %__MODULE__{
          statuses: [Jiramax.JiraWorkflowStatus.t()] | nil,
          taskId: String.t() | nil,
          workflows: [Jiramax.JiraWorkflow.t()] | nil
        }

  defstruct [:statuses, :taskId, :workflows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      statuses: [{Jiramax.JiraWorkflowStatus, :t}],
      taskId: {:string, :generic},
      workflows: [{Jiramax.JiraWorkflow, :t}]
    ]
  end
end
