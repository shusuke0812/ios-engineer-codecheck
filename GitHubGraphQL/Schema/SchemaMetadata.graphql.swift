// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol GitHubGraphQL_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GitHubGraphQL.SchemaMetadata {}

protocol GitHubGraphQL_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGraphQL.SchemaMetadata {}

protocol GitHubGraphQL_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GitHubGraphQL.SchemaMetadata {}

protocol GitHubGraphQL_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGraphQL.SchemaMetadata {}

extension GitHubGraphQL {
  typealias ID = String

  typealias SelectionSet = GitHubGraphQL_SelectionSet

  typealias InlineFragment = GitHubGraphQL_InlineFragment

  typealias MutableSelectionSet = GitHubGraphQL_MutableSelectionSet

  typealias MutableInlineFragment = GitHubGraphQL_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return GitHubGraphQL.Objects.Query
      case "SearchResultItemConnection": return GitHubGraphQL.Objects.SearchResultItemConnection
      case "App": return GitHubGraphQL.Objects.App
      case "CodeOfConduct": return GitHubGraphQL.Objects.CodeOfConduct
      case "Enterprise": return GitHubGraphQL.Objects.Enterprise
      case "Organization": return GitHubGraphQL.Objects.Organization
      case "EnterpriseUserAccount": return GitHubGraphQL.Objects.EnterpriseUserAccount
      case "Bot": return GitHubGraphQL.Objects.Bot
      case "Release": return GitHubGraphQL.Objects.Release
      case "Issue": return GitHubGraphQL.Objects.Issue
      case "PullRequest": return GitHubGraphQL.Objects.PullRequest
      case "Project": return GitHubGraphQL.Objects.Project
      case "ProjectV2": return GitHubGraphQL.Objects.ProjectV2
      case "TeamDiscussion": return GitHubGraphQL.Objects.TeamDiscussion
      case "TeamDiscussionComment": return GitHubGraphQL.Objects.TeamDiscussionComment
      case "CommitComment": return GitHubGraphQL.Objects.CommitComment
      case "DiscussionComment": return GitHubGraphQL.Objects.DiscussionComment
      case "IssueComment": return GitHubGraphQL.Objects.IssueComment
      case "Discussion": return GitHubGraphQL.Objects.Discussion
      case "Repository": return GitHubGraphQL.Objects.Repository
      case "User": return GitHubGraphQL.Objects.User
      case "Topic": return GitHubGraphQL.Objects.Topic
      case "Gist": return GitHubGraphQL.Objects.Gist
      case "Team": return GitHubGraphQL.Objects.Team
      case "Commit": return GitHubGraphQL.Objects.Commit
      case "Tree": return GitHubGraphQL.Objects.Tree
      case "Blob": return GitHubGraphQL.Objects.Blob
      case "Tag": return GitHubGraphQL.Objects.Tag
      case "DiscussionCategory": return GitHubGraphQL.Objects.DiscussionCategory
      case "PinnedDiscussion": return GitHubGraphQL.Objects.PinnedDiscussion
      case "RepositoryVulnerabilityAlert": return GitHubGraphQL.Objects.RepositoryVulnerabilityAlert
      case "DependabotUpdate": return GitHubGraphQL.Objects.DependabotUpdate
      case "PullRequestReview": return GitHubGraphQL.Objects.PullRequestReview
      case "PullRequestReviewComment": return GitHubGraphQL.Objects.PullRequestReviewComment
      case "CommitCommentThread": return GitHubGraphQL.Objects.CommitCommentThread
      case "PullRequestCommitCommentThread": return GitHubGraphQL.Objects.PullRequestCommitCommentThread
      case "GistComment": return GitHubGraphQL.Objects.GistComment
      case "Milestone": return GitHubGraphQL.Objects.Milestone
      case "Mannequin": return GitHubGraphQL.Objects.Mannequin
      case "CheckRun": return GitHubGraphQL.Objects.CheckRun
      case "StatusContext": return GitHubGraphQL.Objects.StatusContext
      case "WorkflowRun": return GitHubGraphQL.Objects.WorkflowRun
      case "WorkflowRunFile": return GitHubGraphQL.Objects.WorkflowRunFile
      case "Workflow": return GitHubGraphQL.Objects.Workflow
      case "RepositoryTopic": return GitHubGraphQL.Objects.RepositoryTopic
      case "PullRequestCommit": return GitHubGraphQL.Objects.PullRequestCommit
      case "ClosedEvent": return GitHubGraphQL.Objects.ClosedEvent
      case "CrossReferencedEvent": return GitHubGraphQL.Objects.CrossReferencedEvent
      case "MergedEvent": return GitHubGraphQL.Objects.MergedEvent
      case "ReviewDismissedEvent": return GitHubGraphQL.Objects.ReviewDismissedEvent
      case "ConvertToDraftEvent": return GitHubGraphQL.Objects.ConvertToDraftEvent
      case "ReadyForReviewEvent": return GitHubGraphQL.Objects.ReadyForReviewEvent
      case "EnterpriseServerInstallation": return GitHubGraphQL.Objects.EnterpriseServerInstallation
      case "EnterpriseServerUserAccount": return GitHubGraphQL.Objects.EnterpriseServerUserAccount
      case "EnterpriseServerUserAccountEmail": return GitHubGraphQL.Objects.EnterpriseServerUserAccountEmail
      case "EnterpriseServerUserAccountsUpload": return GitHubGraphQL.Objects.EnterpriseServerUserAccountsUpload
      case "Package": return GitHubGraphQL.Objects.Package
      case "PackageVersion": return GitHubGraphQL.Objects.PackageVersion
      case "PackageFile": return GitHubGraphQL.Objects.PackageFile
      case "ProjectColumn": return GitHubGraphQL.Objects.ProjectColumn
      case "ProjectCard": return GitHubGraphQL.Objects.ProjectCard
      case "UserContentEdit": return GitHubGraphQL.Objects.UserContentEdit
      case "Label": return GitHubGraphQL.Objects.Label
      case "ProjectV2Field": return GitHubGraphQL.Objects.ProjectV2Field
      case "ProjectV2IterationField": return GitHubGraphQL.Objects.ProjectV2IterationField
      case "ProjectV2SingleSelectField": return GitHubGraphQL.Objects.ProjectV2SingleSelectField
      case "ProjectV2Item": return GitHubGraphQL.Objects.ProjectV2Item
      case "DraftIssue": return GitHubGraphQL.Objects.DraftIssue
      case "ProjectV2ItemFieldDateValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldDateValue
      case "ProjectV2ItemFieldIterationValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldIterationValue
      case "ProjectV2ItemFieldNumberValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldNumberValue
      case "ProjectV2ItemFieldSingleSelectValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldSingleSelectValue
      case "ProjectV2ItemFieldTextValue": return GitHubGraphQL.Objects.ProjectV2ItemFieldTextValue
      case "UserStatus": return GitHubGraphQL.Objects.UserStatus
      case "Reaction": return GitHubGraphQL.Objects.Reaction
      case "OrganizationInvitation": return GitHubGraphQL.Objects.OrganizationInvitation
      case "ProjectV2View": return GitHubGraphQL.Objects.ProjectV2View
      case "ProjectV2Workflow": return GitHubGraphQL.Objects.ProjectV2Workflow
      case "License": return GitHubGraphQL.Objects.License
      case "BranchProtectionRule": return GitHubGraphQL.Objects.BranchProtectionRule
      case "Ref": return GitHubGraphQL.Objects.Ref
      case "Comparison": return GitHubGraphQL.Objects.Comparison
      case "CheckSuite": return GitHubGraphQL.Objects.CheckSuite
      case "IpAllowListEntry": return GitHubGraphQL.Objects.IpAllowListEntry
      case "Deployment": return GitHubGraphQL.Objects.Deployment
      case "DeploymentStatus": return GitHubGraphQL.Objects.DeploymentStatus
      case "Environment": return GitHubGraphQL.Objects.Environment
      case "Push": return GitHubGraphQL.Objects.Push
      case "DeploymentReview": return GitHubGraphQL.Objects.DeploymentReview
      case "Language": return GitHubGraphQL.Objects.Language
      case "Status": return GitHubGraphQL.Objects.Status
      case "StatusCheckRollup": return GitHubGraphQL.Objects.StatusCheckRollup
      case "BypassForcePushAllowance": return GitHubGraphQL.Objects.BypassForcePushAllowance
      case "BypassPullRequestAllowance": return GitHubGraphQL.Objects.BypassPullRequestAllowance
      case "PushAllowance": return GitHubGraphQL.Objects.PushAllowance
      case "ReviewDismissalAllowance": return GitHubGraphQL.Objects.ReviewDismissalAllowance
      case "DeployKey": return GitHubGraphQL.Objects.DeployKey
      case "DiscussionPoll": return GitHubGraphQL.Objects.DiscussionPoll
      case "DiscussionPollOption": return GitHubGraphQL.Objects.DiscussionPollOption
      case "MergeQueue": return GitHubGraphQL.Objects.MergeQueue
      case "MergeQueueEntry": return GitHubGraphQL.Objects.MergeQueueEntry
      case "PinnedIssue": return GitHubGraphQL.Objects.PinnedIssue
      case "RepositoryRuleset": return GitHubGraphQL.Objects.RepositoryRuleset
      case "RepositoryRulesetBypassActor": return GitHubGraphQL.Objects.RepositoryRulesetBypassActor
      case "RepositoryRule": return GitHubGraphQL.Objects.RepositoryRule
      case "SecurityAdvisory": return GitHubGraphQL.Objects.SecurityAdvisory
      case "CWE": return GitHubGraphQL.Objects.CWE
      case "ReviewRequest": return GitHubGraphQL.Objects.ReviewRequest
      case "PullRequestReviewThread": return GitHubGraphQL.Objects.PullRequestReviewThread
      case "AssignedEvent": return GitHubGraphQL.Objects.AssignedEvent
      case "BaseRefDeletedEvent": return GitHubGraphQL.Objects.BaseRefDeletedEvent
      case "BaseRefForcePushedEvent": return GitHubGraphQL.Objects.BaseRefForcePushedEvent
      case "DemilestonedEvent": return GitHubGraphQL.Objects.DemilestonedEvent
      case "DeployedEvent": return GitHubGraphQL.Objects.DeployedEvent
      case "DeploymentEnvironmentChangedEvent": return GitHubGraphQL.Objects.DeploymentEnvironmentChangedEvent
      case "HeadRefDeletedEvent": return GitHubGraphQL.Objects.HeadRefDeletedEvent
      case "HeadRefForcePushedEvent": return GitHubGraphQL.Objects.HeadRefForcePushedEvent
      case "HeadRefRestoredEvent": return GitHubGraphQL.Objects.HeadRefRestoredEvent
      case "LabeledEvent": return GitHubGraphQL.Objects.LabeledEvent
      case "LockedEvent": return GitHubGraphQL.Objects.LockedEvent
      case "MilestonedEvent": return GitHubGraphQL.Objects.MilestonedEvent
      case "ReferencedEvent": return GitHubGraphQL.Objects.ReferencedEvent
      case "RenamedTitleEvent": return GitHubGraphQL.Objects.RenamedTitleEvent
      case "ReopenedEvent": return GitHubGraphQL.Objects.ReopenedEvent
      case "ReviewRequestRemovedEvent": return GitHubGraphQL.Objects.ReviewRequestRemovedEvent
      case "ReviewRequestedEvent": return GitHubGraphQL.Objects.ReviewRequestedEvent
      case "SubscribedEvent": return GitHubGraphQL.Objects.SubscribedEvent
      case "UnassignedEvent": return GitHubGraphQL.Objects.UnassignedEvent
      case "UnlabeledEvent": return GitHubGraphQL.Objects.UnlabeledEvent
      case "UnlockedEvent": return GitHubGraphQL.Objects.UnlockedEvent
      case "UnsubscribedEvent": return GitHubGraphQL.Objects.UnsubscribedEvent
      case "UserBlockedEvent": return GitHubGraphQL.Objects.UserBlockedEvent
      case "AddedToMergeQueueEvent": return GitHubGraphQL.Objects.AddedToMergeQueueEvent
      case "AddedToProjectEvent": return GitHubGraphQL.Objects.AddedToProjectEvent
      case "AutoMergeDisabledEvent": return GitHubGraphQL.Objects.AutoMergeDisabledEvent
      case "AutoMergeEnabledEvent": return GitHubGraphQL.Objects.AutoMergeEnabledEvent
      case "AutoRebaseEnabledEvent": return GitHubGraphQL.Objects.AutoRebaseEnabledEvent
      case "AutoSquashEnabledEvent": return GitHubGraphQL.Objects.AutoSquashEnabledEvent
      case "AutomaticBaseChangeFailedEvent": return GitHubGraphQL.Objects.AutomaticBaseChangeFailedEvent
      case "AutomaticBaseChangeSucceededEvent": return GitHubGraphQL.Objects.AutomaticBaseChangeSucceededEvent
      case "BaseRefChangedEvent": return GitHubGraphQL.Objects.BaseRefChangedEvent
      case "CommentDeletedEvent": return GitHubGraphQL.Objects.CommentDeletedEvent
      case "ConnectedEvent": return GitHubGraphQL.Objects.ConnectedEvent
      case "ConvertedNoteToIssueEvent": return GitHubGraphQL.Objects.ConvertedNoteToIssueEvent
      case "ConvertedToDiscussionEvent": return GitHubGraphQL.Objects.ConvertedToDiscussionEvent
      case "DisconnectedEvent": return GitHubGraphQL.Objects.DisconnectedEvent
      case "MarkedAsDuplicateEvent": return GitHubGraphQL.Objects.MarkedAsDuplicateEvent
      case "MentionedEvent": return GitHubGraphQL.Objects.MentionedEvent
      case "MovedColumnsInProjectEvent": return GitHubGraphQL.Objects.MovedColumnsInProjectEvent
      case "PinnedEvent": return GitHubGraphQL.Objects.PinnedEvent
      case "RemovedFromMergeQueueEvent": return GitHubGraphQL.Objects.RemovedFromMergeQueueEvent
      case "RemovedFromProjectEvent": return GitHubGraphQL.Objects.RemovedFromProjectEvent
      case "TransferredEvent": return GitHubGraphQL.Objects.TransferredEvent
      case "UnmarkedAsDuplicateEvent": return GitHubGraphQL.Objects.UnmarkedAsDuplicateEvent
      case "UnpinnedEvent": return GitHubGraphQL.Objects.UnpinnedEvent
      case "LinkedBranch": return GitHubGraphQL.Objects.LinkedBranch
      case "SponsorsActivity": return GitHubGraphQL.Objects.SponsorsActivity
      case "SponsorsTier": return GitHubGraphQL.Objects.SponsorsTier
      case "Sponsorship": return GitHubGraphQL.Objects.Sponsorship
      case "SponsorsListing": return GitHubGraphQL.Objects.SponsorsListing
      case "SponsorsListingFeaturedItem": return GitHubGraphQL.Objects.SponsorsListingFeaturedItem
      case "SponsorshipNewsletter": return GitHubGraphQL.Objects.SponsorshipNewsletter
      case "PublicKey": return GitHubGraphQL.Objects.PublicKey
      case "SavedReply": return GitHubGraphQL.Objects.SavedReply
      case "ReleaseAsset": return GitHubGraphQL.Objects.ReleaseAsset
      case "MembersCanDeleteReposClearAuditEntry": return GitHubGraphQL.Objects.MembersCanDeleteReposClearAuditEntry
      case "MembersCanDeleteReposDisableAuditEntry": return GitHubGraphQL.Objects.MembersCanDeleteReposDisableAuditEntry
      case "MembersCanDeleteReposEnableAuditEntry": return GitHubGraphQL.Objects.MembersCanDeleteReposEnableAuditEntry
      case "OauthApplicationCreateAuditEntry": return GitHubGraphQL.Objects.OauthApplicationCreateAuditEntry
      case "OrgOauthAppAccessApprovedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessApprovedAuditEntry
      case "OrgOauthAppAccessBlockedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessBlockedAuditEntry
      case "OrgOauthAppAccessDeniedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessDeniedAuditEntry
      case "OrgOauthAppAccessRequestedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessRequestedAuditEntry
      case "OrgOauthAppAccessUnblockedAuditEntry": return GitHubGraphQL.Objects.OrgOauthAppAccessUnblockedAuditEntry
      case "OrgAddBillingManagerAuditEntry": return GitHubGraphQL.Objects.OrgAddBillingManagerAuditEntry
      case "OrgAddMemberAuditEntry": return GitHubGraphQL.Objects.OrgAddMemberAuditEntry
      case "OrgBlockUserAuditEntry": return GitHubGraphQL.Objects.OrgBlockUserAuditEntry
      case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
      case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
      case "OrgCreateAuditEntry": return GitHubGraphQL.Objects.OrgCreateAuditEntry
      case "OrgDisableOauthAppRestrictionsAuditEntry": return GitHubGraphQL.Objects.OrgDisableOauthAppRestrictionsAuditEntry
      case "OrgDisableSamlAuditEntry": return GitHubGraphQL.Objects.OrgDisableSamlAuditEntry
      case "OrgDisableTwoFactorRequirementAuditEntry": return GitHubGraphQL.Objects.OrgDisableTwoFactorRequirementAuditEntry
      case "OrgEnableOauthAppRestrictionsAuditEntry": return GitHubGraphQL.Objects.OrgEnableOauthAppRestrictionsAuditEntry
      case "OrgEnableSamlAuditEntry": return GitHubGraphQL.Objects.OrgEnableSamlAuditEntry
      case "OrgEnableTwoFactorRequirementAuditEntry": return GitHubGraphQL.Objects.OrgEnableTwoFactorRequirementAuditEntry
      case "OrgInviteMemberAuditEntry": return GitHubGraphQL.Objects.OrgInviteMemberAuditEntry
      case "OrgInviteToBusinessAuditEntry": return GitHubGraphQL.Objects.OrgInviteToBusinessAuditEntry
      case "OrgRemoveBillingManagerAuditEntry": return GitHubGraphQL.Objects.OrgRemoveBillingManagerAuditEntry
      case "OrgRemoveMemberAuditEntry": return GitHubGraphQL.Objects.OrgRemoveMemberAuditEntry
      case "OrgRemoveOutsideCollaboratorAuditEntry": return GitHubGraphQL.Objects.OrgRemoveOutsideCollaboratorAuditEntry
      case "OrgRestoreMemberAuditEntry": return GitHubGraphQL.Objects.OrgRestoreMemberAuditEntry
      case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GitHubGraphQL.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
      case "OrgUnblockUserAuditEntry": return GitHubGraphQL.Objects.OrgUnblockUserAuditEntry
      case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GitHubGraphQL.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
      case "OrgUpdateMemberAuditEntry": return GitHubGraphQL.Objects.OrgUpdateMemberAuditEntry
      case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GitHubGraphQL.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
      case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GitHubGraphQL.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
      case "PrivateRepositoryForkingDisableAuditEntry": return GitHubGraphQL.Objects.PrivateRepositoryForkingDisableAuditEntry
      case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GitHubGraphQL.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
      case "PrivateRepositoryForkingEnableAuditEntry": return GitHubGraphQL.Objects.PrivateRepositoryForkingEnableAuditEntry
      case "RepoAccessAuditEntry": return GitHubGraphQL.Objects.RepoAccessAuditEntry
      case "RepoAddMemberAuditEntry": return GitHubGraphQL.Objects.RepoAddMemberAuditEntry
      case "RepoAddTopicAuditEntry": return GitHubGraphQL.Objects.RepoAddTopicAuditEntry
      case "RepoRemoveTopicAuditEntry": return GitHubGraphQL.Objects.RepoRemoveTopicAuditEntry
      case "RepoArchivedAuditEntry": return GitHubGraphQL.Objects.RepoArchivedAuditEntry
      case "RepoChangeMergeSettingAuditEntry": return GitHubGraphQL.Objects.RepoChangeMergeSettingAuditEntry
      case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
      case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
      case "RepoConfigDisableContributorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableContributorsOnlyAuditEntry
      case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GitHubGraphQL.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
      case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
      case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
      case "RepoConfigEnableContributorsOnlyAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableContributorsOnlyAuditEntry
      case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GitHubGraphQL.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
      case "RepoConfigLockAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
      case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GitHubGraphQL.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
      case "RepoCreateAuditEntry": return GitHubGraphQL.Objects.RepoCreateAuditEntry
      case "RepoDestroyAuditEntry": return GitHubGraphQL.Objects.RepoDestroyAuditEntry
      case "RepoRemoveMemberAuditEntry": return GitHubGraphQL.Objects.RepoRemoveMemberAuditEntry
      case "TeamAddRepositoryAuditEntry": return GitHubGraphQL.Objects.TeamAddRepositoryAuditEntry
      case "OrgRestoreMemberMembershipTeamAuditEntryData": return GitHubGraphQL.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
      case "TeamAddMemberAuditEntry": return GitHubGraphQL.Objects.TeamAddMemberAuditEntry
      case "TeamChangeParentTeamAuditEntry": return GitHubGraphQL.Objects.TeamChangeParentTeamAuditEntry
      case "TeamRemoveMemberAuditEntry": return GitHubGraphQL.Objects.TeamRemoveMemberAuditEntry
      case "TeamRemoveRepositoryAuditEntry": return GitHubGraphQL.Objects.TeamRemoveRepositoryAuditEntry
      case "RepositoryVisibilityChangeDisableAuditEntry": return GitHubGraphQL.Objects.RepositoryVisibilityChangeDisableAuditEntry
      case "RepositoryVisibilityChangeEnableAuditEntry": return GitHubGraphQL.Objects.RepositoryVisibilityChangeEnableAuditEntry
      case "VerifiableDomain": return GitHubGraphQL.Objects.VerifiableDomain
      case "RepositoryMigration": return GitHubGraphQL.Objects.RepositoryMigration
      case "MigrationSource": return GitHubGraphQL.Objects.MigrationSource
      case "OrganizationIdentityProvider": return GitHubGraphQL.Objects.OrganizationIdentityProvider
      case "ExternalIdentity": return GitHubGraphQL.Objects.ExternalIdentity
      case "OIDCProvider": return GitHubGraphQL.Objects.OIDCProvider
      case "EnterpriseRepositoryInfo": return GitHubGraphQL.Objects.EnterpriseRepositoryInfo
      case "EnterpriseAdministratorInvitation": return GitHubGraphQL.Objects.EnterpriseAdministratorInvitation
      case "RepositoryInvitation": return GitHubGraphQL.Objects.RepositoryInvitation
      case "EnterpriseIdentityProvider": return GitHubGraphQL.Objects.EnterpriseIdentityProvider
      case "MarketplaceCategory": return GitHubGraphQL.Objects.MarketplaceCategory
      case "MarketplaceListing": return GitHubGraphQL.Objects.MarketplaceListing
      case "OrganizationMigration": return GitHubGraphQL.Objects.OrganizationMigration
      case "PackageTag": return GitHubGraphQL.Objects.PackageTag
      case "PullRequestThread": return GitHubGraphQL.Objects.PullRequestThread
      case "LanguageConnection": return GitHubGraphQL.Objects.LanguageConnection
      case "UserConnection": return GitHubGraphQL.Objects.UserConnection
      case "PageInfo": return GitHubGraphQL.Objects.PageInfo
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}