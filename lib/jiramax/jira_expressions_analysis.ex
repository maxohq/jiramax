defmodule Jiramax.JiraExpressionsAnalysis do
  @moduledoc """
  Provides struct and type for a JiraExpressionsAnalysis
  """

  @type t :: %__MODULE__{results: [Jiramax.JiraExpressionAnalysis.t()]}

  defstruct [:results]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [results: [{Jiramax.JiraExpressionAnalysis, :t}]]
  end
end
