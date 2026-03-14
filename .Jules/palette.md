## 2024-05-24 - Social Links ARIA Accessibility in MkDocs Material
**Learning:** `mkdocs-material` theme's social links (`extra.social`) generate icon-only links. To ensure proper ARIA labels and tooltips are generated for keyboard navigation and screen readers, each link requires an explicitly defined `name` property alongside the `icon` and `link`. Without `name`, the links lack text descriptions.
**Action:** Always verify `extra.social` links in `mkdocs.yml` have a defined `name` attribute when performing accessibility checks.

## 2024-05-24 - Clarity of System Theme Icon
**Learning:** The default `material/link` (🔗) icon for the "(prefers-color-scheme)" automatic theme toggle can be confusing to users as it typically implies a URL link rather than a theme setting.
**Action:** Recommend `material/theme-light-dark` as a more intuitive visual representation for the automatic system theme preference toggle.
