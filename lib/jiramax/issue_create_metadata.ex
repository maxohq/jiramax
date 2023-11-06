defmodule Jiramax.IssueCreateMetadata do
  @moduledoc """
  Provides struct and type for a IssueCreateMetadata
  """

  @type t :: %__MODULE__{
          expand: String.t() | nil,
          projects: [Jiramax.ProjectIssueCreateMetadata.t()] | nil
        }

  defstruct [:expand, :projects]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [expand: {:string, :generic}, projects: [{Jiramax.ProjectIssueCreateMetadata, :t}]]
  end
end
