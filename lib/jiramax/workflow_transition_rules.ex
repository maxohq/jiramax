defmodule Jiramax.WorkflowTransitionRules do
  @moduledoc """
  Provides API endpoints related to workflow transition rules
  """

  @default_client Jiramax.Client

  @type t :: %__MODULE__{
          conditions: [Jiramax.AppWorkflowTransitionRule.t()] | nil,
          postFunctions: [Jiramax.AppWorkflowTransitionRule.t()] | nil,
          validators: [Jiramax.AppWorkflowTransitionRule.t()] | nil,
          workflowId: Jiramax.WorkflowId.t()
        }

  defstruct [:conditions, :postFunctions, :validators, :workflowId]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [
      conditions: [{Jiramax.AppWorkflowTransitionRule, :t}],
      postFunctions: [{Jiramax.AppWorkflowTransitionRule, :t}],
      validators: [{Jiramax.AppWorkflowTransitionRule, :t}],
      workflowId: {Jiramax.WorkflowId, :t}
    ]
  end

  @doc """
  Delete workflow transition rule configurations

  Deletes workflow transition rules from one or more workflows. These rule types are supported:

   *  [post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/)
   *  [conditions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-condition/)
   *  [validators](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-validator/)

  Only rules created by the calling Connect app can be deleted.

  **[Permissions](#permissions) required:** Only Connect apps can use this operation.
  """
  @spec delete_workflow_transition_rule_configurations(
          Jiramax.WorkflowsWithTransitionRulesDetails.t(),
          keyword
        ) ::
          {:ok, Jiramax.WorkflowTransitionRulesUpdateErrors.t()}
          | {:error, Jiramax.ErrorCollection.t()}
  def delete_workflow_transition_rule_configurations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.WorkflowTransitionRules, :delete_workflow_transition_rule_configurations},
      url: "/rest/api/3/workflow/rule/config/delete",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.WorkflowsWithTransitionRulesDetails, :t}}],
      response: [
        {200, {Jiramax.WorkflowTransitionRulesUpdateErrors, :t}},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}}
      ],
      opts: opts
    })
  end

  @doc """
  Get workflow transition rule configurations

  Returns a [paginated](#pagination) list of workflows with transition rules. The workflows can be filtered to return only those containing workflow transition rules:

   *  of one or more transition rule types, such as [workflow post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/).
   *  matching one or more transition rule keys.

  Only workflows containing transition rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app are returned.

  Due to server-side optimizations, workflows with an empty list of rules may be returned; these workflows can be ignored.

  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.

  ## Options

    * `startAt`: The index of the first item to return in a page of results (page offset).
    * `maxResults`: The maximum number of items to return per page.
    * `types`: The types of the transition rules to return.
    * `keys`: The transition rule class keys, as defined in the Connect or the Forge app descriptor, of the transition rules to return.
    * `workflowNames`: The list of workflow names to filter by.
    * `withTags`: The list of `tags` to filter by.
    * `draft`: Whether draft or published workflows are returned. If not provided, both workflow types are returned.
    * `expand`: Use [expand](#expansion) to include additional information in the response. This parameter accepts `transition`, which, for each rule, returns information about the transition the rule is assigned to.

  """
  @spec get_workflow_transition_rule_configurations(keyword) ::
          {:ok, Jiramax.PageBeanWorkflowTransitionRules.t()}
          | {:error, Jiramax.ErrorCollection.t()}
  def get_workflow_transition_rule_configurations(opts \\ []) do
    client = opts[:client] || @default_client

    query =
      Keyword.take(opts, [
        :draft,
        :expand,
        :keys,
        :maxResults,
        :startAt,
        :types,
        :withTags,
        :workflowNames
      ])

    client.request(%{
      args: [],
      call: {Jiramax.WorkflowTransitionRules, :get_workflow_transition_rule_configurations},
      url: "/rest/api/3/workflow/rule/config",
      method: :get,
      query: query,
      response: [
        {200, {Jiramax.PageBeanWorkflowTransitionRules, :t}},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}},
        {404, :null},
        {503, :null}
      ],
      opts: opts
    })
  end

  @doc """
  Update workflow transition rule configurations

  Updates configuration of workflow transition rules. The following rule types are supported:

   *  [post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/)
   *  [conditions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-condition/)
   *  [validators](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-validator/)

  Only rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app can be updated.

  To assist with app migration, this operation can be used to:

   *  Disable a rule.
   *  Add a `tag`. Use this to filter rules in the [Get workflow transition rule configurations](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflow-transition-rules/#api-rest-api-3-workflow-rule-config-get).

  Rules are enabled if the `disabled` parameter is not provided.

  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.
  """
  @spec update_workflow_transition_rule_configurations(
          Jiramax.WorkflowTransitionRulesUpdate.t(),
          keyword
        ) ::
          {:ok, Jiramax.WorkflowTransitionRulesUpdateErrors.t()}
          | {:error, Jiramax.ErrorCollection.t()}
  def update_workflow_transition_rule_configurations(body, opts \\ []) do
    client = opts[:client] || @default_client

    client.request(%{
      args: [body: body],
      call: {Jiramax.WorkflowTransitionRules, :update_workflow_transition_rule_configurations},
      url: "/rest/api/3/workflow/rule/config",
      body: body,
      method: :put,
      request: [{"application/json", {Jiramax.WorkflowTransitionRulesUpdate, :t}}],
      response: [
        {200, {Jiramax.WorkflowTransitionRulesUpdateErrors, :t}},
        {400, {Jiramax.ErrorCollection, :t}},
        {403, {Jiramax.ErrorCollection, :t}},
        {503, :null}
      ],
      opts: opts
    })
  end
end
