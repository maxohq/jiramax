defmodule Jiramax.WorkflowRules do
  @moduledoc """
  Provides struct and type for a WorkflowRules
  """

  @type t :: %__MODULE__{
          conditionsTree:
            Jiramax.WorkflowCompoundCondition.t() | Jiramax.WorkflowSimpleCondition.t() | nil,
          postFunctions: [Jiramax.WorkflowTransitionRule.t()] | nil,
          validators: [Jiramax.WorkflowTransitionRule.t()] | nil
        }

  defstruct [:conditionsTree, :postFunctions, :validators]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conditionsTree:
        {:union, [{Jiramax.WorkflowCompoundCondition, :t}, {Jiramax.WorkflowSimpleCondition, :t}]},
      postFunctions: [{Jiramax.WorkflowTransitionRule, :t}],
      validators: [{Jiramax.WorkflowTransitionRule, :t}]
    ]
  end
end
