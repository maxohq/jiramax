defmodule Jiramax.JiraExpressionComplexity do
  @moduledoc """
  Provides struct and type for a JiraExpressionComplexity
  """

  @type t :: %__MODULE__{expensiveOperations: String.t(), variables: map | nil}

  defstruct [:expensiveOperations, :variables]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expensiveOperations: {:string, :generic}, variables: :map]
  end
end
