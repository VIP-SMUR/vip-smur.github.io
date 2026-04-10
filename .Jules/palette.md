## 2024-05-24 - Social Links ARIA Accessibility in MkDocs Material
**Learning:** `mkdocs-material` theme's social links (`extra.social`) generate icon-only links. To ensure proper ARIA labels and tooltips are generated for keyboard navigation and screen readers, each link requires an explicitly defined `name` property alongside the `icon` and `link`. Without `name`, the links lack text descriptions.
**Action:** Always verify `extra.social` links in `mkdocs.yml` have a defined `name` attribute when performing accessibility checks.

## 2024-05-24 - Clarity of System Theme Icon
**Learning:** The default `material/link` (🔗) icon for the "(prefers-color-scheme)" automatic theme toggle can be confusing to users as it typically implies a URL link rather than a theme setting.
**Action:** Recommend `material/theme-light-dark` as a more intuitive visual representation for the automatic system theme preference toggle.

## 2026-03-26 - Adding Aria-Labels to Images and Non-Descriptive Links
**Learning:** Raw HTML in markdown files (`macleamy.md`) and configuration files (`mkdocs.yml`) containing links often lack sufficient context for screen reader users when they navigate by link, particularly when the text is short like "(more info)" or contains only an image.
**Action:** When finding raw HTML `<a>` tags around images or with non-descriptive link text, always add an explicit `aria-label` describing the destination or action.

## 2026-03-19 - Full Context for Social Icons
**Learning:** Social icon links in MkDocs with generic names like "GitHub" or "LinkedIn" fail to provide sufficient context for screen reader users navigating out of context. They only hear "GitHub, link" instead of knowing whose profile it leads to.
**Action:** Always prefix or suffix generic social platform names with the account name or organization name (e.g., "VIP-SMUR on GitHub" or "Patrick Kastner on ORCID") to ensure unambiguous navigation.
## 2025-03-22 - [Raw HTML Anchor Tags in MkDocs Captions]
**Learning:** Raw HTML `<a>` tags embedded in Markdown files (like in `<figcaption>` elements) lack screen-reader context if the text is generic.
**Action:** Ensure all raw HTML anchor tags include descriptive `aria-label` attributes for accessibility.

## 2026-03-24 - Semantic Structure for Images with Captions
**Learning:** Using raw markdown images (`![alt](url)`) and separate text for captions is poor for accessibility as screen readers don't semantically associate the text with the image.
**Action:** Always use `<figure markdown="span">` containing an image and a `<figcaption>` element to provide semantic structure and improve accessibility for images with captions.

## 2026-03-26 - Avoiding Redundant ARIA Labels
**Learning:** Adding `aria-label` attributes to `<a>` tags where the visible text is already highly descriptive (e.g., "Sustainability Network Meeting") causes unnecessary verbosity for screen readers. ARIA labels should only be applied to generic text like "Learn more" or "(more info)", or icon-only buttons.
**Action:** When performing accessibility checks or applying UX improvements, avoid adding redundant `aria-label` attributes to links that already have highly descriptive visible text.
## 2026-04-01 - [Theme Toggle Icons]
**Learning:** The user explicitly requested that the semantics of the symbols (icons) for the color palette theme toggle should not be changed.
**Action:** When updating the MkDocs Material palette settings in `mkdocs.yml`, always keep the default icons (`material/theme-light-dark`, `material/toggle-switch`, `material/toggle-switch-off`). Do not replace them with sun/moon or context-aware icons.

## 2026-04-07 - Redundant Alt Text with Captions
**Learning:** When images are wrapped in `<figure>` with a descriptive `<figcaption>`, providing identical or highly similar text in the image's `alt` attribute causes screen readers to read the description twice, creating a verbose and frustrating experience.
**Action:** When an image has a `<figcaption>` that fully describes its purpose or content, leave the markdown alt text empty (e.g., `![]()`) to generate `alt=""` and avoid redundancy for screen reader users.

## 2024-04-10 - ARIA Labels and Image Alt Text
**Learning:** When a link contains only an image, the image's `alt` text serves as the visible text for speech-input users. If an `aria-label` is applied to the link, it completely overrides this name, potentially breaking speech navigation if it doesn't include the exact `alt` text.
**Action:** When adding or updating an `aria-label` on a link whose sole content is an image with `alt` text, ensure the `aria-label` incorporates the exact `alt` text to comply with WCAG 2.5.3 (Label in Name).
