defmodule Jiramax.FoundUsers do
  @moduledoc """
  Provides struct and type for a FoundUsers
  """

  @type t :: %__MODULE__{
          header: String.t() | nil,
          total: integer | nil,
          users: [Jiramax.UserPickerUser.t()] | nil
        }

  defstruct [:header, :total, :users]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [header: {:string, :generic}, total: :integer, users: [{Jiramax.UserPickerUser, :t}]]
  end
end
