defmodule Jiramax.WorkflowCreateRequest do
  @moduledoc """
  Provides struct and type for a WorkflowCreateRequest
  """

  @type t :: %__MODULE__{
          scope: Jiramax.WorkflowScope.t(),
          statuses: [Jiramax.WorkflowStatusUpdate.t()],
          workflows: [Jiramax.WorkflowCreate.t()]
        }

  defstruct [:scope, :statuses, :workflows]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      scope: {Jiramax.WorkflowScope, :t},
      statuses: [{Jiramax.WorkflowStatusUpdate, :t}],
      workflows: [{Jiramax.WorkflowCreate, :t}]
    ]
  end
end
