defmodule Jiramax.TransitionUpdateDto do
  @moduledoc """
  Provides struct and type for a TransitionUpdateDto
  """

  @type t :: %__MODULE__{
          actions: [Jiramax.WorkflowRuleConfiguration.t()] | nil,
          conditions: Jiramax.ConditionGroupUpdate.t() | nil,
          customIssueEventId: String.t() | nil,
          description: String.t() | nil,
          from: [Jiramax.StatusReferenceAndPort.t()] | nil,
          id: String.t(),
          name: String.t(),
          properties: map | nil,
          to: Jiramax.StatusReferenceAndPort.t() | nil,
          transitionScreen: Jiramax.WorkflowRuleConfiguration.t() | nil,
          triggers: [Jiramax.WorkflowTrigger.t()] | nil,
          type: String.t(),
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
      conditions: {Jiramax.ConditionGroupUpdate, :t},
      customIssueEventId: {:string, :generic},
      description: {:string, :generic},
      from: [{Jiramax.StatusReferenceAndPort, :t}],
      id: {:string, :generic},
      name: {:string, :generic},
      properties: :map,
      to: {Jiramax.StatusReferenceAndPort, :t},
      transitionScreen: {Jiramax.WorkflowRuleConfiguration, :t},
      triggers: [{Jiramax.WorkflowTrigger, :t}],
      type: {:enum, ["INITIAL", "GLOBAL", "DIRECTED"]},
      validators: [{Jiramax.WorkflowRuleConfiguration, :t}]
    ]
  end
end
