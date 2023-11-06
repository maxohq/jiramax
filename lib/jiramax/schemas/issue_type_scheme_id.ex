defmodule Jiramax.IssueTypeSchemeId do
  @moduledoc """
  Provides struct and type for a IssueTypeSchemeId
  """

  @type t :: %__MODULE__{issueTypeSchemeId: String.t()}

  defstruct [:issueTypeSchemeId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issueTypeSchemeId: {:string, :generic}]
  end
end
