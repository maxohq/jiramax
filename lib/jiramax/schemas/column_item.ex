defmodule Jiramax.ColumnItem do
  @moduledoc """
  Provides struct and type for a ColumnItem
  """

  @type t :: %__MODULE__{label: String.t() | nil, value: String.t() | nil}

  defstruct [:label, :value]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [label: {:string, :generic}, value: {:string, :generic}]
  end
end
