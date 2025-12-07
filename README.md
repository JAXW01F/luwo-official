# 🌀 LUWO Golden Curve (JGC)

**Author:** Jax Wolf (JAXW01F)  
**Status:** Public Showcase (audio/visual focus)
**Version:** 1.1
**Year:** 2025

The LUWO Golden Curve (JGC) is a unified geometric framework combining phi-stretched parabolas, fractal golden spirals,
non-Euclidean unit-distance curves, and nature-inspired propagation patterns. This release spotlights music production
and motion-graphics workflows—showing enough to onboard collaborators without exposing the full internal IP.

## 📐 Core Features
- **Golden Ratio Engine:** All curvature behavior scales using φ (1.618…)
- **Fractal Expansion:** Naturally recursive and scalable
- **Unit-Distance Metric:** Blends city-block and non-Euclidean flows
- **Golden Spiral Variant:** Generates phi-based spirals with parabolic amplitude
- **Audio-Friendly Modulation:** Shapes envelopes and LFO curves for organic phasing
- **Visual System Ready:** Drives motion paths, logo arcs, and spline-friendly guides

## 🧠 Applications
- Music production (envelopes, LFO sculpting)
- Motion graphics and logo arcs
- Optics (reflectors, lenses)
- Acoustic chambers & hyperbolic resonance (HRC)
- Signal camouflage & waveform engineering
- AI motion smoothing + predictive pathing
- Spiral growth models for nature/biomimicry

## 🗂️ Project Artifacts
- `luwo_landing_page.html` — project overview tuned for music + graphics onboarding.
- `luwo_interactive_demo.html` — interactive canvas to explore phi-driven spirals and parabolic amplitude effects with audio/visual presets.
- `The LUWO Golden Curve` — text reference describing the curve in prose.

## 🛡️ Public-safe distribution
- The HTML artifacts include `noindex, nofollow` tags to discourage search engines from indexing the showcase.
- Keep this repo private (or a limited-access fork) when mirroring to GitHub Enterprise so collaborators see the sanitized layer only.
- Use the demo presets as-is; they intentionally avoid deeper IP exposed in private automation.

## 🧭 Continuity & exit strategy
- See `STRATEGY.md` for a light-touch plan to keep the repo stable, evidencing authorship while you focus on other ventures.
- Preserve signed tags (e.g., `v1.1-public-safe`) before sharing artifacts and keep branch protection enabled.
- Store periodic offline backups of the repo and PDF exports of the landing page + demo as proof-of-existence.

## 🛠️ Enterprise repo setup
1. Clone to your GitHub Enterprise org (private by default):
   ```bash
   git clone <your-enterprise-url>/luwo-official.git
   cd luwo-official
   ```
2. Confirm the branch name you want to publish (default: the branch you are on):
   ```bash
   git branch --show-current  # e.g., main, work, or release/public-safe
   ```
   - If you want to rename the current branch before sharing, run `git branch -m main` (or your preferred name) first.
3. Add your preferred branch protection and invite-only access lists.
4. Serve the static files locally to review:
   ```bash
   python -m http.server 8000
   ```
5. Open the landing page at `http://localhost:8000/luwo_landing_page.html` or the interactive demo at `http://localhost:8000/luwo_interactive_demo.html`.

## 🤖 Automation helpers
- **Serve locally (foreground):**
  ```bash
  ./scripts/serve.sh
  ```
- **Serve in background with logs:**
  ```bash
  ./scripts/serve.sh --daemon
  tail -f .server.log   # view traffic
  ```
- **Quick health check:** brings up a temporary server, curls both pages, and confirms the `noindex, nofollow` posture.
  ```bash
  ./scripts/healthcheck.sh
  ```

## 🌐 Publish to GitHub (and Pages)
Use this to make the repo visible on GitHub and optionally host the static pages via GitHub Pages. The publish helper now defaults to your *current* branch so you do not lose work when your branch name is `work`, `main`, or something custom. A lightweight `index.html` redirects to `luwo_landing_page.html`, so GitHub Pages visitors will see the curated overview immediately.

1. Point the local repo at your GitHub remote (once per machine):
   ```bash
   git remote add origin <your-github-url>  # skip if already set
   ```
2. Commit any local edits you want to ship:
   ```bash
   git add .
   git commit -m "Sync updates"
   ```
3. Push the branch you are on (or specify one explicitly) to GitHub and keep Pages in sync:
   ```bash
   ./scripts/publish.sh          # uses the current branch
   ./scripts/publish.sh work     # push a specific branch
   ./scripts/publish.sh release origin-enterprise  # custom branch + remote
   ```
   - If the branch does not exist locally, create/checkout it first: `git checkout -b <branch-name>`.
   - The helper sets upstream tracking, so subsequent `git push` will work without flags.
   - After enabling GitHub Pages, the default Pages URL will serve `index.html`, which immediately forwards to `luwo_landing_page.html` (the public-safe overview).
4. (Optional) Enable GitHub Pages:
   - Go to **Settings → Pages** in your repo.
   - Choose **Source: Deploy from a branch** and pick the branch you pushed (e.g., `main` or `work`).
   - Save. Your public-safe landing page will be available at the Pages URL.
5. To verify the live site later, rerun the health check locally (`./scripts/healthcheck.sh`) and spot-check the Pages URL.

## 🚀 Run the HTML demos locally
1. From the repository root, start the lightweight server (or use `./scripts/serve.sh`):
   ```bash
   python -m http.server 8000
   ```
2. Open the landing page: `http://localhost:8000/luwo_landing_page.html`
3. Open the interactive demo: `http://localhost:8000/luwo_interactive_demo.html`

Both pages are fully client-side and require no build tooling.
