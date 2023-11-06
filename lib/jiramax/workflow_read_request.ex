defmodule Jiramax.WorkflowReadRequest do
  @moduledoc """
  Provides struct and type for a WorkflowReadRequest
  """

  @type t :: %__MODULE__{
          projectAndIssueTypes: [Jiramax.ProjectAndIssueTypePair.t()] | nil,
          workflowIds: [String.t()] | nil,
          workflowNames: [String.t()] | nil
        }

  defstruct [:projectAndIssueTypes, :workflowIds, :workflowNames]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      projectAndIssueTypes: [{Jiramax.ProjectAndIssueTypePair, :t}],
      workflowIds: [string: :generic],
      workflowNames: [string: :generic]
    ]
  end
end
