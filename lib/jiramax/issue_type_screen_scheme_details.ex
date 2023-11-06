defmodule Jiramax.IssueTypeScreenSchemeDetails do
  @moduledoc """
  Provides struct and type for a IssueTypeScreenSchemeDetails
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          issueTypeMappings: [Jiramax.IssueTypeScreenSchemeMapping.t()],
          name: String.t()
        }

  defstruct [:description, :issueTypeMappings, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      description: {:string, :generic},
      issueTypeMappings: [{Jiramax.IssueTypeScreenSchemeMapping, :t}],
      name: {:string, :generic}
    ]
  end
end
