defmodule Jiramax.AttachmentMetadata do
  @moduledoc """
  Provides struct and type for a AttachmentMetadata
  """

  @type t :: %__MODULE__{
          author: map | nil,
          content: String.t() | nil,
          created: DateTime.t() | nil,
          filename: String.t() | nil,
          id: integer | nil,
          mimeType: String.t() | nil,
          properties: map | nil,
          self: String.t() | nil,
          size: integer | nil,
          thumbnail: String.t() | nil
        }

  defstruct [
    :author,
    :content,
    :created,
    :filename,
    :id,
    :mimeType,
    :properties,
    :self,
    :size,
    :thumbnail
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      author: :map,
      content: {:string, :generic},
      created: {:string, :date_time},
      filename: {:string, :generic},
      id: :integer,
      mimeType: {:string, :generic},
      properties: :map,
      self: {:string, :uri},
      size: :integer,
      thumbnail: {:string, :generic}
    ]
  end
end
