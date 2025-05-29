// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol GitHubGraphQLAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GitHubGraphQLAPI.SchemaMetadata {}

protocol GitHubGraphQLAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGraphQLAPI.SchemaMetadata {}

protocol GitHubGraphQLAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GitHubGraphQLAPI.SchemaMetadata {}

protocol GitHubGraphQLAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GitHubGraphQLAPI.SchemaMetadata {}

extension GitHubGraphQLAPI {
  typealias SelectionSet = GitHubGraphQLAPI_SelectionSet

  typealias InlineFragment = GitHubGraphQLAPI_InlineFragment

  typealias MutableSelectionSet = GitHubGraphQLAPI_MutableSelectionSet

  typealias MutableInlineFragment = GitHubGraphQLAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "AddedToProjectEvent": return GitHubGraphQLAPI.Objects.AddedToProjectEvent
      case "App": return GitHubGraphQLAPI.Objects.App
      case "AssignedEvent": return GitHubGraphQLAPI.Objects.AssignedEvent
      case "AutoMergeDisabledEvent": return GitHubGraphQLAPI.Objects.AutoMergeDisabledEvent
      case "AutoMergeEnabledEvent": return GitHubGraphQLAPI.Objects.AutoMergeEnabledEvent
      case "AutoRebaseEnabledEvent": return GitHubGraphQLAPI.Objects.AutoRebaseEnabledEvent
      case "AutoSquashEnabledEvent": return GitHubGraphQLAPI.Objects.AutoSquashEnabledEvent
      case "AutomaticBaseChangeFailedEvent": return GitHubGraphQLAPI.Objects.AutomaticBaseChangeFailedEvent
      case "AutomaticBaseChangeSucceededEvent": return GitHubGraphQLAPI.Objects.AutomaticBaseChangeSucceededEvent
      case "BaseRefChangedEvent": return GitHubGraphQLAPI.Objects.BaseRefChangedEvent
      case "BaseRefDeletedEvent": return GitHubGraphQLAPI.Objects.BaseRefDeletedEvent
      case "BaseRefForcePushedEvent": return GitHubGraphQLAPI.Objects.BaseRefForcePushedEvent
      case "Blob": return GitHubGraphQLAPI.Objects.Blob
      case "Bot": return GitHubGraphQLAPI.Objects.Bot
      case "BranchProtectionRule": return GitHubGraphQLAPI.Objects.BranchProtectionRule
      case "CWE": return GitHubGraphQLAPI.Objects.CWE
      case "CheckRun": return GitHubGraphQLAPI.Objects.CheckRun
      case "CheckSuite": return GitHubGraphQLAPI.Objects.CheckSuite
      case "ClosedEvent": return GitHubGraphQLAPI.Objects.ClosedEvent
      case "CodeOfConduct": return GitHubGraphQLAPI.Objects.CodeOfConduct
      case "CommentDeletedEvent": return GitHubGraphQLAPI.Objects.CommentDeletedEvent
      case "Commit": return GitHubGraphQLAPI.Objects.Commit
      case "CommitComment": return GitHubGraphQLAPI.Objects.CommitComment
      case "CommitCommentThread": return GitHubGraphQLAPI.Objects.CommitCommentThread
      case "ConnectedEvent": return GitHubGraphQLAPI.Objects.ConnectedEvent
      case "ConvertToDraftEvent": return GitHubGraphQLAPI.Objects.ConvertToDraftEvent
      case "ConvertedNoteToIssueEvent": return GitHubGraphQLAPI.Objects.ConvertedNoteToIssueEvent
      case "CreateRepositoryPayload": return GitHubGraphQLAPI.Objects.CreateRepositoryPayload
      case "CrossReferencedEvent": return GitHubGraphQLAPI.Objects.CrossReferencedEvent
      case "DemilestonedEvent": return GitHubGraphQLAPI.Objects.DemilestonedEvent
      case "DeployKey": return GitHubGraphQLAPI.Objects.DeployKey
      case "DeployedEvent": return GitHubGraphQLAPI.Objects.DeployedEvent
      case "Deployment": return GitHubGraphQLAPI.Objects.Deployment
      case "DeploymentEnvironmentChangedEvent": return GitHubGraphQLAPI.Objects.DeploymentEnvironmentChangedEvent
      case "DeploymentStatus": return GitHubGraphQLAPI.Objects.DeploymentStatus
      case "DisconnectedEvent": return GitHubGraphQLAPI.Objects.DisconnectedEvent
      case "Enterprise": return GitHubGraphQLAPI.Objects.Enterprise
      case "EnterpriseAdministratorInvitation": return GitHubGraphQLAPI.Objects.EnterpriseAdministratorInvitation
      case "EnterpriseIdentityProvider": return GitHubGraphQLAPI.Objects.EnterpriseIdentityProvider
      case "EnterpriseRepositoryInfo": return GitHubGraphQLAPI.Objects.EnterpriseRepositoryInfo
      case "EnterpriseServerInstallation": return GitHubGraphQLAPI.Objects.EnterpriseServerInstallation
      case "EnterpriseServerUserAccount": return GitHubGraphQLAPI.Objects.EnterpriseServerUserAccount
      case "EnterpriseServerUserAccountEmail": return GitHubGraphQLAPI.Objects.EnterpriseServerUserAccountEmail
      case "EnterpriseServerUserAccountsUpload": return GitHubGraphQLAPI.Objects.EnterpriseServerUserAccountsUpload
      case "EnterpriseUserAccount": return GitHubGraphQLAPI.Objects.EnterpriseUserAccount
      case "ExternalIdentity": return GitHubGraphQLAPI.Objects.ExternalIdentity
      case "Gist": return GitHubGraphQLAPI.Objects.Gist
      case "GistComment": return GitHubGraphQLAPI.Objects.GistComment
      case "HeadRefDeletedEvent": return GitHubGraphQLAPI.Objects.HeadRefDeletedEvent
      case "HeadRefForcePushedEvent": return GitHubGraphQLAPI.Objects.HeadRefForcePushedEvent
      case "HeadRefRestoredEvent": return GitHubGraphQLAPI.Objects.HeadRefRestoredEvent
      case "IpAllowListEntry": return GitHubGraphQLAPI.Objects.IpAllowListEntry
      case "Issue": return GitHubGraphQLAPI.Objects.Issue
      case "IssueComment": return GitHubGraphQLAPI.Objects.IssueComment
      case "Label": return GitHubGraphQLAPI.Objects.Label
      case "LabeledEvent": return GitHubGraphQLAPI.Objects.LabeledEvent
      case "Language": return GitHubGraphQLAPI.Objects.Language
      case "License": return GitHubGraphQLAPI.Objects.License
      case "LockedEvent": return GitHubGraphQLAPI.Objects.LockedEvent
      case "Mannequin": return GitHubGraphQLAPI.Objects.Mannequin
      case "MarkedAsDuplicateEvent": return GitHubGraphQLAPI.Objects.MarkedAsDuplicateEvent
      case "MarketplaceCategory": return GitHubGraphQLAPI.Objects.MarketplaceCategory
      case "MarketplaceListing": return GitHubGraphQLAPI.Objects.MarketplaceListing
      case "MembersCanDeleteReposClearAuditEntry": return GitHubGraphQLAPI.Objects.MembersCanDeleteReposClearAuditEntry
      case "MembersCanDeleteReposDisableAuditEntry": return GitHubGraphQLAPI.Objects.MembersCanDeleteReposDisableAuditEntry
      case "MembersCanDeleteReposEnableAuditEntry": return GitHubGraphQLAPI.Objects.MembersCanDeleteReposEnableAuditEntry
      case "MentionedEvent": return GitHubGraphQLAPI.Objects.MentionedEvent
      case "MergedEvent": return GitHubGraphQLAPI.Objects.MergedEvent
      case "Milestone": return GitHubGraphQLAPI.Objects.Milestone
      case "MilestonedEvent": return GitHubGraphQLAPI.Objects.MilestonedEvent
      case "MovedColumnsInProjectEvent": return GitHubGraphQLAPI.Objects.MovedColumnsInProjectEvent
      case "Mutation": return GitHubGraphQLAPI.Objects.Mutation
      case "OauthApplicationCreateAuditEntry": return GitHubGraphQLAPI.Objects.OauthApplicationCreateAuditEntry
      case "OrgAddBillingManagerAuditEntry": return GitHubGraphQLAPI.Objects.OrgAddBillingManagerAuditEntry
      case "OrgAddMemberAuditEntry": return GitHubGraphQLAPI.Objects.OrgAddMemberAuditEntry
      case "OrgBlockUserAuditEntry": return GitHubGraphQLAPI.Objects.OrgBlockUserAuditEntry
      case "OrgConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGraphQLAPI.Objects.OrgConfigDisableCollaboratorsOnlyAuditEntry
      case "OrgConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGraphQLAPI.Objects.OrgConfigEnableCollaboratorsOnlyAuditEntry
      case "OrgCreateAuditEntry": return GitHubGraphQLAPI.Objects.OrgCreateAuditEntry
      case "OrgDisableOauthAppRestrictionsAuditEntry": return GitHubGraphQLAPI.Objects.OrgDisableOauthAppRestrictionsAuditEntry
      case "OrgDisableSamlAuditEntry": return GitHubGraphQLAPI.Objects.OrgDisableSamlAuditEntry
      case "OrgDisableTwoFactorRequirementAuditEntry": return GitHubGraphQLAPI.Objects.OrgDisableTwoFactorRequirementAuditEntry
      case "OrgEnableOauthAppRestrictionsAuditEntry": return GitHubGraphQLAPI.Objects.OrgEnableOauthAppRestrictionsAuditEntry
      case "OrgEnableSamlAuditEntry": return GitHubGraphQLAPI.Objects.OrgEnableSamlAuditEntry
      case "OrgEnableTwoFactorRequirementAuditEntry": return GitHubGraphQLAPI.Objects.OrgEnableTwoFactorRequirementAuditEntry
      case "OrgInviteMemberAuditEntry": return GitHubGraphQLAPI.Objects.OrgInviteMemberAuditEntry
      case "OrgInviteToBusinessAuditEntry": return GitHubGraphQLAPI.Objects.OrgInviteToBusinessAuditEntry
      case "OrgOauthAppAccessApprovedAuditEntry": return GitHubGraphQLAPI.Objects.OrgOauthAppAccessApprovedAuditEntry
      case "OrgOauthAppAccessDeniedAuditEntry": return GitHubGraphQLAPI.Objects.OrgOauthAppAccessDeniedAuditEntry
      case "OrgOauthAppAccessRequestedAuditEntry": return GitHubGraphQLAPI.Objects.OrgOauthAppAccessRequestedAuditEntry
      case "OrgRemoveBillingManagerAuditEntry": return GitHubGraphQLAPI.Objects.OrgRemoveBillingManagerAuditEntry
      case "OrgRemoveMemberAuditEntry": return GitHubGraphQLAPI.Objects.OrgRemoveMemberAuditEntry
      case "OrgRemoveOutsideCollaboratorAuditEntry": return GitHubGraphQLAPI.Objects.OrgRemoveOutsideCollaboratorAuditEntry
      case "OrgRestoreMemberAuditEntry": return GitHubGraphQLAPI.Objects.OrgRestoreMemberAuditEntry
      case "OrgRestoreMemberMembershipOrganizationAuditEntryData": return GitHubGraphQLAPI.Objects.OrgRestoreMemberMembershipOrganizationAuditEntryData
      case "OrgRestoreMemberMembershipRepositoryAuditEntryData": return GitHubGraphQLAPI.Objects.OrgRestoreMemberMembershipRepositoryAuditEntryData
      case "OrgRestoreMemberMembershipTeamAuditEntryData": return GitHubGraphQLAPI.Objects.OrgRestoreMemberMembershipTeamAuditEntryData
      case "OrgUnblockUserAuditEntry": return GitHubGraphQLAPI.Objects.OrgUnblockUserAuditEntry
      case "OrgUpdateDefaultRepositoryPermissionAuditEntry": return GitHubGraphQLAPI.Objects.OrgUpdateDefaultRepositoryPermissionAuditEntry
      case "OrgUpdateMemberAuditEntry": return GitHubGraphQLAPI.Objects.OrgUpdateMemberAuditEntry
      case "OrgUpdateMemberRepositoryCreationPermissionAuditEntry": return GitHubGraphQLAPI.Objects.OrgUpdateMemberRepositoryCreationPermissionAuditEntry
      case "OrgUpdateMemberRepositoryInvitationPermissionAuditEntry": return GitHubGraphQLAPI.Objects.OrgUpdateMemberRepositoryInvitationPermissionAuditEntry
      case "Organization": return GitHubGraphQLAPI.Objects.Organization
      case "OrganizationIdentityProvider": return GitHubGraphQLAPI.Objects.OrganizationIdentityProvider
      case "OrganizationInvitation": return GitHubGraphQLAPI.Objects.OrganizationInvitation
      case "Package": return GitHubGraphQLAPI.Objects.Package
      case "PackageFile": return GitHubGraphQLAPI.Objects.PackageFile
      case "PackageTag": return GitHubGraphQLAPI.Objects.PackageTag
      case "PackageVersion": return GitHubGraphQLAPI.Objects.PackageVersion
      case "PinnedEvent": return GitHubGraphQLAPI.Objects.PinnedEvent
      case "PinnedIssue": return GitHubGraphQLAPI.Objects.PinnedIssue
      case "PrivateRepositoryForkingDisableAuditEntry": return GitHubGraphQLAPI.Objects.PrivateRepositoryForkingDisableAuditEntry
      case "PrivateRepositoryForkingEnableAuditEntry": return GitHubGraphQLAPI.Objects.PrivateRepositoryForkingEnableAuditEntry
      case "Project": return GitHubGraphQLAPI.Objects.Project
      case "ProjectCard": return GitHubGraphQLAPI.Objects.ProjectCard
      case "ProjectColumn": return GitHubGraphQLAPI.Objects.ProjectColumn
      case "PublicKey": return GitHubGraphQLAPI.Objects.PublicKey
      case "PullRequest": return GitHubGraphQLAPI.Objects.PullRequest
      case "PullRequestCommit": return GitHubGraphQLAPI.Objects.PullRequestCommit
      case "PullRequestCommitCommentThread": return GitHubGraphQLAPI.Objects.PullRequestCommitCommentThread
      case "PullRequestReview": return GitHubGraphQLAPI.Objects.PullRequestReview
      case "PullRequestReviewComment": return GitHubGraphQLAPI.Objects.PullRequestReviewComment
      case "PullRequestReviewThread": return GitHubGraphQLAPI.Objects.PullRequestReviewThread
      case "Push": return GitHubGraphQLAPI.Objects.Push
      case "PushAllowance": return GitHubGraphQLAPI.Objects.PushAllowance
      case "Query": return GitHubGraphQLAPI.Objects.Query
      case "Reaction": return GitHubGraphQLAPI.Objects.Reaction
      case "ReadyForReviewEvent": return GitHubGraphQLAPI.Objects.ReadyForReviewEvent
      case "Ref": return GitHubGraphQLAPI.Objects.Ref
      case "ReferencedEvent": return GitHubGraphQLAPI.Objects.ReferencedEvent
      case "Release": return GitHubGraphQLAPI.Objects.Release
      case "ReleaseAsset": return GitHubGraphQLAPI.Objects.ReleaseAsset
      case "RemovedFromProjectEvent": return GitHubGraphQLAPI.Objects.RemovedFromProjectEvent
      case "RenamedTitleEvent": return GitHubGraphQLAPI.Objects.RenamedTitleEvent
      case "ReopenedEvent": return GitHubGraphQLAPI.Objects.ReopenedEvent
      case "RepoAccessAuditEntry": return GitHubGraphQLAPI.Objects.RepoAccessAuditEntry
      case "RepoAddMemberAuditEntry": return GitHubGraphQLAPI.Objects.RepoAddMemberAuditEntry
      case "RepoAddTopicAuditEntry": return GitHubGraphQLAPI.Objects.RepoAddTopicAuditEntry
      case "RepoArchivedAuditEntry": return GitHubGraphQLAPI.Objects.RepoArchivedAuditEntry
      case "RepoChangeMergeSettingAuditEntry": return GitHubGraphQLAPI.Objects.RepoChangeMergeSettingAuditEntry
      case "RepoConfigDisableAnonymousGitAccessAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigDisableAnonymousGitAccessAuditEntry
      case "RepoConfigDisableCollaboratorsOnlyAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigDisableCollaboratorsOnlyAuditEntry
      case "RepoConfigDisableContributorsOnlyAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigDisableContributorsOnlyAuditEntry
      case "RepoConfigDisableSockpuppetDisallowedAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigDisableSockpuppetDisallowedAuditEntry
      case "RepoConfigEnableAnonymousGitAccessAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigEnableAnonymousGitAccessAuditEntry
      case "RepoConfigEnableCollaboratorsOnlyAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigEnableCollaboratorsOnlyAuditEntry
      case "RepoConfigEnableContributorsOnlyAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigEnableContributorsOnlyAuditEntry
      case "RepoConfigEnableSockpuppetDisallowedAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigEnableSockpuppetDisallowedAuditEntry
      case "RepoConfigLockAnonymousGitAccessAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigLockAnonymousGitAccessAuditEntry
      case "RepoConfigUnlockAnonymousGitAccessAuditEntry": return GitHubGraphQLAPI.Objects.RepoConfigUnlockAnonymousGitAccessAuditEntry
      case "RepoCreateAuditEntry": return GitHubGraphQLAPI.Objects.RepoCreateAuditEntry
      case "RepoDestroyAuditEntry": return GitHubGraphQLAPI.Objects.RepoDestroyAuditEntry
      case "RepoRemoveMemberAuditEntry": return GitHubGraphQLAPI.Objects.RepoRemoveMemberAuditEntry
      case "RepoRemoveTopicAuditEntry": return GitHubGraphQLAPI.Objects.RepoRemoveTopicAuditEntry
      case "Repository": return GitHubGraphQLAPI.Objects.Repository
      case "RepositoryConnection": return GitHubGraphQLAPI.Objects.RepositoryConnection
      case "RepositoryInvitation": return GitHubGraphQLAPI.Objects.RepositoryInvitation
      case "RepositoryTopic": return GitHubGraphQLAPI.Objects.RepositoryTopic
      case "RepositoryVisibilityChangeDisableAuditEntry": return GitHubGraphQLAPI.Objects.RepositoryVisibilityChangeDisableAuditEntry
      case "RepositoryVisibilityChangeEnableAuditEntry": return GitHubGraphQLAPI.Objects.RepositoryVisibilityChangeEnableAuditEntry
      case "RepositoryVulnerabilityAlert": return GitHubGraphQLAPI.Objects.RepositoryVulnerabilityAlert
      case "ReviewDismissalAllowance": return GitHubGraphQLAPI.Objects.ReviewDismissalAllowance
      case "ReviewDismissedEvent": return GitHubGraphQLAPI.Objects.ReviewDismissedEvent
      case "ReviewRequest": return GitHubGraphQLAPI.Objects.ReviewRequest
      case "ReviewRequestRemovedEvent": return GitHubGraphQLAPI.Objects.ReviewRequestRemovedEvent
      case "ReviewRequestedEvent": return GitHubGraphQLAPI.Objects.ReviewRequestedEvent
      case "SavedReply": return GitHubGraphQLAPI.Objects.SavedReply
      case "SecurityAdvisory": return GitHubGraphQLAPI.Objects.SecurityAdvisory
      case "SponsorsListing": return GitHubGraphQLAPI.Objects.SponsorsListing
      case "SponsorsTier": return GitHubGraphQLAPI.Objects.SponsorsTier
      case "Sponsorship": return GitHubGraphQLAPI.Objects.Sponsorship
      case "Status": return GitHubGraphQLAPI.Objects.Status
      case "StatusCheckRollup": return GitHubGraphQLAPI.Objects.StatusCheckRollup
      case "StatusContext": return GitHubGraphQLAPI.Objects.StatusContext
      case "SubscribedEvent": return GitHubGraphQLAPI.Objects.SubscribedEvent
      case "Tag": return GitHubGraphQLAPI.Objects.Tag
      case "Team": return GitHubGraphQLAPI.Objects.Team
      case "TeamAddMemberAuditEntry": return GitHubGraphQLAPI.Objects.TeamAddMemberAuditEntry
      case "TeamAddRepositoryAuditEntry": return GitHubGraphQLAPI.Objects.TeamAddRepositoryAuditEntry
      case "TeamChangeParentTeamAuditEntry": return GitHubGraphQLAPI.Objects.TeamChangeParentTeamAuditEntry
      case "TeamDiscussion": return GitHubGraphQLAPI.Objects.TeamDiscussion
      case "TeamDiscussionComment": return GitHubGraphQLAPI.Objects.TeamDiscussionComment
      case "TeamRemoveMemberAuditEntry": return GitHubGraphQLAPI.Objects.TeamRemoveMemberAuditEntry
      case "TeamRemoveRepositoryAuditEntry": return GitHubGraphQLAPI.Objects.TeamRemoveRepositoryAuditEntry
      case "Topic": return GitHubGraphQLAPI.Objects.Topic
      case "TransferredEvent": return GitHubGraphQLAPI.Objects.TransferredEvent
      case "Tree": return GitHubGraphQLAPI.Objects.Tree
      case "TreeEntry": return GitHubGraphQLAPI.Objects.TreeEntry
      case "UnassignedEvent": return GitHubGraphQLAPI.Objects.UnassignedEvent
      case "UnlabeledEvent": return GitHubGraphQLAPI.Objects.UnlabeledEvent
      case "UnlockedEvent": return GitHubGraphQLAPI.Objects.UnlockedEvent
      case "UnmarkedAsDuplicateEvent": return GitHubGraphQLAPI.Objects.UnmarkedAsDuplicateEvent
      case "UnpinnedEvent": return GitHubGraphQLAPI.Objects.UnpinnedEvent
      case "UnsubscribedEvent": return GitHubGraphQLAPI.Objects.UnsubscribedEvent
      case "User": return GitHubGraphQLAPI.Objects.User
      case "UserBlockedEvent": return GitHubGraphQLAPI.Objects.UserBlockedEvent
      case "UserContentEdit": return GitHubGraphQLAPI.Objects.UserContentEdit
      case "UserStatus": return GitHubGraphQLAPI.Objects.UserStatus
      case "VerifiableDomain": return GitHubGraphQLAPI.Objects.VerifiableDomain
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}