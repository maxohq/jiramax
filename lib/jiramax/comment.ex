defmodule Jiramax.Comment do
  @moduledoc """
  Provides struct and type for a Comment
  """

  @type t :: %__MODULE__{
          author: map | nil,
          body: map | nil,
          created: DateTime.t() | nil,
          id: String.t() | nil,
          jsdAuthorCanSeeRequest: boolean | nil,
          jsdPublic: boolean | nil,
          properties: [Jiramax.EntityProperty.t()] | nil,
          renderedBody: String.t() | nil,
          self: String.t() | nil,
          updateAuthor: map | nil,
          updated: DateTime.t() | nil,
          visibility: map | nil
        }

  defstruct [
    :author,
    :body,
    :created,
    :id,
    :jsdAuthorCanSeeRequest,
    :jsdPublic,
    :properties,
    :renderedBody,
    :self,
    :updateAuthor,
    :updated,
    :visibility
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: :map,
      body: :map,
      created: {:string, :date_time},
      id: {:string, :generic},
      jsdAuthorCanSeeRequest: :boolean,
      jsdPublic: :boolean,
      properties: [{Jiramax.EntityProperty, :t}],
      renderedBody: {:string, :generic},
      self: {:string, :generic},
      updateAuthor: :map,
      updated: {:string, :date_time},
      visibility: :map
    ]
  end
end
