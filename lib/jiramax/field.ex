defmodule Jiramax.Field do
  @moduledoc """
  Provides struct and type for a Field
  """

  @type t :: %__MODULE__{
          contextsCount: integer | nil,
          description: String.t() | nil,
          id: String.t(),
          isLocked: boolean | nil,
          isUnscreenable: boolean | nil,
          key: String.t() | nil,
          lastUsed: Jiramax.FieldLastUsed.t() | nil,
          name: String.t(),
          projectsCount: integer | nil,
          schema: Jiramax.JsonTypeBean.t(),
          screensCount: integer | nil,
          searcherKey: String.t() | nil
        }

  defstruct [
    :contextsCount,
    :description,
    :id,
    :isLocked,
    :isUnscreenable,
    :key,
    :lastUsed,
    :name,
    :projectsCount,
    :schema,
    :screensCount,
    :searcherKey
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      contextsCount: :integer,
      description: {:string, :generic},
      id: {:string, :generic},
      isLocked: :boolean,
      isUnscreenable: :boolean,
      key: {:string, :generic},
      lastUsed: {Jiramax.FieldLastUsed, :t},
      name: {:string, :generic},
      projectsCount: :integer,
      schema: {Jiramax.JsonTypeBean, :t},
      screensCount: :integer,
      searcherKey: {:string, :generic}
    ]
  end
end
