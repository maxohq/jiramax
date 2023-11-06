defmodule Jiramax.SystemAvatars do
  @moduledoc """
  Provides struct and type for a SystemAvatars
  """

  @type t :: %__MODULE__{system: [Jiramax.Avatar.t()] | nil}

  defstruct [:system]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [system: [{Jiramax.Avatar, :t}]]
  end
end
