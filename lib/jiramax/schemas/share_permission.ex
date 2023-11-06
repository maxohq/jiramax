defmodule Jiramax.SharePermission do
  @moduledoc """
  Provides struct and type for a SharePermission
  """

  @type t :: %__MODULE__{
          group: map | nil,
          id: integer | nil,
          project: map | nil,
          role: map | nil,
          type: String.t(),
          user: map | nil
        }

  defstruct [:group, :id, :project, :role, :type, :user]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      group: :map,
      id: :integer,
      project: :map,
      role: :map,
      type:
        {:enum,
         [
           "user",
           "group",
           "project",
           "projectRole",
           "global",
           "loggedin",
           "authenticated",
           "project-unknown"
         ]},
      user: :map
    ]
  end
end
