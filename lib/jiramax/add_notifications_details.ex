defmodule Jiramax.AddNotificationsDetails do
  @moduledoc """
  Provides struct and type for a AddNotificationsDetails
  """

  @type t :: %__MODULE__{notificationSchemeEvents: [Jiramax.NotificationSchemeEventDetails.t()]}

  defstruct [:notificationSchemeEvents]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [notificationSchemeEvents: [{Jiramax.NotificationSchemeEventDetails, :t}]]
  end
end
