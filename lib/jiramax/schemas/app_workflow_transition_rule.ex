defmodule Jiramax.AppWorkflowTransitionRule do
  @moduledoc """
  Provides struct and type for a AppWorkflowTransitionRule
  """

  @type t :: %__MODULE__{
          configuration: Jiramax.RuleConfiguration.t(),
          id: String.t(),
          key: String.t(),
          transition: map | nil
        }

  defstruct [:configuration, :id, :key, :transition]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      configuration: {Jiramax.RuleConfiguration, :t},
      id: {:string, :generic},
      key: {:string, :generic},
      transition: :map
    ]
  end
end
