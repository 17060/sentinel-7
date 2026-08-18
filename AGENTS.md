# AGENTS.md

## Cursor Cloud specific instructions

This repository is a **single static web app** — the entire product is `index.html`
(HTML + CSS + inline vanilla JS). There is **no package manager, no build step, no
backend, no database, and no test suite**. `python3` (already installed) is the only
runtime needed, and it is used purely as a static file server.

### Running the app (development)

Serve the directory over HTTP and open `index.html` — do **not** open it via `file://`,
because the 3D globe textures and several data feeds rely on `http://` + CORS:

```bash
python3 -m http.server 7700    # run from the repo root, then open http://localhost:7700/index.html
```

Port `7700` is just the convention used by `start.command`; any port works.

### Non-obvious notes

- `start.command` is **macOS-only** (uses `zsh`, `lsof`, and `open`). On Linux/cloud,
  ignore it and run `python3 -m http.server` directly as shown above.
- The dashboard fetches ~40+ **public third-party APIs** directly from the browser
  (some through public CORS proxies). **Outbound internet access is required** for panels
  to populate. No API keys of your own are needed (NASA uses `DEMO_KEY`). Individual
  panels degrade gracefully (show "stale/empty" chips) if a feed is unreachable.
- There is **nothing to lint, test, or build**. Deployment is via GitHub Pages
  (`CNAME` → `sentinel7.live`); pushing to the default branch publishes the site.
