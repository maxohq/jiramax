defmodule Jiramax.ScreenSchemeId do
  @moduledoc """
  Provides struct and type for a ScreenSchemeId
  """

  @type t :: %__MODULE__{id: integer}

  defstruct [:id]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [id: :integer]
  end
end
