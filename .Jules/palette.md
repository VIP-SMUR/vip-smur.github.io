## 2024-05-24 - Social Links ARIA Accessibility in MkDocs Material
**Learning:** `mkdocs-material` theme's social links (`extra.social`) generate icon-only links. To ensure proper ARIA labels and tooltips are generated for keyboard navigation and screen readers, each link requires an explicitly defined `name` property alongside the `icon` and `link`. Without `name`, the links lack text descriptions.
**Action:** Always verify `extra.social` links in `mkdocs.yml` have a defined `name` attribute when performing accessibility checks.

## 2024-05-24 - Clarity of System Theme Icon
**Learning:** The default `material/link` (🔗) icon for the "(prefers-color-scheme)" automatic theme toggle can be confusing to users as it typically implies a URL link rather than a theme setting.
**Action:** Recommend `material/theme-light-dark` as a more intuitive visual representation for the automatic system theme preference toggle.

## $(date +%Y-%m-%d) - Adding Aria-Labels to Images and Non-Descriptive Links
**Learning:** Raw HTML in markdown files (`macleamy.md`) and configuration files (`mkdocs.yml`) containing links often lack sufficient context for screen reader users when they navigate by link, particularly when the text is short like "(more info)" or contains only an image.
**Action:** When finding raw HTML `<a>` tags around images or with non-descriptive link text, always add an explicit `aria-label` describing the destination or action.

## 2026-03-19 - Full Context for Social Icons
**Learning:** Social icon links in MkDocs with generic names like "GitHub" or "LinkedIn" fail to provide sufficient context for screen reader users navigating out of context. They only hear "GitHub, link" instead of knowing whose profile it leads to.
**Action:** Always prefix or suffix generic social platform names with the account name or organization name (e.g., "VIP-SMUR on GitHub" or "Patrick Kastner on ORCID") to ensure unambiguous navigation.
## 2025-03-22 - [Raw HTML Anchor Tags in MkDocs Captions]
**Learning:** Raw HTML `<a>` tags embedded in Markdown files (like in `<figcaption>` elements) lack screen-reader context if the text is generic.
**Action:** Ensure all raw HTML anchor tags include descriptive `aria-label` attributes for accessibility.
