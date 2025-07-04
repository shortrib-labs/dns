# 🌐 Shortrib Domain Management

This comprehensive DNS zone management system uses OctoDNS to orchestrate multiple domains across Google Cloud DNS and Cloudflare providers, managing the complete DNS infrastructure for the shortrib.* domain family.

## 📋 Overview

Our DNS infrastructure spans eight critical zones across two major providers. Google Cloud DNS hosts shortrib.io, shortrib.life, shortrib.net, and lab.shortrib.net, while Cloudflare manages shortrib.dev, shortrib.app, shortrib.run, and shortrib.sh. This distributed approach ensures reliability and leverages each provider's unique strengths.

## 🚀 Quick Start

### Prerequisites

Before diving in, ensure you have Python 3.7 or higher installed on your system. You'll need a Google Cloud Project with the DNS API enabled and a Cloudflare account with an API token. While SOPS for secret management is optional, we strongly recommend it for production environments.

### Installation

Begin by cloning the repository and navigating to the project directory. Install all required dependencies using pip, then set up your environment variables by copying the encrypted template file. You'll need to edit this file with your actual Cloudflare API token, Google Cloud project ID, and the path to your Google credentials.

For Google Cloud authentication, download your service account key from the Google Cloud Console and place it in the secrets directory. If you're working with an existing setup that uses SOPS, you can decrypt the existing encrypted file instead.

## 🔧 Configuration

The heart of this system lies in config.yaml, which orchestrates the entire DNS management workflow. This configuration file defines your DNS providers (Cloudflare and Google Cloud DNS), maps each zone to its provider, specifies YAML source files in the zones directory, and determines where changes will be applied.

Each domain maintains its own YAML file within the zones directory, creating a clean separation of concerns and making it easy to manage individual domains without affecting others.

## 🎯 Usage

### Preview Changes (Dry Run)

Safety first—always preview your changes before applying them. The dry-run command shows exactly what will happen without making any actual changes. You can preview all zones at once or focus on a specific domain to review targeted changes.

### Apply Changes

Once you're confident in your changes, apply them using the sync commands. The system supports both bulk operations across all zones and targeted updates for individual domains, giving you flexibility in your deployment approach.

### Force Updates

When you need to bypass safety checks—perhaps to recover from an inconsistent state—force commands are available. However, use these sparingly and only when you fully understand the implications, as they override OctoDNS's built-in safety mechanisms.

### Additional Operations

The system includes validation commands to check your configuration syntax before deployment, and backup functionality to capture the current state of all zones. These tools form an essential part of your DNS management workflow.

## 📁 Project Structure

The project follows a logical structure that separates concerns and maintains clarity. Zone files live in their dedicated directory, keeping DNS records organized by domain. Sensitive credentials reside in an encrypted secrets folder, while the main configuration and automation scripts occupy the root directory. This organization makes it easy to navigate and understand the project at a glance.

## 🔒 Security

Security is paramount when managing DNS infrastructure. This project employs SOPS (Secrets OPerationS) to encrypt all sensitive data, including environment variables and service account credentials. The included PGP public key and SOPS configuration ensure that secrets remain protected both at rest and in version control.

When working with encrypted files, team members with the appropriate private key can seamlessly decrypt and edit sensitive information using SOPS commands. This approach maintains security without sacrificing usability.

## 🛠️ Available Commands

The Makefile provides an intuitive interface for all common operations. Whether you're syncing zones, previewing changes, or backing up configurations, there's a make target for your needs. Zone-specific commands allow precise control over individual domains, while batch operations handle bulk updates efficiently.

Each command follows a consistent pattern, making it easy to remember and use. The help command provides a quick reference when you need a refresher on available options.

## 🔍 Troubleshooting

Authentication errors typically stem from misconfigured credentials or insufficient permissions. Ensure your Google Cloud service account has DNS Admin permissions and your Cloudflare API token includes Zone:Edit capabilities.

When zones appear missing, verify that the zone name matches exactly—including any trailing dots—and exists in your DNS provider's console. Permission issues often indicate that your service account lacks the necessary roles in Google Cloud or your Cloudflare token has incorrect scopes.

For deeper investigation, OctoDNS offers a debug mode that provides verbose output, helping you trace through the execution flow and identify issues.

## 📊 Monitoring

Comprehensive logging captures all operations in octodns.log, providing an audit trail and debugging information. Regular monitoring of these logs helps identify patterns and potential issues before they become critical.

## 🚢 Deployment

During local development, the workflow remains straightforward: modify zone files, preview changes with dry-run, and apply updates using make commands. This iterative approach ensures changes are thoroughly tested before going live.

For production environments, integrate this system with your CI/CD pipeline. Automated validation catches syntax errors early, while preview steps in pull requests show reviewers exactly what will change. Restrict actual DNS updates to protected branches, ensuring only approved changes reach production.

## 📈 Best Practices

Success with this system comes from following established patterns. Always preview changes before applying them—this simple habit prevents countless issues. Test significant changes in a development environment first, and maintain all zone files in version control for audit trails and rollback capabilities.

Write meaningful commit messages that explain not just what changed, but why. After applying DNS updates, monitor propagation to ensure changes reach all resolvers. Regular backups of zone files provide an additional safety net for disaster recovery.

## 📚 Additional Resources

The OctoDNS ecosystem offers extensive documentation and provider-specific guides. The Cloudflare and Google Cloud DNS providers have their own repositories with detailed configuration options. SOPS documentation helps you understand and extend the security model used in this project.

## 🤝 Contributing

We welcome contributions that improve the system's reliability and usability. Fork the repository, create a feature branch for your changes, and thoroughly test with dry-run before submitting a pull request. Clear communication about your changes helps maintainers review and merge improvements quickly.

## 📄 License

This project manages the shortrib.* domain infrastructure. Users must have proper authorization before making DNS modifications. Use this system responsibly and in accordance with your organization's policies.

---

⚡ **Pro Tip**: The dry-run command is your best friend—use it liberally to build confidence before making live changes!
