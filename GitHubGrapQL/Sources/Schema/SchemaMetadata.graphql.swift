// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GitHubGrapQL.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGrapQL.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GitHubGrapQL.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGrapQL.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Query": return GitHubGrapQL.Objects.Query
    case "SearchResultItemConnection": return GitHubGrapQL.Objects.SearchResultItemConnection
    case "App": return GitHubGrapQL.Objects.App
    case "CodeOfConduct": return GitHubGrapQL.Objects.CodeOfConduct
    case "Enterprise": return GitHubGrapQL.Objects.Enterprise
    case "Organization": return GitHubGrapQL.Objects.Organization
    case "EnterpriseUserAccount": return GitHubGrapQL.Objects.EnterpriseUserAccount
    case "Bot": return GitHubGrapQL.Objects.Bot
    case "Release": return GitHubGrapQL.Objects.Release
    case "Issue": return GitHubGrapQL.Objects.Issue
    case "PullRequest": return GitHubGrapQL.Objects.PullRequest
    case "Project": return GitHubGrapQL.Objects.Project
    case "ProjectV2": return GitHubGrapQL.Objects.ProjectV2
    case "TeamDiscussion": return GitHubGrapQL.Objects.TeamDiscussion
    case "TeamDiscussionComment": return GitHubGrapQL.Objects.TeamDiscussionComment
    case "CommitComment": return GitHubGrapQL.Objects.CommitComment
    case "DiscussionComment": return GitHubGrapQL.Objects.DiscussionComment
    case "IssueComment": return GitHubGrapQL.Objects.IssueComment
    case "Discussion": return GitHubGrapQL.Objects.Discussion
    case "Repository": return GitHubGrapQL.Objects.Repository
    case "User": return GitHubGrapQL.Objects.User
    case "Topic": return GitHubGrapQL.Objects.Topic
    case "Gist": return GitHubGrapQL.Objects.Gist
    case "Team": return GitHubGrapQL.Objects.Team
    case "Commit": return GitHubGrapQL.Objects.Commit
    case "Tree": return GitHubGrapQL.Objects.Tree
    case "Blob": return GitHubGrapQL.Objects.Blob
    case "Tag": return GitHubGrapQL.Objects.Tag
    case "DiscussionCategory": return GitHubGrapQL.Objects.DiscussionCategory
    case "PinnedDiscussion": return GitHubGrapQL.Objects.PinnedDiscussion
    case "RepositoryVulnerabilityAlert": return GitHubGrapQL.Objects.RepositoryVulnerabilityAlert
    case "DependabotUpdate": return GitHubGrapQL.Objects.DependabotUpdate
    case "PullRequestReview": return GitHubGrapQL.Objects.PullRequestReview
    case "PullRequestReviewComment": return GitHubGrapQL.Objects.PullRequestReviewComment
    case "CommitCommentThread": return GitHubGrapQL.Objects.CommitCommentThread
    case "PullRequestCommitCommentThread": return GitHubGrapQL.Objects.PullRequestCommitCommentThread
    case "GistComment": return GitHubGrapQL.Objects.GistComment
    case "Milestone": return GitHubGrapQL.Objects.Milestone
    case "Mannequin": return GitHubGrapQL.Objects.Mannequin
    case "CheckRun": return GitHubGrapQL.Objects.CheckRun
    case "StatusContext": return GitHubGrapQL.Objects.StatusContext
    case "WorkflowRun": return GitHubGrapQL.Objects.WorkflowRun
    case "WorkflowRunFile": return GitHubGrapQL.Objects.WorkflowRunFile
    case "Workflow": return GitHubGrapQL.Objects.Workflow
    case "RepositoryTopic": return GitHubGrapQL.Objects.RepositoryTopic
    case "PullRequestCommit": return GitHubGrapQL.Objects.PullRequestCommit
    case "ClosedEvent": return GitHubGrapQL.Objects.ClosedEvent
    case "CrossReferencedEvent": return GitHubGrapQL.Objects.CrossReferencedEvent
    case "MergedEvent": return GitHubGrapQL.Objects.MergedEvent
    case "ReviewDismissedEvent": return GitHubGrapQL.Objects.ReviewDismissedEvent
    case "ConvertToDraftEvent": return GitHubGrapQL.Objects.ConvertToDraftEvent
    case "ReadyForReviewEvent": return GitHubGrapQL.Objects.ReadyForReviewEvent
    case "EnterpriseServerInstallation": return GitHubGrapQL.Objects.EnterpriseServerInstallation
    case "EnterpriseServerUserAccount": return GitHubGrapQL.Objects.EnterpriseServerUserAccount
    case "EnterpriseServerUserAccountEmail": return GitHubGrapQL.Objects.EnterpriseServerUserAccountEmail
    case "EnterpriseServerUserAccountsUpload": return GitHubGrapQL.Objects.EnterpriseServerUserAccountsUpload
    case "Package": return GitHubGrapQL.Objects.Package
    case "PackageVersion": return GitHubGrapQL.Objects.PackageVersion
    case "PackageFile": return GitHubGrapQL.Objects.PackageFile
    case "ProjectColumn": return GitHubGrapQL.Objects.ProjectColumn
    case "ProjectCard": return GitHubGrapQL.Objects.ProjectCard
    case "UserContentEdit": return GitHubGrapQL.Objects.UserContentEdit
    case "Label": return GitHubGrapQL.Objects.Label
    case "ProjectV2Field": return GitHubGrapQL.Objects.ProjectV2Field
    case "ProjectV2IterationField": return GitHubGrapQL.Objects.ProjectV2IterationField
    case "ProjectV2SingleSelectField": return GitHubGrapQL.Objects.ProjectV2SingleSelectField
    case "ProjectV2Item": return GitHubGrapQL.Objects.ProjectV2Item
    case "DraftIssue": return GitHubGrapQL.Objects.DraftIssue
    case "ProjectV2ItemFieldDateValue": return GitHubGrapQL.Objects.ProjectV2ItemFieldDateValue
    case "ProjectV2ItemFieldIterationValue": return GitHubGrapQL.Objects.ProjectV2ItemFieldIterationValue
    case "ProjectV2ItemFieldNumberValue": return GitHubGrapQL.Objects.ProjectV2ItemFieldNumberValue
    case "ProjectV2ItemFieldSingleSelectValue": return GitHubGrapQL.Objects.ProjectV2ItemFieldSingleSelectValue
    case "ProjectV2ItemFieldTextValue": return GitHubGrapQL.Objects.ProjectV2ItemFieldTextValue
    case "UserStatus": return GitHubGrapQL.Objects.UserStatus
    case "Reaction": return GitHubGrapQL.Objects.Reaction
    case "OrganizationInvitation": return GitHubGrapQL.Objects.OrganizationInvitation
    case "ProjectV2View": return GitHubGrapQL.Objects.ProjectV2View
    case "ProjectV2Workflow": return GitHubGrapQL.Objects.ProjectV2Workflow
    case "License": return GitHubGrapQL.Objects.License
    case "BranchProtectionRule": return GitHubGrapQL.Objects.BranchProtectionRule
    case "Ref": return GitHubGrapQL.Objects.Ref
    case "Comparison": return GitHubGrapQL.Objects.Comparison
    case "CheckSuite": return GitHubGrapQL.Objects.CheckSuite
    case "IpAllowListEntry": return GitHubGrapQL.Objects.IpAllowListEntry
    case "Deployment": return GitHubGrapQL.Objects.Deployment
    case "DeploymentStatus": return GitHubGrapQL.Objects.DeploymentStatus
    case "Environment": return GitHubGrapQL.Objects.Environment
    case "Push": return GitHubGrapQL.Objects.Push
    case "DeploymentReview": return GitHubGrapQL.Objects.DeploymentReview
    case "Language": return GitHubGrapQL.Objects.Language
    case "Status": return GitHubGrapQL.Objects.Status
    case "StatusCheckRollup": return GitHubGrapQL.Objects.StatusCheckRollup
    case "BypassForcePushAllowance": return GitHubGrapQL.Objects.BypassForcePushAllowance
    case "BypassPullRequestAllowance": return GitHubGrapQL.Objects.BypassPullRequestAllowance
    case "PushAllowance": return GitHubGrapQL.Objects.PushAllowance
    case "ReviewDismissalAllowance": return GitHubGrapQL.Objects.ReviewDismissalAllowance
    case "DeployKey": return GitHubGrapQL.Objects.DeployKey
    case "DiscussionPoll": return GitHubGrapQL.Objects.DiscussionPoll
    case "DiscussionPollOption": return GitHubGrapQL.Objects.DiscussionPollOption
    case "MergeQueue": return GitHubGrapQL.Objects.MergeQueue
    case "MergeQueueEntry": return GitHubGrapQL.Objects.MergeQueueEntry
    case "PinnedIssue": return GitHubGrapQL.Objects.PinnedIssue
    case "RepositoryRuleset": return GitHubGrapQL.Objects.RepositoryRuleset
    case "RepositoryRulesetBypassActor": return GitHubGrapQL.Objects.RepositoryRulesetBypassActor
    case "RepositoryRule": return GitHubGrapQL.Objects.RepositoryRule
    case "SecurityAdvisory": return GitHubGrapQL.Objects.SecurityAdvisory
    case "CWE": return GitHubGrapQL.Objects.CWE
    case "ReviewRequest": return GitHubGrapQL.Objects.ReviewRequest
    case "PullRequestReviewThread": return GitHubGrapQL.Objects.PullRequestReviewThread
    case "AssignedEvent": return GitHubGrapQL.Objects.AssignedEvent
    case "BaseRefDeletedEvent": return GitHubGrapQL.Objects.BaseRefDeletedEvent
    case "BaseRefForcePushedEvent": return GitHubGrapQL.Objects.BaseRefForcePushedEvent
    case "DemilestonedEvent": return GitHubGrapQL.Objects.DemilestonedEvent
    case "DeployedEvent": return GitHubGrapQL.Objects.DeployedEvent
    case "DeploymentEnvironmentChangedEvent": return GitHubGrapQL.Objects.DeploymentEnvironmentChangedEvent
    case "HeadRefDeletedEvent": return GitHubGrapQL.Objects.HeadRefDeletedEvent
    case "HeadRefForcePushedEvent": return GitHubGrapQL.Objects.HeadRefForcePushedEvent
    case "HeadRefRestoredEvent": return GitHubGrapQL.Objects.HeadRefRestoredEvent
    case "LabeledEvent": return GitHubGrapQL.Objects.LabeledEvent
    case "LockedEvent": return GitHubGrapQL.Objects.LockedEvent
    case "MilestonedEvent": return GitHubGrapQL.Objects.MilestonedEvent
    case "ReferencedEvent": return GitHubGrapQL.Objects.ReferencedEvent
    case "RenamedTitleEvent": return GitHubGrapQL.Objects.RenamedTitleEvent
    case "ReopenedEvent": return GitHubGrapQL.Objects.ReopenedEvent
    case "ReviewRequestRemovedEvent": return GitHubGrapQL.Objects.ReviewRequestRemovedEvent
    case "ReviewRequestedEvent": return GitHubGrapQL.Objects.ReviewRequestedEvent
    case "SubscribedEvent": return GitHubGrapQL.Objects.SubscribedEvent
    case "UnassignedEvent": return GitHubGrapQL.Objects.UnassignedEvent
    case "UnlabeledEvent": return GitHubGrapQL.Objects.UnlabeledEvent
    case "UnlockedEvent": return GitHubGrapQL.Objects.UnlockedEvent
    case "UnsubscribedEvent": return GitHubGrapQL.Objects.UnsubscribedEvent
    case "UserBlockedEvent": return GitHubGrapQL.Objects.UserBlockedEvent
    case "AddedToMergeQueueEvent": return GitHubGrapQL.Objects.AddedToMergeQueueEvent
    case "AddedToProjectEvent": return GitHubGrapQL.Objects.AddedToProjectEvent
    case "AutoMergeDisabledEvent": return GitHubGrapQL.Objects.AutoMergeDisabledEvent
    case "AutoMergeEnabledEvent": return GitHubGrapQL.Objects.AutoMergeEnabledEvent
    case "AutoRebaseEnabledEvent": return GitHubGrapQL.Objects.AutoRebaseEnabledEvent
    case "AutoSquashEnabledEvent": return GitHubGrapQL.Objects.AutoSquashEnabledEvent
    case "AutomaticBaseChangeFailedEvent": return GitHubGrapQL.Objects.AutomaticBaseChangeFailedEvent
    case "AutomaticBaseChangeSucceededEvent": return GitHubGrapQL.Objects.AutomaticBaseChangeSucceededEvent
    case "BaseRefChangedEvent": return GitHubGrapQL.Objects.BaseRefChangedEvent
    case "CommentDeletedEvent": return GitHubGrapQL.Objects.CommentDeletedEvent
    case "ConnectedEvent": return GitHubGrapQL.Objects.ConnectedEvent
    case "ConvertedNoteToIssueEvent": return GitHubGrapQL.Objects.ConvertedNoteToIssueEvent
    case "ConvertedToDiscussionEvent": return GitHubGrapQL.Objects.ConvertedToDiscussionEvent
    case "DisconnectedEvent": return GitHubGrapQL.Objects.DisconnectedEvent
    case "MarkedAsDuplicateEvent": return GitHubGrapQL.Objects.MarkedAsDuplicateEvent
    case "MentionedEvent": return GitHubGrapQL.Objects.MentionedEvent
    case "MovedColumnsInProjectEvent": return GitHubGrapQL.Objects.MovedColumnsInProjectEvent
    case "PinnedEvent": return GitHubGrapQL.Objects.PinnedEvent
    case "RemovedFromMergeQueueEvent": return GitHubGrapQL.Objects.RemovedFromMergeQueueEvent
    case "RemovedFromProjectEvent": return GitHubGrapQL.Objects.RemovedFromProjectEvent
    case "TransferredEvent": return GitHubGrapQL.Objects.TransferredEvent
    case "UnmarkedAsDuplicateEvent": return GitHubGrapQL.Objects.UnmarkedAsDuplicateEvent
    case "UnpinnedEvent": return GitHubGrapQL.Objects.UnpinnedEvent
    case "LinkedBranch": return GitHubGrapQL.Objects.LinkedBranch
    case "SponsorsActivity": return GitHubGrapQL.Objects.SponsorsActivity
    case "SponsorsTier": return GitHubGrapQL.Objects.SponsorsTier
    case "Sponsorship": return GitHubGrapQL.Objects.Sponsorship
    case "SponsorsListing": return GitHubGrapQL.Objects.SponsorsListing
    case "SponsorsListingFeaturedItem": return GitHubGrapQL.Objects.SponsorsListingFeaturedItem
    case "SponsorshipNewsletter": return GitHubGrapQL.Objects.SponsorshipNewsletter
    case "PublicKey": return GitHubGrapQL.Objects.PublicKey
    case "SavedReply": return GitHubGrapQL.Objects.SavedReply
    case "ReleaseAsset": return GitHubGrapQL.Objects.ReleaseAsset
    case "MembersCanDeleteReposClearAuditEntry": return GitHubGrapQL.Objects.MembersCanDeleteReposClearAuditEntry
    case "MembersCanDeleteReposDisableAuditEntry": return GitHubGrapQL.Objects.MembersCanDeleteReposDisableAuditEntry
    case "MembersCanDeleteReposEnableAuditEntry": return GitHubGrapQL.Objects.MembersCanDeleteReposEnableAuditEntry
    case "OauthApplicationCreateAuditEntry": return GitHubGrapQL.Objects.OauthApplicationCreateAuditEntry
    case "OrgOauthAppAccessApprovedAuditEntry": return GitHubGrapQL.Objects.OrgOauthAppAccessApprovedAuditEntry
    case "OrgOauthAppAccessBlockedAuditEntry": return GitHubGrapQL.Objects.OrgOauthAppAccessBlockedAuditEntry
    case "OrgOauthAppAccessDeniedAuditEntry": return GitHubGrapQL.Objects.OrgOauthAppAccessDeniedAuditEntry
    case "OrgOauthAppAccessRequestedAuditEntry": return GitHubGrapQL.Objects.OrgOauthAppAccessRequestedAuditEntry
    case "OrgOauthAppAccessUnblockedAuditEntry": return GitHubGrapQL.Objects.OrgOauthAppAccessUnblockedAuditEntry
    case "OrgAddBillingManagerAuditEntry": return GitHubGrapQL.Objects.OrgAddBillingManagerAuditEntry
    case "OrgAddMemberAuditEntry": return GitHubGrapQL.Objects.OrgAddMemberAuditEntry
    case "OrgBlockUserAuditEntry": return GitHubGrapQL.Objects.OrgBlockUserAuditEntry
    case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGrapQL.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
    case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGrapQL.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
    case "OrgCreateAuditEntry": return GitHubGrapQL.Objects.OrgCreateAuditEntry
    case "OrgDisableOauthAppRestrictionsAuditEntry": return GitHubGrapQL.Objects.OrgDisableOauthAppRestrictionsAuditEntry
    case "OrgDisableSamlAuditEntry": return GitHubGrapQL.Objects.OrgDisableSamlAuditEntry
    case "OrgDisableTwoFactorRequirementAuditEntry": return GitHubGrapQL.Objects.OrgDisableTwoFactorRequirementAuditEntry
    case "OrgEnableOauthAppRestrictionsAuditEntry": return GitHubGrapQL.Objects.OrgEnableOauthAppRestrictionsAuditEntry
    case "OrgEnableSamlAuditEntry": return GitHubGrapQL.Objects.OrgEnableSamlAuditEntry
    case "OrgEnableTwoFactorRequirementAuditEntry": return GitHubGrapQL.Objects.OrgEnableTwoFactorRequirementAuditEntry
    case "OrgInviteMemberAuditEntry": return GitHubGrapQL.Objects.OrgInviteMemberAuditEntry
    case "OrgInviteToBusinessAuditEntry": return GitHubGrapQL.Objects.OrgInviteToBusinessAuditEntry
    case "OrgRemoveBillingManagerAuditEntry": return GitHubGrapQL.Objects.OrgRemoveBillingManagerAuditEntry
    case "OrgRemoveMemberAuditEntry": return GitHubGrapQL.Objects.OrgRemoveMemberAuditEntry
    case "OrgRemoveOutsideCollaboratorAuditEntry": return GitHubGrapQL.Objects.OrgRemoveOutsideCollaboratorAuditEntry
    case "OrgRestoreMemberAuditEntry": return GitHubGrapQL.Objects.OrgRestoreMemberAuditEntry
    case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GitHubGrapQL.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
    case "OrgUnblockUserAuditEntry": return GitHubGrapQL.Objects.OrgUnblockUserAuditEntry
    case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GitHubGrapQL.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
    case "OrgUpdateMemberAuditEntry": return GitHubGrapQL.Objects.OrgUpdateMemberAuditEntry
    case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GitHubGrapQL.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
    case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GitHubGrapQL.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
    case "PrivateRepositoryForkingDisableAuditEntry": return GitHubGrapQL.Objects.PrivateRepositoryForkingDisableAuditEntry
    case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GitHubGrapQL.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
    case "PrivateRepositoryForkingEnableAuditEntry": return GitHubGrapQL.Objects.PrivateRepositoryForkingEnableAuditEntry
    case "RepoAccessAuditEntry": return GitHubGrapQL.Objects.RepoAccessAuditEntry
    case "RepoAddMemberAuditEntry": return GitHubGrapQL.Objects.RepoAddMemberAuditEntry
    case "RepoAddTopicAuditEntry": return GitHubGrapQL.Objects.RepoAddTopicAuditEntry
    case "RepoRemoveTopicAuditEntry": return GitHubGrapQL.Objects.RepoRemoveTopicAuditEntry
    case "RepoArchivedAuditEntry": return GitHubGrapQL.Objects.RepoArchivedAuditEntry
    case "RepoChangeMergeSettingAuditEntry": return GitHubGrapQL.Objects.RepoChangeMergeSettingAuditEntry
    case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GitHubGrapQL.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
    case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGrapQL.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
    case "RepoConfigDisableContributorsOnlyAuditEntry": return GitHubGrapQL.Objects.RepoConfigDisableContributorsOnlyAuditEntry
    case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GitHubGrapQL.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
    case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GitHubGrapQL.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
    case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGrapQL.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
    case "RepoConfigEnableContributorsOnlyAuditEntry": return GitHubGrapQL.Objects.RepoConfigEnableContributorsOnlyAuditEntry
    case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GitHubGrapQL.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
    case "RepoConfigLockAnonymousGitAccessAuditEntry": return GitHubGrapQL.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
    case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GitHubGrapQL.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
    case "RepoCreateAuditEntry": return GitHubGrapQL.Objects.RepoCreateAuditEntry
    case "RepoDestroyAuditEntry": return GitHubGrapQL.Objects.RepoDestroyAuditEntry
    case "RepoRemoveMemberAuditEntry": return GitHubGrapQL.Objects.RepoRemoveMemberAuditEntry
    case "TeamAddRepositoryAuditEntry": return GitHubGrapQL.Objects.TeamAddRepositoryAuditEntry
    case "OrgRestoreMemberMembershipTeamAuditEntryData": return GitHubGrapQL.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
    case "TeamAddMemberAuditEntry": return GitHubGrapQL.Objects.TeamAddMemberAuditEntry
    case "TeamChangeParentTeamAuditEntry": return GitHubGrapQL.Objects.TeamChangeParentTeamAuditEntry
    case "TeamRemoveMemberAuditEntry": return GitHubGrapQL.Objects.TeamRemoveMemberAuditEntry
    case "TeamRemoveRepositoryAuditEntry": return GitHubGrapQL.Objects.TeamRemoveRepositoryAuditEntry
    case "RepositoryVisibilityChangeDisableAuditEntry": return GitHubGrapQL.Objects.RepositoryVisibilityChangeDisableAuditEntry
    case "RepositoryVisibilityChangeEnableAuditEntry": return GitHubGrapQL.Objects.RepositoryVisibilityChangeEnableAuditEntry
    case "VerifiableDomain": return GitHubGrapQL.Objects.VerifiableDomain
    case "RepositoryMigration": return GitHubGrapQL.Objects.RepositoryMigration
    case "MigrationSource": return GitHubGrapQL.Objects.MigrationSource
    case "OrganizationIdentityProvider": return GitHubGrapQL.Objects.OrganizationIdentityProvider
    case "ExternalIdentity": return GitHubGrapQL.Objects.ExternalIdentity
    case "OIDCProvider": return GitHubGrapQL.Objects.OIDCProvider
    case "EnterpriseRepositoryInfo": return GitHubGrapQL.Objects.EnterpriseRepositoryInfo
    case "EnterpriseAdministratorInvitation": return GitHubGrapQL.Objects.EnterpriseAdministratorInvitation
    case "RepositoryInvitation": return GitHubGrapQL.Objects.RepositoryInvitation
    case "EnterpriseIdentityProvider": return GitHubGrapQL.Objects.EnterpriseIdentityProvider
    case "MarketplaceCategory": return GitHubGrapQL.Objects.MarketplaceCategory
    case "MarketplaceListing": return GitHubGrapQL.Objects.MarketplaceListing
    case "OrganizationMigration": return GitHubGrapQL.Objects.OrganizationMigration
    case "PackageTag": return GitHubGrapQL.Objects.PackageTag
    case "PullRequestThread": return GitHubGrapQL.Objects.PullRequestThread
    case "LanguageConnection": return GitHubGrapQL.Objects.LanguageConnection
    case "UserConnection": return GitHubGrapQL.Objects.UserConnection
    case "PageInfo": return GitHubGrapQL.Objects.PageInfo
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
