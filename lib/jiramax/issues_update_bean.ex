defmodule Jiramax.IssuesUpdateBean do
  @moduledoc """
  Provides struct and type for a IssuesUpdateBean
  """

  @type t :: %__MODULE__{issueUpdates: [Jiramax.IssueUpdateDetails.t()] | nil}

  defstruct [:issueUpdates]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issueUpdates: [{Jiramax.IssueUpdateDetails, :t}]]
  end
end
