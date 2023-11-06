defmodule Jiramax.WorkflowTransitions do
  @moduledoc """
  Provides struct and type for a WorkflowTransitions
  """

  @type t :: %__MODULE__{
          actions: [Jiramax.WorkflowRuleConfiguration.t()] | nil,
          conditions: Jiramax.ConditionGroupConfiguration.t() | nil,
          customIssueEventId: String.t() | nil,
          description: String.t() | nil,
          from: [Jiramax.WorkflowStatusAndPort.t()] | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          properties: map | nil,
          to: Jiramax.WorkflowStatusAndPort.t() | nil,
          transitionScreen: Jiramax.WorkflowRuleConfiguration.t() | nil,
          triggers: [Jiramax.WorkflowTrigger.t()] | nil,
          type: String.t() | nil,
          validators: [Jiramax.WorkflowRuleConfiguration.t()] | nil
        }

  defstruct [
    :actions,
    :conditions,
    :customIssueEventId,
    :description,
    :from,
    :id,
    :name,
    :properties,
    :to,
    :transitionScreen,
    :triggers,
    :type,
    :validators
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actions: [{Jiramax.WorkflowRuleConfiguration, :t}],
      conditions: {Jiramax.ConditionGroupConfiguration, :t},
      customIssueEventId: {:string, :generic},
      description: {:string, :generic},
      from: [{Jiramax.WorkflowStatusAndPort, :t}],
      id: {:string, :generic},
      name: {:string, :generic},
      properties: :map,
      to: {Jiramax.WorkflowStatusAndPort, :t},
      transitionScreen: {Jiramax.WorkflowRuleConfiguration, :t},
      triggers: [{Jiramax.WorkflowTrigger, :t}],
      type: {:enum, ["INITIAL", "GLOBAL", "DIRECTED"]},
      validators: [{Jiramax.WorkflowRuleConfiguration, :t}]
    ]
  end
end
