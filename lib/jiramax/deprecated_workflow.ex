defmodule Jiramax.DeprecatedWorkflow do
  @moduledoc """
  Provides struct and type for a DeprecatedWorkflow
  """

  @type t :: %__MODULE__{
          default: boolean | nil,
          description: String.t() | nil,
          lastModifiedDate: String.t() | nil,
          lastModifiedUser: String.t() | nil,
          lastModifiedUserAccountId: String.t() | nil,
          name: String.t() | nil,
          scope: map | nil,
          steps: integer | nil
        }

  defstruct [
    :default,
    :description,
    :lastModifiedDate,
    :lastModifiedUser,
    :lastModifiedUserAccountId,
    :name,
    :scope,
    :steps
  ]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      default: :boolean,
      description: {:string, :generic},
      lastModifiedDate: {:string, :generic},
      lastModifiedUser: {:string, :generic},
      lastModifiedUserAccountId: {:string, :generic},
      name: {:string, :generic},
      scope: :map,
      steps: :integer
    ]
  end
end
