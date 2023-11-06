defmodule Jiramax.ConditionGroupUpdate do
  @moduledoc """
  Provides struct and type for a ConditionGroupUpdate
  """

  @type t :: %__MODULE__{
          conditionGroups: [Jiramax.ConditionGroupUpdate.t()] | nil,
          conditions: [Jiramax.WorkflowRuleConfiguration.t()] | nil,
          operation: String.t()
        }

  defstruct [:conditionGroups, :conditions, :operation]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conditionGroups: [{Jiramax.ConditionGroupUpdate, :t}],
      conditions: [{Jiramax.WorkflowRuleConfiguration, :t}],
      operation: {:enum, ["ANY", "ALL"]}
    ]
  end
end
