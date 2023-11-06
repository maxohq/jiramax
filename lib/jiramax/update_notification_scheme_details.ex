defmodule Jiramax.UpdateNotificationSchemeDetails do
  @moduledoc """
  Provides struct and type for a UpdateNotificationSchemeDetails
  """

  @type t :: %__MODULE__{description: String.t() | nil, name: String.t() | nil}

  defstruct [:description, :name]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [description: {:string, :generic}, name: {:string, :generic}]
  end
end
