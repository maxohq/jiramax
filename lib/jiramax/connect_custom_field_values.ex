defmodule Jiramax.ConnectCustomFieldValues do
  @moduledoc """
  Provides struct and type for a ConnectCustomFieldValues
  """

  @type t :: %__MODULE__{updateValueList: [Jiramax.ConnectCustomFieldValue.t()] | nil}

  defstruct [:updateValueList]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [updateValueList: [{Jiramax.ConnectCustomFieldValue, :t}]]
  end
end
