defmodule Jiramax.IssueTypeSchemeProjects do
  @moduledoc """
  Provides struct and type for a IssueTypeSchemeProjects
  """

  @type t :: %__MODULE__{issueTypeScheme: map, projectIds: [String.t()]}

  defstruct [:issueTypeScheme, :projectIds]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issueTypeScheme: :map, projectIds: [string: :generic]]
  end
end
