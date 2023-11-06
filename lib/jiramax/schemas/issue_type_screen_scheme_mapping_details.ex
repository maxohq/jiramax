defmodule Jiramax.IssueTypeScreenSchemeMappingDetails do
  @moduledoc """
  Provides struct and type for a IssueTypeScreenSchemeMappingDetails
  """

  @type t :: %__MODULE__{issueTypeMappings: [Jiramax.IssueTypeScreenSchemeMapping.t()]}

  defstruct [:issueTypeMappings]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [issueTypeMappings: [{Jiramax.IssueTypeScreenSchemeMapping, :t}]]
  end
end
