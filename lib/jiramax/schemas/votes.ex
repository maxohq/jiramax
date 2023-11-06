defmodule Jiramax.Votes do
  @moduledoc """
  Provides struct and type for a Votes
  """

  @type t :: %__MODULE__{
          hasVoted: boolean | nil,
          self: String.t() | nil,
          voters: [Jiramax.User.t()] | nil,
          votes: integer | nil
        }

  defstruct [:hasVoted, :self, :voters, :votes]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [hasVoted: :boolean, self: {:string, :uri}, voters: [{Jiramax.User, :t}], votes: :integer]
  end
end
