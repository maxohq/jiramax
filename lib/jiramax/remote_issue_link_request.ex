defmodule Jiramax.RemoteIssueLinkRequest do
  @moduledoc """
  Provides struct and type for a RemoteIssueLinkRequest
  """

  @type t :: %__MODULE__{
          application: map | nil,
          globalId: String.t() | nil,
          object: map,
          relationship: String.t() | nil
        }

  defstruct [:application, :globalId, :object, :relationship]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      application: :map,
      globalId: {:string, :generic},
      object: :map,
      relationship: {:string, :generic}
    ]
  end
end
