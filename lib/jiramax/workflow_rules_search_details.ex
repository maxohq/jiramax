defmodule Jiramax.WorkflowRulesSearchDetails do
  @moduledoc """
  Provides struct and type for a WorkflowRulesSearchDetails
  """

  @type t :: %__MODULE__{
          invalidRules: [String.t()] | nil,
          validRules: [Jiramax.WorkflowTransitionRules.t()] | nil,
          workflowEntityId: String.t() | nil
        }

  defstruct [:invalidRules, :validRules, :workflowEntityId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      invalidRules: [string: :uuid],
      validRules: [{Jiramax.WorkflowTransitionRules, :t}],
      workflowEntityId: {:string, :uuid}
    ]
  end
end
