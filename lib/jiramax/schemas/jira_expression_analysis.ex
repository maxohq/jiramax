defmodule Jiramax.JiraExpressionAnalysis do
  @moduledoc """
  Provides struct and type for a JiraExpressionAnalysis
  """

  @type t :: %__MODULE__{
          complexity: Jiramax.JiraExpressionComplexity.t() | nil,
          errors: [Jiramax.JiraExpressionValidationError.t()] | nil,
          expression: String.t(),
          type: String.t() | nil,
          valid: boolean
        }

  defstruct [:complexity, :errors, :expression, :type, :valid]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      complexity: {Jiramax.JiraExpressionComplexity, :t},
      errors: [{Jiramax.JiraExpressionValidationError, :t}],
      expression: {:string, :generic},
      type: {:string, :generic},
      valid: :boolean
    ]
  end
end
