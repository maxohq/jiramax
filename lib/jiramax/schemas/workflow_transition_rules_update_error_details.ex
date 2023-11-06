defmodule Jiramax.WorkflowTransitionRulesUpdateErrorDetails do
  @moduledoc """
  Provides struct and type for a WorkflowTransitionRulesUpdateErrorDetails
  """

  @type t :: %__MODULE__{
          ruleUpdateErrors: map,
          updateErrors: [String.t()],
          workflowId: Jiramax.WorkflowId.t()
        }

  defstruct [:ruleUpdateErrors, :updateErrors, :workflowId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      ruleUpdateErrors: :map,
      updateErrors: [string: :generic],
      workflowId: {Jiramax.WorkflowId, :t}
    ]
  end
end
