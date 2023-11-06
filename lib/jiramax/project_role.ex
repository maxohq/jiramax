defmodule Jiramax.ProjectRole do
  @moduledoc """
  Provides struct and type for a ProjectRole
  """

  @type t :: %__MODULE__{
          actors: [Jiramax.RoleActor.t()] | nil,
          admin: boolean | nil,
          currentUserRole: boolean | nil,
          default: boolean | nil,
          description: String.t() | nil,
          id: integer | nil,
          name: String.t() | nil,
          roleConfigurable: boolean | nil,
          scope: map | nil,
          self: String.t() | nil,
          translatedName: String.t() | nil
        }

  defstruct [
    :actors,
    :admin,
    :currentUserRole,
    :default,
    :description,
    :id,
    :name,
    :roleConfigurable,
    :scope,
    :self,
    :translatedName
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      actors: [{Jiramax.RoleActor, :t}],
      admin: :boolean,
      currentUserRole: :boolean,
      default: :boolean,
      description: {:string, :generic},
      id: :integer,
      name: {:string, :generic},
      roleConfigurable: :boolean,
      scope: :map,
      self: {:string, :uri},
      translatedName: {:string, :generic}
    ]
  end
end
