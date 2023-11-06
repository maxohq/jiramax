defmodule Jiramax.ValidationOptionsForCreate do
  @moduledoc """
  Provides struct and type for a ValidationOptionsForCreate
  """

  @type t :: %__MODULE__{levels: [String.t()] | nil}

  defstruct [:levels]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [levels: [enum: ["WARNING", "ERROR"]]]
  end
end
