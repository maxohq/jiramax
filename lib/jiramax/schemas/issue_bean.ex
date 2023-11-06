defmodule Jiramax.IssueBean do
  @moduledoc """
  Provides struct and type for a IssueBean
  """

  @type t :: %__MODULE__{
          changelog: map | nil,
          editmeta: map | nil,
          expand: String.t() | nil,
          fields: map | nil,
          fieldsToInclude: Jiramax.IncludedFields.t() | nil,
          id: String.t() | nil,
          key: String.t() | nil,
          names: map | nil,
          operations: map | nil,
          properties: map | nil,
          renderedFields: map | nil,
          schema: map | nil,
          self: String.t() | nil,
          transitions: [Jiramax.IssueTransition.t()] | nil,
          versionedRepresentations: map | nil
        }

  defstruct [
    :changelog,
    :editmeta,
    :expand,
    :fields,
    :fieldsToInclude,
    :id,
    :key,
    :names,
    :operations,
    :properties,
    :renderedFields,
    :schema,
    :self,
    :transitions,
    :versionedRepresentations
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      changelog: :map,
      editmeta: :map,
      expand: {:string, :generic},
      fields: :map,
      fieldsToInclude: {Jiramax.IncludedFields, :t},
      id: {:string, :generic},
      key: {:string, :generic},
      names: :map,
      operations: :map,
      properties: :map,
      renderedFields: :map,
      schema: :map,
      self: {:string, :uri},
      transitions: [{Jiramax.IssueTransition, :t}],
      versionedRepresentations: :map
    ]
  end
end
