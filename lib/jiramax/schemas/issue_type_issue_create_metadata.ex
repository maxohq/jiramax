defmodule Jiramax.IssueTypeIssueCreateMetadata do
  @moduledoc """
  Provides struct and type for a IssueTypeIssueCreateMetadata
  """

  @type t :: %__MODULE__{
          avatarId: integer | nil,
          description: String.t() | nil,
          entityId: String.t() | nil,
          expand: String.t() | nil,
          fields: map | nil,
          hierarchyLevel: integer | nil,
          iconUrl: String.t() | nil,
          id: String.t() | nil,
          name: String.t() | nil,
          scope: map | nil,
          self: String.t() | nil,
          subtask: boolean | nil
        }

  defstruct [
    :avatarId,
    :description,
    :entityId,
    :expand,
    :fields,
    :hierarchyLevel,
    :iconUrl,
    :id,
    :name,
    :scope,
    :self,
    :subtask
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      avatarId: :integer,
      description: {:string, :generic},
      entityId: {:string, :uuid},
      expand: {:string, :generic},
      fields: :map,
      hierarchyLevel: :integer,
      iconUrl: {:string, :generic},
      id: {:string, :generic},
      name: {:string, :generic},
      scope: :map,
      self: {:string, :generic},
      subtask: :boolean
    ]
  end
end
