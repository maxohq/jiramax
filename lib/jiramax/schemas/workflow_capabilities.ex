defmodule Jiramax.WorkflowCapabilities do
  @moduledoc """
  Provides struct and type for a WorkflowCapabilities
  """

  @type t :: %__MODULE__{
          connectRules: [Jiramax.AvailableWorkflowConnectRule.t()] | nil,
          editorScope: String.t() | nil,
          forgeRules: [Jiramax.AvailableWorkflowForgeRule.t()] | nil,
          projectTypes: String.t() | nil,
          systemRules: [Jiramax.AvailableWorkflowSystemRule.t()] | nil,
          triggerRules: [Jiramax.AvailableWorkflowTriggers.t()] | nil
        }

  defstruct [:connectRules, :editorScope, :forgeRules, :projectTypes, :systemRules, :triggerRules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      connectRules: [{Jiramax.AvailableWorkflowConnectRule, :t}],
      editorScope: {:enum, ["PROJECT", "GLOBAL"]},
      forgeRules: [{Jiramax.AvailableWorkflowForgeRule, :t}],
      projectTypes:
        {:enum, ["software", "service_desk", "product_discovery", "business", "unknown"]},
      systemRules: [{Jiramax.AvailableWorkflowSystemRule, :t}],
      triggerRules: [{Jiramax.AvailableWorkflowTriggers, :t}]
    ]
  end
end
