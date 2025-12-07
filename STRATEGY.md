# LUWO Enterprise Continuity & Exit Strategy

This playbook summarizes how to keep the LUWO Golden Curve showcase stable and discoverable to collaborators while you shift focus to other ventures. It keeps the current public-safe posture intact and provides a light-touch maintenance routine so the repo remains evidence of authorship and readiness for enterprise onboarding.

## Outcomes
- Preserve the existing HTML artifacts as an auditable proof-of-existence and authorship record.
- Keep distribution constrained to vetted collaborators (no accidental indexing or leak of deeper IP).
- Allow rapid enterprise onboarding with minimal hands-on time.
- Provide a graceful exit ramp with clear archive and handoff steps.

## Controls to keep in place
- **No-index posture:** Retain the `noindex, nofollow` meta tags on all HTML artifacts.
- **Private mirroring only:** Host on GitHub Enterprise (or private GitHub) with branch protection; avoid public forks.
- **Preset-only demos:** Do not add deeper automation or research code to this repo; keep it a preset showcase.
- **Changelog discipline:** Only merge signed commits that summarize visible changes (docs or static assets).

## Light-weight maintenance cadence
- **Quarterly check (15 minutes):**
  - Run `./scripts/healthcheck.sh` to spin up a temporary server, curl both HTML files, and assert the `noindex, nofollow` robots posture.
  - Start `./scripts/serve.sh --daemon` if you want a longer-lived local review session; logs stream to `.server.log`.
  - Update dates or status text in `README.md` if the public narrative shifts.
- **Security & access:** Review access lists in your enterprise repo once per quarter; remove inactive collaborators.
- **Backups:** Keep an encrypted off-site backup (e.g., private S3 bucket) of this repo every quarter.

## Evidence of authorship
- Keep your name, year, and version fields in `README.md` current.
- Tag releases with signed tags (e.g., `v1.1-public-safe`) before sharing artifacts.
- When sharing, export PDFs of the landing page and demo screenshots and store them alongside the tag for timestamped evidence.

## Onboarding playbook (when you need to prove capability)
1. Share the repo privately (GitHub Enterprise, invite-only).
2. Point reviewers to `luwo_landing_page.html` for the overview and `luwo_interactive_demo.html` for tangible curves.
3. Offer the sanitized presets only; deeper IP lives elsewhere.
4. Capture feedback and log it in a private issue tracker; only mirror high-level notes back to this repo.

## Exit and archive steps
- Freeze main with branch protection and a final signed tag.
- Archive the GitHub repo (read-only) and store a checksum of the final zip in your off-site backup.
- Keep the HTTP server command and instructions in `README.md` intact for future verification.

## Optional extensions (future collaborator asks)
- Add a short `FAQ.md` that reiterates the public-safe scope and redirects deeper questions to private channels.
- Include a minimal `CHANGELOG.md` that only tracks public-facing edits (docs, static HTML).

Keeping these steps light ensures the project remains a credible, private showcase while you focus on new ventures.
