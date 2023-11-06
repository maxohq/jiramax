defmodule Jiramax.WorkflowCompoundCondition do
  @moduledoc """
  Provides struct and type for a WorkflowCompoundCondition
  """

  @type t :: %__MODULE__{
          conditions: [
            Jiramax.WorkflowCompoundCondition.t() | Jiramax.WorkflowSimpleCondition.t()
          ],
          nodeType: String.t(),
          operator: String.t()
        }

  defstruct [:conditions, :nodeType, :operator]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conditions: [
        union: [{Jiramax.WorkflowCompoundCondition, :t}, {Jiramax.WorkflowSimpleCondition, :t}]
      ],
      nodeType: {:string, :generic},
      operator: {:enum, ["AND", "OR"]}
    ]
  end
end
