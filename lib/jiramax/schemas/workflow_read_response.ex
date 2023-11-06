defmodule Jiramax.WorkflowReadResponse do
  @moduledoc """
  Provides struct and type for a WorkflowReadResponse
  """

  @type t :: %__MODULE__{
          statuses: [Jiramax.JiraWorkflowStatus.t()] | nil,
          workflows: [Jiramax.JiraWorkflow.t()] | nil
        }

  defstruct [:statuses, :workflows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [statuses: [{Jiramax.JiraWorkflowStatus, :t}], workflows: [{Jiramax.JiraWorkflow, :t}]]
  end
end
