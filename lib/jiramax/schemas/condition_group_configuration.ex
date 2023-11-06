defmodule Jiramax.ConditionGroupConfiguration do
  @moduledoc """
  Provides struct and type for a ConditionGroupConfiguration
  """

  @type t :: %__MODULE__{
          conditionGroups: [Jiramax.ConditionGroupConfiguration.t()] | nil,
          conditions: [Jiramax.WorkflowRuleConfiguration.t()] | nil,
          operation: String.t() | nil
        }

  defstruct [:conditionGroups, :conditions, :operation]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conditionGroups: [{Jiramax.ConditionGroupConfiguration, :t}],
      conditions: [{Jiramax.WorkflowRuleConfiguration, :t}],
      operation: {:enum, ["ANY", "ALL"]}
    ]
  end
end
