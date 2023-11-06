defmodule Jiramax.ProjectIssueCreateMetadata do
  @moduledoc """
  Provides struct and type for a ProjectIssueCreateMetadata
  """

  @type t :: %__MODULE__{
          avatarUrls: map | nil,
          expand: String.t() | nil,
          id: String.t() | nil,
          issuetypes: [Jiramax.IssueTypeIssueCreateMetadata.t()] | nil,
          key: String.t() | nil,
          name: String.t() | nil,
          self: String.t() | nil
        }

  defstruct [:avatarUrls, :expand, :id, :issuetypes, :key, :name, :self]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatarUrls: :map,
      expand: {:string, :generic},
      id: {:string, :generic},
      issuetypes: [{Jiramax.IssueTypeIssueCreateMetadata, :t}],
      key: {:string, :generic},
      name: {:string, :generic},
      self: {:string, :generic}
    ]
  end
end
