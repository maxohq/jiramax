defmodule Jiramax.ProjectFeatures do
  @moduledoc """
  Provides API endpoints related to project features
  """

  @default_client Jiramax.Client

  @doc """
  Get project features

  Returns the list of features for a project.
  """
  @spec get_features_for_project(String.t(), keyword) ::
          {:ok, Jiramax.ContainerForProjectFeatures.t()} | :error
  def get_features_for_project(projectIdOrKey, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey],
      call: {Jiramax.ProjectFeatures, :get_features_for_project},
      url: "/rest/api/3/project/#{projectIdOrKey}/features",
      method: :get,
      response: [
        {200, {Jiramax.ContainerForProjectFeatures, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Set project feature state

  Sets the state of a project feature.
  """
  @spec toggle_feature_for_project(
          String.t(),
          String.t(),
          Jiramax.ProjectFeatureState.t(),
          keyword
        ) :: {:ok, Jiramax.ContainerForProjectFeatures.t()} | :error
  def toggle_feature_for_project(projectIdOrKey, featureKey, body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [projectIdOrKey: projectIdOrKey, featureKey: featureKey, body: body],
      call: {Jiramax.ProjectFeatures, :toggle_feature_for_project},
      url: "/rest/api/3/project/#{projectIdOrKey}/features/#{featureKey}",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.ProjectFeatureState, :t}}],
      response: [
        {200, {Jiramax.ContainerForProjectFeatures, :t}},
        {400, :null},
        {401, :null},
        {403, :null},
        {404, :null}
      ],
      opts: opts
    })
  end
end
