defmodule Jiramax.UpdateScreenSchemeDetails do
  @moduledoc """
  Provides struct and type for a UpdateScreenSchemeDetails
  """

  @type t :: %__MODULE__{
          description: String.t() | nil,
          name: String.t() | nil,
          screens: map | nil
        }

  defstruct [:description, :name, :screens]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: {:string, :generic}, name: {:string, :generic}, screens: :map]
  end
end
