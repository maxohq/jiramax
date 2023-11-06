defmodule Jiramax.ConnectModules do
  @moduledoc """
  Provides struct and type for a ConnectModules
  """

  @type t :: %__MODULE__{modules: [Jiramax.ConnectModule.t()]}

  defstruct [:modules]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [modules: [{Jiramax.ConnectModule, :t}]]
  end
end
